defmodule SlangWeb.LoginControllerTest do
  use SlangWeb.ConnCase

  alias Slang.Accounts

  @create_attrs %{email: "some email", password: "some password", remember_me: true}
  @update_attrs %{email: "some updated email", password: "some updated password", remember_me: false}
  @invalid_attrs %{email: nil, password: nil, remember_me: nil}

  def fixture(:login) do
    {:ok, login} = Accounts.create_login(@create_attrs)
    login
  end

  describe "index" do
    test "lists all logins", %{conn: conn} do
      conn = get(conn, Routes.login_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Logins"
    end
  end

  describe "new login" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.login_path(conn, :new))
      assert html_response(conn, 200) =~ "New Login"
    end
  end

  describe "create login" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.login_path(conn, :create), login: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.login_path(conn, :show, id)

      conn = get(conn, Routes.login_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Login"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.login_path(conn, :create), login: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Login"
    end
  end

  describe "edit login" do
    setup [:create_login]

    test "renders form for editing chosen login", %{conn: conn, login: login} do
      conn = get(conn, Routes.login_path(conn, :edit, login))
      assert html_response(conn, 200) =~ "Edit Login"
    end
  end

  describe "update login" do
    setup [:create_login]

    test "redirects when data is valid", %{conn: conn, login: login} do
      conn = put(conn, Routes.login_path(conn, :update, login), login: @update_attrs)
      assert redirected_to(conn) == Routes.login_path(conn, :show, login)

      conn = get(conn, Routes.login_path(conn, :show, login))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, login: login} do
      conn = put(conn, Routes.login_path(conn, :update, login), login: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Login"
    end
  end

  describe "delete login" do
    setup [:create_login]

    test "deletes chosen login", %{conn: conn, login: login} do
      conn = delete(conn, Routes.login_path(conn, :delete, login))
      assert redirected_to(conn) == Routes.login_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.login_path(conn, :show, login))
      end
    end
  end

  defp create_login(_) do
    login = fixture(:login)
    {:ok, login: login}
  end
end
