# File Input Plugin

The file plugin parses the **complete** contents of a file **every interval** using
the selected [input data format][].

**Note:** If you wish to parse only newly appended lines use the [tail][] input
plugin instead.

### Configuration:

```toml
[[inputs.file]]
  files = ["/path/to/factorio/script-output/zzzmetrics.stat"]
  data_format = "influx"
```

