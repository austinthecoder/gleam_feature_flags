import gleam/erlang/process.{type Subject}

// import gleam/io
// import gleam/otp/actor
// import gleam/otp/static_supervisor as sup
// import gleam/set

pub type Message {
  IsEnabled(Subject(Bool), Flag)
  // Enable(Flag)
  // Disable(Flag)
  // Shutdown
}

// type App =
//   Subject(Message)

type Flag =
  String

pub fn start() {
  // let assert Ok(app) = set.new() |> actor.start(handle_message)

  // let assert Ok(_) =
  //   sup.new(sup.OneForOne)
  //   |> sup.add(
  //     sup.worker_child("feature_flags", fn() {
  //       let assert Ok(subject) = set.new() |> actor.start(handle_message)
  //       Ok(process.subject_owner(subject))
  //     }),
  //   )
  //   |> sup.start_link

  // sup.worker_child(name, fn() {
  //   let spec = actor.Spec(init: init, init_timeout: 10, loop: loop)
  //   let assert Ok(subject) = actor.start_spec(spec)
  //   Ok(process.subject_owner(subject))
  // })

  // let assert Ok(subject) = set.new() |> actor.start(handle_message)

  // actor.st
  Nil
}

pub fn is_enabled(flag: Flag) {
  let subject = process.new_subject()
  let make_msg = fn(subject) { IsEnabled(subject, flag) }
  let assert Ok(_) = process.receive(subject, 10)
  let assert Ok(_) = process.try_call(subject, make_msg, 10)
  // process.new_subject() |> process.call(make_msg, 10)
}
// pub fn enable(app: App, flag: Flag) {
//   process.send(app, Enable(flag))
// }

// pub fn disable(app: App, flag: Flag) {
//   process.send(app, Disable(flag))
// }

// fn handle_message(message, flags) {
//   io.debug(message)

//   case message {
//     IsEnabled(client, flag) -> {
//       let is_enabled = set.contains(flags, flag)
//       process.send(client, is_enabled)
//       actor.continue(flags)
//     }
//     // Enable(flag) -> flags |> set.insert(flag) |> actor.continue()
//     // Disable(flag) -> flags |> set.delete(flag) |> actor.continue()
//     // Shutdown -> actor.Stop(process.Normal)
//   }
// }
