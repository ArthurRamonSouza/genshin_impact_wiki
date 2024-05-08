defmodule Gshimpact do
  @url "https://gsi.fly.dev/"

  # Root
  def root() do
    HTTPoison.get(@url)
    |> get_data()
  end

  # Characters
  def characters(page \\ 1, limit \\ 5) do
    url_with_params = (@url <> "characters?page=#{page}&limit=#{limit}")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  def characters_id(id) do
    url_with_params = @url <> "characters/#{id}"
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  def characters_search(name, region, vision, rarity, weapon, model_type \\ %{}) do
    url_with_params = (@url <> "characters/search?name=#{name}&region=#{region}&vision=#{vision}&rarity=#{rarity}&weapon=#{weapon}&model_type=#{model_type}")
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  def characters_voices(id) do
    url_with_params = @url <> "characters/#{id}/voices"
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
  end

  # Banners
  def banners(page \\ 1, limit \\ 5) do
    url_with_params = (@url <> "banners?page=#{page}&limit=#{limit}")
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  def banners_id(id) do
    url_with_params = @url <> "banners/#{id}"
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  def banners_current() do
    url_with_params = @url <> "banners/current"
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  # Voices
  def voices(page \\ %{}) do
    url_with_params = @url <> "voices?page=#{page}"
    IO.puts("URL com parametros: " <> url_with_params <> "\n")
    HTTPoison.get(url_with_params)
    |> get_data()
  end

  # Getting response data
  defp get_data({:ok, %HTTPoison.Response{status_code: 200, body: response_body}}) do
    response_body
  end

  defp get_data({:ok, %HTTPoison.Response{status_code: _, body: response_body}}) do
    response_body
  end

  defp get_data(%{:error => e}), do: e
end
