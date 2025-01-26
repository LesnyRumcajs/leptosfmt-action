[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Leptosfmt%20Action-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=github)](https://github.com/marketplace/actions/leptosfmt-action)

# `leptosfmt` action

This action downloads and runs [leptosfmt] on your Rust codebase. See the [leptosfmt repository][leptosfmt] for more information.

## Passing arguments

`leptosfmt` arguments can be passed to the action via the `args` parameter.

The action also supports some additional arguments.

## Inputs

| Argument           | Default                 | Description                                                                     |
| -------------      | ----------------------- | ------------------------------------------------------------------------------- |
| `args`             | `./**/*.rs --check`     | See [Leptosfmt's documentation][leptosfmt-args] for all arguments and values    |
| `debug`            | `false`                 | Enable debug output in action (set -x). Helpful for troubleshooting             |
| `failOnError`      | `false`                 | Fail workflow run on error (i.e. when leptosfmt exit code is not 0)             |
| `leptosfmtVersion` | `0.1.32`                | Overwrite the `leptosfmt` version to be used                                    |
| `output`           | `leptosfmt_output.txt`  | Output from `leptosfmt` will be written to this file                            |

## Outputs

| Output      | Description                                                                 |
| ----------- | --------------------------------------------------------------------------- |
| `exit_code` | Exit code of `leptosfmt`                                                    |

## Sample workflow

```yaml
name: leptosfmt

on:
  workflow_dispatch:
  pull_request:
  push:

jobs:
  leptosfmt:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: leptosfmt
        uses: LesnyRumcajs/leptosfmt-action@main
```

## Sample workflow with custom arguments

```yaml
name: leptosfmt

on:
  workflow_dispatch:
  pull_request:
  push:

jobs:
  leptosfmt:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: leptosfmt
        id: leptosfmt
        uses: LesnyRumcajs/leptosfmt-action@main
        with:
          failOnError: false
      - name: print outputs
        if: steps.leptosfmt.outputs.exit_code != 0
        run: |
          cat leptosfmt_output.txt
```

## Reporting issues

If you encounter any issues with this action, please report them [here](https://github.com/LesnyRumcajs/leptosfmt-action/issues). If the issue is with `leptosfmt` itself, please report it to the [leptosfmt repository][leptosfmt].

[leptosfmt]: https://github.com/bram209/leptosfmt
[leptosfmt-args]: https://github.com/bram209/leptosfmt?tab=readme-ov-file#usage

