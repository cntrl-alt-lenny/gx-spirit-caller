# Port-harvest measurement snapshots

These are the tool-derived inputs for measuring regenerated exact-floor ports
against EUR movement. Append one row after each real harvest, and keep the
pre-harvest census row when a run is deferred or has no work. The backlog
counts are `sim == 1.0` rows from `python tools/port_census.py`; the EUR byte
value is `Natural-C` from `python tools/progress.py --version eur`.

| date | commit / event | EUR Natural-C bytes | USA exact-floor | JPN exact-floor |
|---|---|---:|---:|---:|
| 2026-08-01 | `37b143ca5`, #1418 harvest endpoint | 316,114 | 134 | 136 |
| 2026-08-01 | `ceefe98c1`, q-port-harvest-defer pre-harvest census | 316,114 | 134 | 136 |
| 2026-08-01 | `6e52e9913`, q-port-harvest-schedule pre-harvest census | 322,522 | 160 | 162 |

The first row is the committed #1418 harvest report's endpoint; the second
row is a fresh census/progress run on current `origin/main`. No harvest was
performed by q-port-harvest-defer, so these rows do not claim a new port.
Future harvests should append the post-harvest row immediately after the
harvest; the next pre-harvest row then supplies the second endpoint for a
real rate calculation.
