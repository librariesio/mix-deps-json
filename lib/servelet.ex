defmodule Servelet do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/lock" do
    {:ok, data, _conn} = Plug.Conn.read_body(conn)

    try do
      json = data
      |> Code.string_to_quoted
      |> Encoder.to_json
      send_resp(conn, 200, json)
    rescue error
      -> send_resp(conn, 422, ":(")
    end
  end


  post "/" do
    {:ok, data, _conn} = Plug.Conn.read_body(conn)

    try do
      json = data
      |> Mixfile.interpret
      |> Encoder.mixfile_json
      send_resp(conn, 200, json)
    rescue error
      -> send_resp(conn, 422, ":(")
    end
  end
end
