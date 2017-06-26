# DrabTestApp

6/26/2017 ... lots changing so this may not be working long, it works with "drab": {:git, "https://github.com/grych/drab.git", "fb149ab10708a2cab0af799d0aaf4a9e9fe2eb15", []},

# drab example app with all goodies like Live!

## to run this example

you likely want to change the salts and security tokens if you plan on using this as a base for something else

`mix deps.get`

`npm install`

`./node_modules/brunch/bin/brunch build`

`iex -S mix phoenix.server`


## howto get something working with drab live

this example is pulled from test/support in the main drab repo test/support which has been placed into <project root>/web.   To reproduce this from the drab repo or to get some other app working you need to do the following

1. do all the normal prep from the drab instructions


2. Need to update the config/<env>.exs to add the following:

```elixir
config :phoenix, :template_engines, drab: Drab.Live.Engine
```

3. Add drab to template extensions TODO: add full example

```elixir
# Watch static and templates for browser reloading.
config :drab_test_app, DrabTestApp.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
````
here
```elixir
      ~r{web/templates/.*(eex|drab)$}
    ]
  ]
```


4. Finally you need to ensure dets is running via the cache server in your application start function or in your supervisor

```elixir
# Start ETS cache
    Drab.Live.Cache.start()
```
