defmodule SlangWeb.Guardian.AuthBrowserPipeline do
  use Guardian.Plug.Pipeline, otp_app: :Slang,
  module: Slang.Guardian,
  error_handler: Slang.AuthErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug SlangWeb.CurrentUser
end

