defmodule Lockfile do
  def parse(content) do
    content
    |> Code.string_to_quoted
    |> extract_deps
  end

  defp extract_deps({:ok, {_, _, deps}}), do: extract_deps(deps)
  defp extract_deps(deps) do
    Enum.map(deps, fn({_, {_, _, [source, lib, version]}}) -> {source, lib, version} end)
  end
end
