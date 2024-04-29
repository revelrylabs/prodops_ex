defmodule ProdopsEx.Project do
  @moduledoc """
  Handles project operations for the ProdOps API.
  """
  alias ProdopsEx.Client

  @base_path "/api/v1/projects"

  defp url(config) do
    config.api_url <> @base_path
  end

  @doc """
  Returns a list of all projects for a given team

  ## Examples

      iex> ProdopsEx.Project.list()
      {:ok, %{status: "ok", response: %{ "projects": [
            {
              "id": 1,
              "name": "ProdOps",
              "overview": "This is the project overview"
            }
        ]}}}
  """
  @spec list(Keyword.t()) :: {:ok, map} | {:error, any}
  def list(config \\ []) do
    Client.api_get(url(config), config)
  end
end
