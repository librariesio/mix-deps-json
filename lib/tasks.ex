defmodule Mix.Tasks.Server do
  use Mix.Task

  def run(_) do
    {port, _} = Integer.parse(System.get_env("PORT"))
    {:ok, _} = Plug.Adapters.Cowboy.http Servelet, [], port: port
    no_halt
  end

  defp no_halt do
    unless iex_running?, do: :timer.sleep(:infinity)
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?
  end
end
