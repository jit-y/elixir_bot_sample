defmodule Weatherbot.SlackSender do
  def post_to_slack(encoded_msg) do
    HTTPoison.post(Application.get_env(:weatherbot, :incoming_slack_webhook), encoded_msg)
  end

  def send_msg(msg) do
    Poison.encode!(%{
      "username" => "forecast-bot",
      "icon_emoji" => ":cloud:",
      "text" => msg
    })
    |> post_to_slack
  end
end
