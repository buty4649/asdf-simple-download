# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test simple-download https://github.com/buty4649/asdf-simple-download.git "simple-download --help"
```

Tests are automatically run in GitHub Actions on push and PR.
