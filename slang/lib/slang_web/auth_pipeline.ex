defmodule Slang.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :Slang,
  module: Slang.Guardian,
  error_handler: Slang.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
