#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/tonedefdev/terracreds"
TOOL_NAME="terracreds"
TOOL_TEST="terracreds --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if terracreds is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

get_platform() {
	local -r kernel="$(uname -s)"
	if [[ "${OSTYPE}" == "msys" || "${kernel}" == "CYGWIN"* || "${kernel}" == "MINGW"* ]]; then
		echo "windows"
	else
		uname | tr '[:upper:]' '[:lower:]'
	fi
}
get_arch() {
	local -r machine="$(uname -m)"
	if [[ "${machine}" == "x86_64" ]]; then
		echo "amd64"
	elif [[ "${machine}" == "arm64" ]] || [[ "${machine}" == "aarch64" ]]; then
		echo "arm64"
	else
		echo "386"
	fi
}

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url arch platform
	version="$1"
	filename="$2"

	arch="$(get_arch)"
	platform="$(get_platform)"

	# For example:
	# https://github.com/tonedefdev/terracreds/releases/download/v2.1.5/terracreds_2.1.5_darwin_arm64.tar.gz
	# https://github.com/tonedefdev/terracreds/releases/download/v2.1.5/terracreds_2.1.5_linux_amd64.tar.gz
	url="$GH_REPO/releases/download/v${version}/terracreds_${version}_${platform}_${arch}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"
	local config_path="${3%/bin}/config"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		mkdir -p "$config_path"
		cp "$ASDF_DOWNLOAD_PATH"/terracreds* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
