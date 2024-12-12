// import feature_flags
// import gleam/io
import example
import gleeunit

// import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// pub fn flags_are_disabled_by_default_test() {
//   // feature_flags.start()
//   "feature" |> feature_flags.is_enabled() |> io.debug()
// }

pub fn example_test() {
  example.main()
}
// pub fn flags_can_be_enabled_test() {
//   let app = feature_flags.start()
//   feature_flags.enable(app, "feature")
//   app |> feature_flags.is_enabled("feature") |> should.be_true()
// }

// pub fn flags_can_be_disabled_test() {
//   let app = feature_flags.start()
//   feature_flags.enable(app, "feature")
//   feature_flags.disable(app, "feature")
//   app |> feature_flags.is_enabled("feature") |> should.be_false()
// }
