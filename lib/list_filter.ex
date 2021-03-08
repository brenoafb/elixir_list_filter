defmodule ListFilter do
  @moduledoc """
  Documentation for `ListFilter`.
  """

  require Integer

  @doc """
  Given a list of strings, return how many elements correspond
  to an odd number.

  ## Examples

      iex> ListFilter.call(["1", "3", "6", "43", "banana", "6", "abc"])
      3
      iex> ListFilter.call(["2", "4", "banana"])
      0

  """
  def call(list) do
    list
    |> Enum.map(fn x -> read_integer(x) end)
    |> Enum.filter(fn x -> predicate(x) end)
    |> length()
  end

  defp predicate({:ok, int}), do: int |> Integer.is_odd()
  defp predicate({:error, _e}), do: false

  defp read_integer(str) do
    try do
      str
      |> String.to_integer()
      |> (fn x -> {:ok, x} end).()
    rescue
      e in ArgumentError -> {:error, e}
    end
  end
end
