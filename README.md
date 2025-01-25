[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Leptosfmt%20Action-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=github)](https://github.com/marketplace/actions/leptosfmt-action)

# `leptosfmt` action

This action downloads runs `leptosfmt` on your repository.

## Passing arguments

This action uses [leptosfmt](https://github.com/bram209/leptosfmt) for link checking.
`leptosfmt` arguments can be passed to the action via the `args` parameter.

On top of that, the action also supports some additional arguments.

| Argument         | Default                 | Description                                                                     |
| -------------    | ----------------------- | ------------------------------------------------------------------------------- |
| args             | `./**/*.rs --check`     | See [Leptosfmt's documentation][leptosfmt-args] for all arguments and values    |
| debug            | `false`                 | Enable debug output in action (set -x). Helpful for troubleshooting             |
| failOnError      | `false`                 | Fail workflow run on error (i.e. when leptosfmt exit code is not 0)             |
| leptosfmtVersion | `0.1.32`                | Overwrite the `leptosfmt` version to be used                                    |
| output           | `leptosfmt_output.txt`  | Output from `leptosfmt` will be written to this file                            |

[leptosfmt-args]: https://github.com/bram209/leptosfmt?tab=readme-ov-file#usage

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
        id: leptosfmt
        uses: LesnyRumcajs/leptosfmt-action@main
        with:
          failOnError: false
      - name: print outputs
        if: steps.leptosfmt.outputs.exit_code != 0
        run: |
          cat leptosfmt_output.txt
```
