defmodule Mixcord.Rest do
  @moduledoc false

  @version Mixcord.Mixfile.project[:version]

  use HTTPoison.Base
  alias Mixcord.Constants

  defp process_url(url) do
    Constants.base_url <> url
  end

  defp process_request_body(body) do
    case body do
      "" ->
        ""
      _ ->
        Poison.encode!(body)
    end
  end

  defp process_request_headers(headers) do
    [{"User-Agent", "DiscordBot (https://github.com/kraigie/mixcord, #{@version})"} | headers]
    [{"content-type", "application/json"} | headers]
  end

  defp process_response_body(body) do
    body
  end

end