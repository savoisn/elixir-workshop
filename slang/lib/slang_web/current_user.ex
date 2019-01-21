defmodule SlangWeb.CurrentUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    current_user = Guardian.Plug.current_resource(conn)

    # Assigns the current user if it exists, and whether it is an admin or not
    assign(conn, :current_user, current_user)
  end

end
