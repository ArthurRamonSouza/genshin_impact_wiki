defmodule GenshinImpactWikiWeb.BannerHTML do
  use GenshinImpactWikiWeb, :html

  embed_templates "banner_html/*"

  @doc """
  Renders a banner form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def banner_form(assigns)
end
