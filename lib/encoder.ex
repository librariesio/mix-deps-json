defmodule Encoder do
  def mixfile_json(dependencies) do
    dependencies
    |> libraries
    |> Poison.encode!
  end

  defp libraries(dependencies) do
    dependencies |> Enum.reduce(%{}, &library/2)
  end

  defp library({name, version}, acc) when is_bitstring(version) do
    acc = Dict.put(acc, name, version)
  end
  defp library({name, details}, acc) do
    acc = Dict.put(acc, name, extract_version(details))
  end
  defp library({_, _, [name, version, _]}, acc) do
    acc = Dict.put(acc, name, version)
  end

  defp extract_version(details) do
    item = Enum.into(details, %{})
    Map.get(item, :tag) || Map.get(item, :branch) || "HEAD"
  end
end
