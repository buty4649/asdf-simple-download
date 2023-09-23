<div align="center">

# asdf-simple-download [![Build](https://github.com/buty4649/asdf-simple-download/actions/workflows/build.yml/badge.svg)](https://github.com/buty4649/asdf-simple-download/actions/workflows/build.yml) [![Lint](https://github.com/buty4649/asdf-simple-download/actions/workflows/lint.yml/badge.svg)](https://github.com/buty4649/asdf-simple-download/actions/workflows/lint.yml)

[simple-download](https://github.com/buty4649/asdf-simple-download/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add simple-download
# or
asdf plugin add simple-download https://github.com/buty4649/asdf-simple-download.git
```

simple-download:

```shell
# Show all installable versions
asdf list-all simple-download

# Install specific version
asdf install simple-download latest

# Set a version globally (on your ~/.tool-versions file)
asdf global simple-download latest

# Now simple-download commands are available
simple-download --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/buty4649/asdf-simple-download/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [buty4649](https://github.com/buty4649/)
