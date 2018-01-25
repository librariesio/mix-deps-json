defmodule Mix.Tasks.Server do
  @moduledoc """
    Provides mix task for running server
  """

  use Mix.Task
  alias Plug.Adapters.Cowboy, as: Cowboy

  def run(_) do
    {port, _} = Integer.parse(System.get_env("PORT"))
    {:ok, _} = Cowboy.http(Servelet, [], port: port)
    no_halt()
  end

  defp no_halt do
    unless iex_running?(), do: :timer.sleep(:infinity)
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?()
  end
end
