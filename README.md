# DrabTestApp


drab example app with all goodies


## howto

this is pulled from test/support in the main drab repo. To get it working from the drab repo or to get some other app working you need to do the following


Need to update the config/<env>.exs to add the following:

```elixir
config :phoenix, :template_engines, drab: Drab.Live.Engine
```

... add drab to template extensions TODO: add full example

```elixir
# Watch static and templates for browser reloading.
config :drab_test_app, DrabTestApp.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
`
here
```elixir
      ~r{web/templates/.*(eex|drab)$}
    ]
  ]
```


Finally you need to ensure dets is running via the cache server in your application start function or in your supervisor

```elixir
# Start ETS cache
    Drab.Live.Cache.start()
```
