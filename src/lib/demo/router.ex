defmodule Demo.Router do
  use Plug.Router

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug :match
  plug :dispatch

  forward "/",
    to: Absinthe.Plug,
    init_opts: [schema: Demo.Schema]
end
