defmodule ProdopsEx.ArtifactType do
  @moduledoc """
  Handles artifact type operations for the ProdOps API.
  """
  alias ProdopsEx.Client

  @base_path "/api/v1/artifact_types"

  @doc """
  Returns a list of all artifact types for a given team

  ## Examples

      iex> ProdopsEx.ArtifactType.list(%ProdopsEx.Config{bearer_token: "your_api_key_here"})
      {:ok, %{status: "ok", response: %{ "artifact_types": [
            {
                "slug": "story",
                "name": "Story",
                "description": "This is a story"
            }
        ]}}}
  """
  @spec list(Keyword.t()) :: {:ok, map} | {:error, any}
  def list(config) do
    Client.api_get(url(config), config)
  end

  defp url(config) do
    config.api_url <> @base_path
  end
end
