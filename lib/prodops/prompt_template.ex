defmodule ProdopsEx.PromptTemplate do
  @moduledoc """
  Handles prompt template operations for the ProdOps API.

  Prompt Templates are the building blocks used for generating Artifacts.

  They are a combination of hard-coded information and variables which represent
  data that can be inserted. They are the basic building block for setting up
  repeatable workflows to generate Artifacts.

  They may look something like this:

  ```
  You are a helpful assistant. A user has asked a question about company
  policies, which you must answer. This is their question:

  {custom.Question}

  Use this information to answer the question:

  {query.Company Policies}
  ```

  The value `{custom.Question}` can be explicitly passed into the template
  when generating a new Artifact.

  The value `{query.Company Policies}` will automatically find relevant
  information by checking the value of an explicit input such as
  `{custom.Question}`, and can search through all Documents or a collection of
  Documents. In this example, it might search a collection of employee manuals,
  playbooks, etc., and will calculate the most semantically similar values
  between their sections and the user's question, which is the value input into
  `{custom.Question}`. This technique is known as Retrieval-Augmented
  Generation.

  For more information, see the [ProdOps.AI Prompts help page](https://help.prodops.ai/docs/category/prompts).
  """
  alias ProdopsEx.Client
  alias ProdopsEx.Config

  @base_path "/api/v1/artifact_types"

  @doc """
  Retrieves prompt templates for a given artifact type.

  ## Parameters

  - `artifact_slug`: the type of prompt templates to return from the request
  - `config` (optional): a configuration map used to override default config values

  ## Example

      iex> ProdopsEx.PromptTemplate.list("story")
      {:ok,
        %{
          status: "ok",
          response: %{
            "prompt_templates" => [
              {
                "id": 3,
                "name": "Example Prompt",
                "content": "This is an example prompt template body",
                "description": "This is an example prompt template",
                "custom_variables": [
                    {
                        "id": "df57af61-7741-4152-b5eb-0484b281eaaa",
                        "name": "Example Input",
                        "description": null
                    }
                ],
                "document_queries": [
                    {
                        "id": "dcbbc393-9f00-4020-a150-ac5fa5f66095",
                        "name": "Example Document Query",
                        "query": "{custom.Example Input}",
                        "count": 1,
                        "type": "code",
                        "min_score": 0.75,
                        "collection_id": null,
                        "collection_ids": []
                    }
                ]
            },
              ...
            ]
          }
        }}

  ## Returns
  The function returns a list of prompt templates for the specified artifact type.
  """
  @spec list(String.t(), Keyword.t()) :: {:ok, list} | {:error, any}
  def list(artifact_slug, config \\ []) when is_binary(artifact_slug) do
    config = Config.resolve_config(config)
    endpoint = url(config) <> "/#{artifact_slug}/prompt_templates"
    Client.api_get(endpoint, config)
  end

  defp url(config) do
    config[:api_url] <> @base_path
  end
end
