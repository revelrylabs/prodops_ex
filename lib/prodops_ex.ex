defmodule ProdopsEx do
  @moduledoc """
  Documentation for `ProdopsEx`.
  """

  alias ProdopsEx.Validate

  @doc """
  Validates the provided API key and return team information.

  ## Parameters

  - `config`: The configuration map to be validated. This should include all required keys and values as defined by the system's requirements.

  ## Example
  ```elixir
  ProdopsEx.validate(
    %ProdopsEx.Config{
      bearer_token: "your_api_key_here",
    }
  )
  ```

  ## Returns
  {:ok, %{status: "ok", response: %{"team_id" => 40, "team_name" => "ProdOps Demos"}}}
  """
  def validate(config) do
    Validate.validate(config)
  end
end
