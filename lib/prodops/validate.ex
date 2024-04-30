defmodule ProdopsEx.Validate do
  @moduledoc """
  Handles validation operations for the ProdOps API.
  """
  alias ProdopsEx.Client
  alias ProdopsEx.Config

  @base_path "/api/v1/validate"

  @doc """
  Validates the provided API key and returns team information.

  ## Parameters

  - `config`: The configuration map containing the API key and endpoint URL.

  ## Example

      iex> ProdopsEx.Validate.validate_api_key(%ProdopsEx.Config{bearer_token: "your_api_key_here"})
      {:ok, %{status: "ok", response: %{"team_id" => 1, "team_name" => "ProdOps"}}}
  """
  @spec validate_api_key(Keyword.t()) :: {:ok, map} | {:error, any}
  def validate_api_key(config) do
    config = Config.resolve_config(config)
    Client.api_post(url(config), [], config)
  end

  defp url(config) do
    config[:api_url] <> @base_path
  end
end
