# Brief 473 — USA/JPN main `.s` mechanical drain wave 4

**Decomper, brief 473.** Processed the requested 200-candidate wave on native
Windows: 100 USA main candidates followed by 100 JPN main candidates. The wave
shipped **182 byte-identical `.s` files** (90 USA + 92 JPN), parked 18 genuine
candidate failures, deferred none, and finished with both regional SHA-1 gates
green.

## Outcome

| Region | Candidates | Shipped | Parked | Deferred | Clean rate | Main `.s` on disk | Final gate |
|--------|-----------:|--------:|-------:|---------:|-----------:|------------------:|------------|
| USA | 100 | **90** | 10 | 0 | 90% | 731 | `usa sha1` **OK** |
| JPN | 100 | **92** | 8 | 0 | 92% | 330 | `jpn sha1` **OK** |
| **Total** | **200** | **182** | **18** | **0** | **91%** | — | both green |

The driver made 26 commit-on-pass commits: 11 for USA and 15 for JPN. USA
drained the `0x14` through `0x44` size bands; JPN drained `0x14` through `0x24`.
No EUR or ov002 source/configuration was touched.

## Parked candidates

The same eight structural failures appeared in both regions:

- Verify-fail: `func_02000b64`, `func_020b40f4`, `func_020b40cc`,
  `func_020b40e0`.
- Full-ROM gate-fail after byte verification: `func_02018ae0`,
  `func_020936a8`, `func_020a60a8`, `func_020943b0`.

USA additionally refused two data-classified candidates:
`func_02048950` and `func_02078374`.

These are genuine, repeatable candidate failures rather than infrastructure
failures. Batch size 10 kept the two red-batch bisects bounded; the clean bands
afterward mostly committed ten at a time.

## Native-Windows dual-lane result

PR #1007's native-Windows `batch_carve` path worked as intended. The USA wave
overlapped the scaffolder's separate EUR-ov002 `batch_carve` process in its
sibling worktree and separate build directory. This lane recorded:

- zero gate timeouts;
- zero deferred batches;
- zero build/tool crashes;
- no cross-worktree interference.

The old brief-471 Wine/fcntl contention guidance does not apply on this host.
No Wine process management or POSIX lock workaround was used.

## Final verification

After both waves completed, each region was freshly configured and gated:

```console
python tools/configure.py usa
ninja sha1
# gx-spirit-caller_usa.nds: OK

python tools/configure.py jpn
ninja sha1
# gx-spirit-caller_jpn.nds: OK
```

Each successful carve was also protected by its own commit-on-pass regional
SHA-1 gate during the wave.

## Remaining runway

Post-wave uncarved-main enumeration, excluding existing source files and the
known parked lists, found:

- **USA main: 2,438 candidates** before classification of the remaining pool.
- **JPN main: 2,842 candidates** before classification of the remaining pool.

The dry-run classifier may reduce those headline counts slightly as additional
data/refusal cases are discovered, but both regions retain thousands of
mechanical-drain candidates. The next wave can reuse the exact brief-473
commands with `--batch 10`.
