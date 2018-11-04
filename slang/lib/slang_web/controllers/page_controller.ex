defmodule SlangWeb.PageController do
  use SlangWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
