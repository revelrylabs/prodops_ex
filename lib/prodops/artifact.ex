defmodule ProdopsEx.Artifact do
  @moduledoc false
  alias ProdopsEx.Client
  alias ProdopsEx.Config

  @doc """
  Creates an artifact by submitting a request with the required parameters.

  ## Parameters

    - `prompt_template_id`: id of the prompt template.
    - `project_id`: id of the project.
    - `slug`: slug of the artifact type.
    - `inputs`: A list of custom input fields, each with `name` and `value`.
    - `fire_and_forget` (optional): Flag indicating whether to generate the artifact in the background without waiting for a response.

  ## Examples

      iex> ProdopsEx.Artifacts.create_artifact(%ProdopsEx.Config{
      ...>   bearer_token: "your_api_key_here"
      ...> }, %{
      ...>   prompt_template_id: 2,
      ...>   inputs: [
      ...>     %{name: "Context", value: "this is a test"}
      ...>   ],
      ...>   fire_and_forget: true
      ...> })
      {:ok, %{"artifact_id" => 123, "status" => "created"}}
  """
  @spec create_artifact(
          Config.t(),
          %{prompt_template_id: integer(), slug: String.t(), project_id: integer(), inputs: list()}
        ) :: {:ok, map()} | {:error, term()}
  def create_artifact(
        %Config{} = config,
        %{prompt_template_id: prompt_template_id, slug: slug, project_id: project_id} = params
      ) do
    path = "/api/v1/artifact_types/#{slug}/artifacts?project_id=#{project_id}"
    url = config.api_url <> path
    inputs = Map.get(params, :inputs, [])
    body = %{prompt_template_id: prompt_template_id, inputs: inputs}

    Client.api_post(url, body, config)
  end
end
