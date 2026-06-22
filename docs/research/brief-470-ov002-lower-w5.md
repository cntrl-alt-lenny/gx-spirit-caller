[//]: # (markdownlint-disable MD013 MD041)

# Brief 470 — ov002 LOWER-half ARM `.s` drain, wave 5

**Brief:** 470 (scaffolder). Resume the EUR ov002 lower-half mechanical drain
above the brief-466 `0xbc–0xcc` verify-fail wall. This wave ran on native
Windows after PR #1007 made `batch_carve.py` platform-aware; no Wine,
`wineserver`, `pgrep`, `pkill`, or POSIX lock workaround was used.

## Result — 150 carves, 100% clean, EUR SHA1 OK

| chunk | shipped | refused | verify-fail | gate-fail | deferred | commits |
|---|---:|---:|---:|---:|---:|---:|
| 1 | 50 | 0 | 0 | 0 | 0 | 5 |
| 2 | 50 | 0 | 0 | 0 | 0 | 5 |
| 3 | 50 | 0 | 0 | 0 | 0 | 5 |
| **total** | **150** | **0** | **0** | **0** | **0** | **15** |

All 150 candidates:

- passed `asm_escape --classify-data`;
- reassembled byte-identically through `asm_escape --whole-function`;
- landed in batches of 10 only after a green EUR `ninja sha1`;
- were lower-half addresses (`< 0x02234000`);
- covered the `0xcc–0x10c` size range.

The final clean gate was:

```text
python tools/configure.py eur
ninja sha1
gx-spirit-caller_eur.nds: OK
```

## Native-Windows concurrency verdict

The decomper's USA lane was active in its independent worktree during this
wave. Both lanes completed without Wine-era coordination because Windows runs
`mwccarm.exe` and `mwldarm.exe` directly. PR #1007 correctly made the POSIX
file lock, wineserver polling, and orphan-kill paths no-ops on Windows.

The first 50-candidate invocation exceeded the surrounding command runner's
15-minute window after three durable commits (30 ships). The driver itself was
no longer running afterward; four uncommitted staged files were removed and
the ov002 delinks file was restored to the committed HEAD, then the remaining
20 candidates were rerun and shipped. This was a harness-duration interruption,
not a build, toolchain, or byte-verification failure. Chunks 2 and 3 completed
normally.

Native concurrency increased wall-clock time, but produced:

- no compiler timeout deferrals;
- no gate timeout deferrals;
- no SHA1 failures;
- no interference with the decomper worktree.

## Remaining runway

An authoritative post-wave census using `batch_carve`'s own symbol, delink,
skip-list, and existing-source filters found:

| scope | candidates remaining |
|---|---:|
| ov002 lower half, size `>= 0xcc` | **493** |
| residual upper half | **2** |
| total returned by the broad address filter | **495** |

The two upper-half residuals were deliberately not attempted:

| function | size |
|---|---:|
| `func_ov002_022b867c` | `0x248` |
| `func_ov002_022b5590` | `0x3cc` |

The lower-half lane therefore has roughly four more 150-function waves, with
the next candidate size band beginning above `0x10c`. The narrow
`0xbc–0xcc` wall remains out of scope for mechanical re-grinding.
