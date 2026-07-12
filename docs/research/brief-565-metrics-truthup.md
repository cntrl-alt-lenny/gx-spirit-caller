# Brief 565 — metrics truth-up

Date: 2026-07-12  
Source: committed `config/<ver>/**/delinks.txt` tier via
`python tools/progress.py --version <ver>`; build-free.

## Current committed-tier snapshot

| Region | Units | Fn | Code | C-decompiled |
| --- | ---: | --- | ---: | ---: |
| EUR | 100.00% (10254/10254) | Not emitted by build-free `progress.py` | 97.41% (2326436/2388172) | 7.99% (190856/2388172) |
| USA | 100.00% (9617/9617) | Not emitted by build-free `progress.py` | 89.83% (2144388/2387188) | 7.08% (168896/2387188) |
| JPN | 100.00% (9617/9617) | Not emitted by build-free `progress.py` | 89.83% (2144504/2387188) | 7.08% (168896/2387188) |

The build-free report does not provide a function (`fn`) percentage, so no
function number is inferred from units or copied from a machine-local report.
The `C-decompiled` line is the true readable-C metric and is distinct from
headline code coverage, which counts `.s` ships.

## Replaced stale values

| Region | Stale headline | Current committed-tier code |
| --- | ---: | ---: |
| USA | 49.17% | 89.83% |
| JPN | 48.10% | 89.83% |

The stale values came from a gitignored, outdated `build/<ver>/report.json`.
Historical references in Brief 561 and the 2026-07-09 swarm note are marked
superseded; `docs/state.md` now labels the current snapshot
"committed delinks tier, build-free, 2026-07-12".
