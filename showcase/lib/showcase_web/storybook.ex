defmodule ShowcaseWeb.Storybook do
  use PhoenixStorybook,
    otp_app: :showcase,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/css/storybook.css",
    js_path: "/assets/js/storybook.js",
    sandbox_class: "showcase"
end
