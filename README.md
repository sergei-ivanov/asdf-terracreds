<div align="center">

# asdf-terracreds [![Build](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/build.yml/badge.svg)](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/build.yml) [![Lint](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/lint.yml/badge.svg)](https://github.com/sergei-ivanov/asdf-terracreds/actions/workflows/lint.yml)

[terracreds](https://github.com/tonedefdev/terracreds) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add terracreds
# or
asdf plugin add terracreds https://github.com/sergei-ivanov/asdf-terracreds.git
```

terracreds:

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

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/sergei-ivanov/asdf-terracreds/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Sergey Ivanov](https://github.com/sergei-ivanov/)
