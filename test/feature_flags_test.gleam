import feature_flags
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn flags_are_disabled_by_default_test() {
  feature_flags.start()
  |> feature_flags.is_enabled("feature")
  |> should.be_false()
}

pub fn flags_can_be_enabled_test() {
  let app = feature_flags.start()
  feature_flags.enable(app, "feature")
  app |> feature_flags.is_enabled("feature") |> should.be_true()
}

pub fn flags_can_be_disabled_test() {
  let app = feature_flags.start()
  feature_flags.enable(app, "feature")
  feature_flags.disable(app, "feature")
  app |> feature_flags.is_enabled("feature") |> should.be_false()
}
