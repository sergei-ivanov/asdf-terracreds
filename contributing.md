# Contributing

Testing Locally:

```shell
asdf plugin test terracreds https://github.com/sergei-ivanov/asdf-terracreds.git "terracreds --version"
```

If you have a local checkout, you can test your changes (all changes must be committed):

```shell
asdf plugin test terracreds file://$(pwd) "terracreds --version"
```

Tests are automatically run in GitHub Actions on push and PR.
