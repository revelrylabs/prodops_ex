defmodule ProdopsEx.Artifact do
  @moduledoc """
  Handles artifact operations for the ProdOps API such as retrieving artifacts for a given project, creating artifacts, refining artifacts, and deleting artifacts.
  """
  alias ProdopsEx.Client
  alias ProdopsEx.Config

  @base_path "/api/v1/artifact_types"

  def url(%{project_id: project_id, slug: slug}, %Config{} = config) do
    config.api_url <> @base_path <> "/#{slug}/artifacts?project_id=#{project_id}"
  end

  @doc """
  Retrieves artifacts for a given project.

  ## Parameters

  - `params`: The parameters for the artifact request.
  - `config`: The configuration map containing the API key and endpoint URL.

  ## Example

      iex> ProdopsEx.get_artifacts_for_project(%{project_id: 1, slug: "story"}, %ProdopsEx.Config{bearer_token: "your_api_key_here"})
      {:ok,
        %{
          status: "ok",
          response: %{
            "artifacts" => [
              %{
                "chat_history" => [
                  %{
                    "content" => "You are going to be a product manager and write a BDD-style user story...",
                    "role" => "user"
                  },
                  ...
                ],
                "content" => "## Background ...",
                "id" => 1,
                "manually_edited" => false,
                "name" => "Artifact Name",
                "notes" => nil,
                "share_token" => nil
              },
              ...
            ]
          }
        }}

  ## Returns
  The function should return a list of artifacts for the specified project.
  """
  @spec get_artifacts_for_project(map, %Config{}) :: {:ok, list} | {:error, any}
  def get_artifacts_for_project(params, %Config{} = config) do
    endpoint = url(params, config)
    Client.api_get(endpoint, config)
  end

  @doc """
  Creates an artifact by submitting a request with the required parameters.

  ## Parameters

    - `params`: The parameters for the artifact request.
    - `config`: The configuration map containing the API key and optionally the URL.

  ## Examples

      iex> ProdopsEx.Artifacts.create_artifact(%ProdopsEx.Config{
      ...>   bearer_token: "your_api_key_here"
      ...> }, %{
      ...>   prompt_template_id: 2,
      ...>   slug: "story",
      ...>   inputs: [
      ...>     %{name: "Context", value: "this is a test"}
      ...>   ],
      ...>   fire_and_forget: true
      ...> })
      {:ok, %{"artifact_id" => 123, "status" => "created"}}
  """
  @spec create_artifact(
          %{
            prompt_template_id: integer(),
            slug: String.t(),
            project_id: integer(),
            inputs: list(),
            fire_and_forget: boolean()
          },
          %Config{}
        ) :: {:ok, map()} | {:error, term()}
  def create_artifact(%{prompt_template_id: prompt_template_id} = params, %Config{} = config) do
    url = url(params, config)
    fire_and_forget = Map.get(params, :fire_and_forget, false)
    inputs = Map.get(params, :inputs, [])
    body = %{prompt_template_id: prompt_template_id, inputs: inputs, fire_and_forget: fire_and_forget}

    Client.api_post(url, body, config)
  end
end
