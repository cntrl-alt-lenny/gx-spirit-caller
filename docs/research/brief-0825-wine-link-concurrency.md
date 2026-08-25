# Wine link concurrency experiment — 2026-08-25

Measured at repository commit `ad75640a23ce2707eea8f06f472dfa814a80d7e9` on
the EUR tree, using the real `tools/mwccarm/2.0/sp1p5/mwldarm.exe` link
command and `build/eur/objects.txt`. The linker script was copied per slot so
its fixed `build/*.bin` outputs were isolated. No lock or linker serialization
change is adopted here.

## What the existing lock does

`tools/wine_link_lock.py` acquires an exclusive lock at
`%TEMP%/spirit-caller-gate.lock`, runs the supplied argv without a shell, and
returns its exit code. On Wine/Unix it serializes the final `mwld` link across
worktrees; `tools/configure.py` scopes it only to that linker rule, not to
compilation. Per-worktree `WINEPREFIX`es therefore retain parallel compilation,
while the shared lock prevents concurrent Wine-backed linkers from competing
through the same machine-wide Wine/toolchain resources. On native Windows the
script is a safe passthrough and `configure.py` does not wrap the native link.

## Measurements

Before every run, `tasklist | Select-String -Pattern 'mwcc|mwld|mwasm|ninja'`
was run. Every run reported `contention=CLEAR detail=none`. Each row is the
wall time from launching all slots until all linkers exited. All exit codes
were zero; `arm9.o` was 4,131,964 bytes and the complete `.o` plus `.bin`
output set was 7,229,500 bytes per slot.

| Concurrent linkers | Repeat | Wall time (s) | Contention | Binary outputs | Map metadata |
| ---: | ---: | ---: | --- | --- | --- |
| 1 | 1 | 59.007 | CLEAR | identical | n/a |
| 1 | 2 | 54.020 | CLEAR | identical | n/a |
| 1 | 3 | 53.443 | CLEAR | identical | n/a |
| 2 | 1 | 59.102 | CLEAR | identical | divergent per slot |
| 2 | 2 | 59.150 | CLEAR | identical | divergent per slot |
| 2 | 3 | 60.452 | CLEAR | identical | divergent per slot |
| 3 | 1 | 64.856 | CLEAR | identical | divergent per slot |
| 3 | 2 | 64.540 | CLEAR | identical | divergent per slot |
| 3 | 3 | 65.565 | CLEAR | identical | divergent per slot |
| 4 | 1 | 73.925 | CLEAR | identical | divergent per slot |
| 4 | 2 | 68.873 | CLEAR | identical | divergent per slot |
| 4 | 3 | 68.719 | CLEAR | identical | divergent per slot |

The binary output digests were stable across repeats for each width and across
all widths: the width-1 repeat digest prefix was `6f9d2de9640e4b55`, width 2
was `e6cdb4e06b665db9`, width 3 was `1e940706e05eed13`, and width 4 was
`c2f4c16ab4809a5e`. Within every concurrent run, every slot had the same
`arm9.o` and overlay `.bin` bytes.

The only byte difference was `arm9.o.xMAP`, 6,593,138 bytes in every slot.
Its digest differed per slot at widths 2–4, while the ROM/object binaries did
not. This is map metadata ordering or naming variation, not ROM corruption,
but it means a blanket all-files digest is not a valid ROM determinism test.

## Result

Three-way and four-way direct linking completed without deadlock or binary
corruption in this isolated experiment. The wall time rose from a median of
54.020 seconds at width 1 to 59.150 seconds at width 2, 64.856 seconds at
width 3, and 68.873 seconds at width 4. This does not prove that the lock can
be relaxed: the production gate uses Wine and a different environment, and
this worktree cannot run the full three-region gate. A possible wider-link
experiment can be proposed separately, but adoption remains brain-gated.
