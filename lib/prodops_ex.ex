defmodule ProdopsEx do
  @moduledoc """
  Documentation for `ProdopsEx`.
  """

  alias ProdopsEx.Validate

  @doc """
  Hello world.

  ## Examples

      iex> ProdopsEx.hello()
      :world

  """
  def hello do
    :world
  end

  def validate(config) do
    Validate.validate(config)
  end
end
