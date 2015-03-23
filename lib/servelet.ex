defmodule Servelet do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/" do
    {:ok, data, _conn} = Plug.Conn.read_body(conn)

    try do
      json = data
      |> Parser.interpret
      |> Encoder.to_json
      send_resp(conn, 200, json)
    rescue error
      -> send_resp(conn, 422, ":(")
    end
  end
end
