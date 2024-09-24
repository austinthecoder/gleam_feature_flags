# Feature Flags

```sh
gleam add feature_flags
```

```gleam
import feature_flags

pub fn main() {
  // Start the app
  let ff = feature_flags.start()

  // Check if a feature flag is enabled
  feature_flags.is_enabled(ff, "feature") // false

  // Enable a flag
  feature_flags.enable(ff, "feature")
  feature_flags.is_enabled(ff, "feature") // true

  // Disable a flag
  feature_flags.disable(ff, "feature")
  feature_flags.is_enabled(ff, "feature") // false
}
```

## Development

```sh
gleam test  # Run the tests
```
