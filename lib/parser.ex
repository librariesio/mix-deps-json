defmodule Parser do
  def interpret(mixes) do
    mixes
    |> Code.string_to_quoted
    |> extract_module
    |> extract_calls
    |> extract_deps
  end

  defp extract_module({:ok, {:defmodule, _, content}}), do: content

  defp extract_calls([_|[[do: {:__block__, _, calls}]|_]]), do: calls

  defp extract_deps({:defp, _, [{:deps, _, _}, [do: dependencies]]}, _), do: dependencies
  defp extract_deps(_, tail), do: tail |> extract_deps
  defp extract_deps([head|tail]), do: extract_deps(head, tail)
end
