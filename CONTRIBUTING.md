# Contributing and Development

## API Key

You'll need a [ProdOps API key](https://help.prodops.ai/docs/api/get-your-api-token)
to get started. Copy `config/config.example-secret.exs` to
`config/config.secret.exs` and put your API key into that file.

## Development Setup

1. Make sure you have Elixir 1.16+ installed
1. Clone the repo
1. Run `mix deps.get`
1. Run `mix test`

## Submitting Changes

1. Fork the project
1. Create a new topic branch to contain your feature, change, or fix.
1. Make sure all the tests are still passing.
1. Implement your feature, change, or fix. Make sure to write tests, update and/or add documentation.
1. Push your topic branch up to your fork.
1. Open a Pull Request with a clear title and description.