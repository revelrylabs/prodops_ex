defmodule ProdopsEx.Config do
  @moduledoc """
  Defines the configuration structure for interacting with the ProdOps API.
  """

  defstruct api_url: "https://app.prodops.ai",
            bearer_token: nil,
            http_options: [recv_timeout: :infinity]

  @doc """
  Creates a new Config struct from a keyword list.
  """
  def new(opts \\ []) do
    Enum.into(opts, %__MODULE__{})
  end

  definition = [
    api_url: [
      type: :string,
      default: "https://app.prodops.ai"
    ],
    bearer_token: [
      type: :string,
      required: true
    ]
  ]
end
