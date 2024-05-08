defmodule GenshinImpactWiki.Repo do
  use Ecto.Repo,
    otp_app: :genshin_impact_wiki,
    adapter: Ecto.Adapters.Postgres
end
