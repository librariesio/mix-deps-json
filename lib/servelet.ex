defmodule Servelet do
  @moduledoc """
    Provides main routes for server endpoints
  """

  use Plug.Router
  alias Plug.Conn, as: Conn

  plug(:match)
  plug(:dispatch)

  get "/" do
    {:ok, data, _conn} = Conn.read_body(conn)
    send_resp(conn, 200, "OK")
  end

  post "/lock" do
    {:ok, data, _conn} = Conn.read_body(conn)

    try do
      json =
        data
        |> Lockfile.parse()
        |> Encoder.lockfile_json()

      send_resp(conn, 200, json)
    rescue
      _error ->
        send_resp(conn, 422, ":(")
    end
  end

  post "/" do
    {:ok, data, _conn} = Conn.read_body(conn)

    try do
      json =
        data
        |> Mixfile.parse()
        |> Encoder.mixfile_json()

      send_resp(conn, 200, json)
    rescue
      _error ->
        send_resp(conn, 422, ":(")
    end
  end
end
