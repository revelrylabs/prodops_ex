defmodule ProdopsEx.Config do
  @moduledoc """
  Defines the configuration structure for interacting with the ProdOps API.
  """

  defstruct api_url: "https://app.prodops.ai",
            bearer_token: nil,
            http_options: [recv_timeout: :infinity]
end
