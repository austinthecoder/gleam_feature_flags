import gleam/erlang/process.{type Subject}
import gleam/otp/actor
import gleam/set

pub type Message {
  IsEnabled(Subject(Bool), Flag)
  Enable(Flag)
  Disable(Flag)
  Shutdown
}

type App =
  Subject(Message)

type Flag =
  String

pub fn start() {
  let assert Ok(app) = set.new() |> actor.start(handle_message)
  app
}

pub fn is_enabled(app: App, flag: Flag) {
  let make_msg = fn(client) { IsEnabled(client, flag) }
  process.call(app, make_msg, 10)
}

pub fn enable(app: App, flag: Flag) {
  process.send(app, Enable(flag))
}

pub fn disable(app: App, flag: Flag) {
  process.send(app, Disable(flag))
}

fn handle_message(message, flags) {
  case message {
    IsEnabled(client, flag) -> {
      let is_enabled = set.contains(flags, flag)
      process.send(client, is_enabled)
      actor.continue(flags)
    }

    Enable(flag) -> flags |> set.insert(flag) |> actor.continue()
    Disable(flag) -> flags |> set.delete(flag) |> actor.continue()
    Shutdown -> actor.Stop(process.Normal)
  }
}
