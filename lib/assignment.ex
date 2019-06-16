defmodule Assignment do
  alias Assignment.Page
  require Logger

  def fetch(url) do
    case HTTPoison.get(url) do
      {:ok, html} ->
        assets = Floki.attribute(html.body, "img", "src")
        links = Floki.attribute(html.body, "a", "href")
        Page.to_struct(assets, links)

      {:error, reason} ->
        Logger.error("Incorrect url")
        {:error, reason}
    end
  end
end
