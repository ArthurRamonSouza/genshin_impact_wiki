defmodule GenshinImpactWikiWeb.FeatureHTML do
  use GenshinImpactWikiWeb, :html

  embed_templates "feature_html/*"

  @doc """
  Renders a feature form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def feature_form(assigns)
end
