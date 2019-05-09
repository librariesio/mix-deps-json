defmodule Lockfile do
  @moduledoc """
    Provides mix.lock dependency parser
  """

  @spec parse(charlist) :: map
  def parse(content) do
    content
    |> Code.string_to_quoted()
    |> extract_deps
  end

  defp extract_deps({:ok, {_, _, deps}}), do: extract_deps(deps)

  defp extract_deps(deps) do
    Enum.map(deps, &extract_dep/1)
  end

  defp extract_dep({_, {_, _, [source, lib, version, _, _, _]}}) do
    {source, lib, version}
  end

  defp extract_dep({_, {_, _, [source, lib, version, _]}}) do
    {source, lib, version}
  end

  defp extract_dep({_, {_, _, [source, lib, version]}}) do
    {source, lib, version}
  end

  defp extract_dep({_, {_, _, [source, lib, version, _, _, _, _]}}) do
    {source, lib, version}
  end
end
