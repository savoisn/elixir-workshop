# Slang

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Entity generation

```
mix phx.gen.html Chat Room rooms name:string description:string
mix phx.gen.html Chat Message messages text:string sender_id:references:users room_id:references:rooms
```

```
mix phx.gen.html Account UserType usertypes type:string
mix phx.gen.html Account User users name:string email:string adress:string user_type_id:references:usertypes
```


