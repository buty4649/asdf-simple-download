<div align="center">

# asdf-simple-download [![Build](https://github.com/buty4649/asdf-simple-download/actions/workflows/build.yml/badge.svg)](https://github.com/buty4649/asdf-simple-download/actions/workflows/build.yml) [![Lint](https://github.com/buty4649/asdf-simple-download/actions/workflows/lint.yml/badge.svg)](https://github.com/buty4649/asdf-simple-download/actions/workflows/lint.yml)

[simple-download](https://github.com/buty4649/asdf-simple-download/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Usage](#usage)
- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Usage

asdf-simple-download is an asdf plugin that allows asdf to handle download files from any arbitrary URL. It enables you to easily add any software for which an asdf plugin does not exist to asdf.

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Install plugin:

```shell
# require: Set the URL of the archive file to be downloaded.
export ASDF_PLUGIN_DOWNLOAD_URL=https://example.com/example-software-1.0.0.tar.gz

# Set an arbitrary plugin name
export PLUGIN_NAME=example

asdf plugin add $PLUGIN_NAME https://github.com/buty4649/asdf-simple-download.git
```

Use plugin:

```shell
# Show all installable versions
asdf list-all $PLUGIN_NAME

# Install specific version
asdf install $PLUGIN_NAME latest

# Set a version globally (on your ~/.tool-versions file)
asdf global $PLUGIN_NAME latest

# Now simple-download commands are available
$PLUGIN_NAME --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/buty4649/asdf-simple-download/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [buty4649](https://github.com/buty4649/)
