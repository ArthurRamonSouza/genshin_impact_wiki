defmodule GenshinImpactWikiWeb.VoiceHTML do
  use GenshinImpactWikiWeb, :html

  embed_templates "voice_html/*"

  @doc """
  Renders a voice form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def voice_form(assigns)
end
