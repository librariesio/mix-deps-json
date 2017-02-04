defmodule Encoder do
  @moduledoc """
    Provides map to json encoder
  """

  @spec mixfile_json(map) :: charlist
  def mixfile_json(dependencies) do
    dependencies
    |> libraries
    |> Poison.encode!
  end

  defp libraries(dependencies) do
    dependencies |> Enum.reduce(%{}, &library/2)
  end

  defp library({name, version}, acc) when is_bitstring(version) do
    Map.put(acc, name, version)
  end
  defp library({name, details}, acc) do
    Map.put(acc, name, extract_version(details))
  end
  defp library({_, _, [name, version, _]}, acc) do
    Map.put(acc, name, version)
  end

  defp extract_version(details) do
    item = Enum.into(details, %{})
    Map.get(item, :tag) || Map.get(item, :branch) || "HEAD"
  end

  @spec lockfile_json(map) :: charlist
  def lockfile_json(dependencies) do
    dependencies
    |> deps
    |> Poison.encode!
  end

  defp deps(deps) do
    deps
    |> Enum.reduce(%{}, fn
      {source, lib, version}, acc -> Map.put(acc, lib, %{source: source,
                                                         version: version})
    end)
  end
end
