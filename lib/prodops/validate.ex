defmodule ProdopsEx.Validate do
  @moduledoc """
  Handles validation operations for the ProdOps API.
  """
  alias ProdopsEx.Client

  @base_url "/api/v1/validate"

  def url(config) do
    config.api_url <> @base_url
  end

  def validate(config) do
    Client.api_post(url(config), [], config)
  end
end
