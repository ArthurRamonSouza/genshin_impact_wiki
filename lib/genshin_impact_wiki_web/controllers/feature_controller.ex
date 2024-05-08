defmodule GenshinImpactWikiWeb.FeatureController do
  use GenshinImpactWikiWeb, :controller

  alias GenshinImpactWiki.Genshin
  alias GenshinImpactWiki.Genshin.Feature

  def index(conn, _params) do
    features = Genshin.list_features()
    render(conn, :index, features: features)
  end

  def new(conn, _params) do
    changeset = Genshin.change_feature(%Feature{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"feature" => feature_params}) do
    case Genshin.create_feature(feature_params) do
      {:ok, feature} ->
        conn
        |> put_flash(:info, "Feature created successfully.")
        |> redirect(to: ~p"/features/#{feature}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    feature = Genshin.get_feature!(id)
    render(conn, :show, feature: feature)
  end

  def edit(conn, %{"id" => id}) do
    feature = Genshin.get_feature!(id)
    changeset = Genshin.change_feature(feature)
    render(conn, :edit, feature: feature, changeset: changeset)
  end

  def update(conn, %{"id" => id, "feature" => feature_params}) do
    feature = Genshin.get_feature!(id)

    case Genshin.update_feature(feature, feature_params) do
      {:ok, feature} ->
        conn
        |> put_flash(:info, "Feature updated successfully.")
        |> redirect(to: ~p"/features/#{feature}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, feature: feature, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    feature = Genshin.get_feature!(id)
    {:ok, _feature} = Genshin.delete_feature(feature)

    conn
    |> put_flash(:info, "Feature deleted successfully.")
    |> redirect(to: ~p"/features")
  end
end
