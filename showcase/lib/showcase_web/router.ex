defmodule ShowcaseWeb.Router do
  use ShowcaseWeb, :router
  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShowcaseWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", ShowcaseWeb do
    pipe_through(:browser)
    live_storybook("/storybook", backend_module: ShowcaseWeb.Storybook)
  end
end
