This can be used for factorio running on a server. It will always export it to `{factorio-path}/script-output/zzzmetrics.stat`
If directory `script-output` not exist - you need to create it.

For parsing metrics you can use [telegraf](https://github.com/influxdata/telegraf/releases). Just add to `/etc/telegraf.conf` something like this:

```toml
[[inputs.file]]
  files = ["/path/to/factorio/script-output/zzzmetrics.stat"]
  data_format = "influx"
```
