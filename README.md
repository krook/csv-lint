# CSV lint Docker action

This action validates a given comma-separated values file.

This modified action is based on code originally created by the authors in the [license](https://github.com/krook/csv-lint/blob/main/LICENSE).

## Inputs

## `CSV_FILE`

**Required** The path of the file to validate.

## Example usage

```yaml
on: 
  pull_request:
    paths:
      - 'file.csv'

jobs:
  verify-cvs-validation:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Validate CSV
        uses: krook/csv-lint@main
        env:
          CSV_FILE: "file.csv"
```
