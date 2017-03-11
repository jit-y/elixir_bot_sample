defmodule Weatherbot do
  use Application

  def start(_type, _args) do
    children = [Plug.Adapters.Cowboy.child_spec(:http, Weatherbot.Router, [], port: 4000)]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
