<div align="center">

# asdf-terracreds [![Build](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/build.yml/badge.svg)](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/build.yml) [![Lint](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/lint.yml/badge.svg)](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/lint.yml)

[Terracreds](https://github.com/tonedefdev/terracreds) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

Plugin:

```shell
asdf plugin add terracreds https://github.com/sergei-ivanov/asdf-terracreds.git
```

Terracreds:

```shell
# Show all installable versions
asdf list-all terracreds

# Install specific version
asdf install terracreds latest

# Set a version globally (on your ~/.tool-versions file)
asdf global terracreds latest

# Now terracreds commands are available
terracreds --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Configuration

Terracreds creates a configuration file, which is stored in the installation directory by default. It won't be migrated
when terracreds is upgraded to the new version.

In order to override the default location of the configuration file, set `TC_CONFIG_PATH` in your environment before
loading asdf.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/sergei-ivanov/asdf-terracreds/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Sergey Ivanov](https://github.com/sergei-ivanov/)
