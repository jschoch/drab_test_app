defmodule DrabTestApp.Broadcast3Commander do
  @moduledoc false
  
  use Drab.Commander, modules: [Drab.Query, Drab.Modal]

  onload :page_loaded
  onconnect :connected
  broadcasting "my_topic"

  def page_loaded(socket) do
    exec_js! socket, "window.$ = jQuery"
    socket |> Drab.Query.insert("<h3 id='page_loaded_indicator'>Page Loaded</h3>", after: "#begin")
    socket |> Drab.Query.insert("<h5>Drab Broadcast Topic: #{__drab__().broadcasting |> inspect}</h5>", 
      after: "#page_loaded_indicator")
    p = inspect(socket.assigns.__drab_pid)
    pid_string = Regex.named_captures(~r/#PID<(?<pid>.*)>/, p) |> Map.get("pid")
    socket |> Drab.Query.update(:text, set: pid_string, on: "#drab_pid")
  end

  def connected(socket) do
    exec_js! socket, "window.$ = jQuery"
    socket |> Drab.Query.update(:text, set: "", on: "#broadcast_out")
  end

  def broadcast3(socket, _) do
    socket |> update!(:text, set: "Broadcasted Text to the topic", on: "#broadcast_out")
  end
end
