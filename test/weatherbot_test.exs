defmodule WeatherbotTest do
  use ExUnit.Case
  use Plug.Test

  doctest Weatherbot

  alias Weatherbot.Router

  @opts Router.init([])

  test "responds to greeting" do
    conn = conn(:post, "/webhook", "")
           |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "ohai"
  end
end
