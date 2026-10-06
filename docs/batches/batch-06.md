Tool: Codex desktop; model identified by the session as GPT-6; exact model variant and reasoning effort are not exposed to this Worker.

# Batch 06: blocked Worker handoff

Branch: `worker/batch-06`, based on `0cc273a7a`.
Checks below ran on ledger commit `d7cfc24763522f12b8145fc89696ce050f0ec77f`.
The summary commit changes only this document. No production code was shipped.

## Outcome and blocker

The checkout, correct origin, all three baseroms, Rosetta (`arch -x86_64
/usr/bin/true`, exit 0) and Wine (`command -v wine` printed
`/opt/homebrew/bin/wine`, exit 0) were verified. A new isolated worktree was
created from fetched `origin/main`; the baseroms were hard-linked with
`link_baseroms.py`, which verified all three hashes. The primary checkout had
`dsd` but no `tools/arm-none-eabi`, so the latter was downloaded through the
specified `download_tool.py arm-binutils v15.2.1-1.1` route.

The original headroom query returned 58 candidates. Walk stopped at the first,
`0x0207084c`. One handwritten default-tier draft compiled, but
`python3.13 tools/fastmatch.py eur src/main/func_0207084c.c` exited 2:

```text
[eur] func_0207084c.c: OBJDUMP ERROR
ERROR: tools/arm-none-eabi/bin/arm-none-eabi-objdump failed (exit code -6):
Library not loaded: @rpath/libzstd.1.dylib
Reason: tried tools/arm-none-eabi/bin/../libexec/libzstd.1.dylib,
/usr/local/lib/libzstd.1.dylib and /usr/lib/libzstd.1.dylib; none was available.
```

The same scoring executable is needed for every remaining function. Per the
batch's tool-defect boundary, work stopped without installing software,
patching tools, changing baselines or killing any process.
Brain decision needed: provide a working approved macOS binutils dependency
setup, or route this batch to an environment with a working scorer.

## Matched

None.

## Attempted but not matched

| Function | Size | Tier | Best score | Result |
|---|---:|---|---|---|
| func_0207084c | 224 B | default `.c` | unavailable | compile succeeded; objdump could not load its dependency |

`park_one.py` restored the `.s` and exact original delinks routing and appended
one `batch-06` / `tool-anomaly` row. Its numeric `match_pct=0` is the recorder's
placeholder for this unscored attempt, **not a measured 0% match**. No other
tier was tried. `git diff 0cc273a7a -- src/main config/eur/arm9/delinks.txt`
returned no output, exit 0.

## Not attempted

These 57 candidates lie beyond the stopped address. Each was left unattempted
because the common fastmatch scorer was blocked; they were enumerated for this
handoff, not walked as matching attempts. No earlier candidate was skipped.
The original two permanent exclusions, `func_0207db8c` and `func_0207dbf8`,
were not in the assigned convertible list.

| Function | Size | Reason |
|---|---:|---|
| func_02070a38 | 136 B | scoring dependency blocked |
| func_02070b4c | 96 B | scoring dependency blocked |
| func_0207103c | 80 B | scoring dependency blocked |
| func_02072144 | 240 B | scoring dependency blocked |
| func_02072444 | 132 B | scoring dependency blocked |
| func_020724c8 | 124 B | scoring dependency blocked |
| func_020736ac | 140 B | scoring dependency blocked |
| func_0207391c | 96 B | scoring dependency blocked |
| func_0207397c | 224 B | scoring dependency blocked |
| func_02073dcc | 136 B | scoring dependency blocked |
| func_02073f28 | 92 B | scoring dependency blocked |
| func_02074088 | 60 B | scoring dependency blocked |
| func_020745fc | 240 B | scoring dependency blocked |
| func_0207475c | 132 B | scoring dependency blocked |
| func_02074e4c | 12 B | scoring dependency blocked |
| func_02075d74 | 128 B | scoring dependency blocked |
| func_02076c5c | 100 B | scoring dependency blocked |
| func_02077018 | 116 B | scoring dependency blocked |
| func_0207708c | 8 B | scoring dependency blocked |
| func_02077a28 | 96 B | scoring dependency blocked |
| func_02077b5c | 60 B | scoring dependency blocked |
| func_02077b98 | 112 B | scoring dependency blocked |
| func_0207845c | 60 B | scoring dependency blocked |
| func_02078ccc | 100 B | scoring dependency blocked |
| func_02078d30 | 88 B | scoring dependency blocked |
| func_02078d88 | 68 B | scoring dependency blocked |
| func_02078dcc | 112 B | scoring dependency blocked |
| func_02078eec | 28 B | scoring dependency blocked |
| func_02078f50 | 96 B | scoring dependency blocked |
| func_02079984 | 132 B | scoring dependency blocked |
| func_02079b48 | 116 B | scoring dependency blocked |
| func_02079bbc | 184 B | scoring dependency blocked |
| func_02079cc0 | 112 B | scoring dependency blocked |
| func_02079d30 | 172 B | scoring dependency blocked |
| func_0207b13c | 80 B | scoring dependency blocked |
| func_0207b548 | 176 B | scoring dependency blocked |
| func_0207c3b0 | 212 B | scoring dependency blocked |
| func_0207c484 | 104 B | scoring dependency blocked |
| func_0207c4ec | 132 B | scoring dependency blocked |
| func_0207cff4 | 104 B | scoring dependency blocked |
| func_0207d3ac | 132 B | scoring dependency blocked |
| func_0207d458 | 60 B | scoring dependency blocked |
| func_0207dc5c | 76 B | scoring dependency blocked |
| func_0207deb0 | 32 B | scoring dependency blocked |
| func_0207e0a8 | 124 B | scoring dependency blocked |
| func_0207e124 | 160 B | scoring dependency blocked |
| func_0207e1c4 | 80 B | scoring dependency blocked |
| func_0207e54c | 72 B | scoring dependency blocked |
| func_0207e594 | 164 B | scoring dependency blocked |
| func_0207e664 | 72 B | scoring dependency blocked |
| func_0207e6f0 | 72 B | scoring dependency blocked |
| func_0207e748 | 72 B | scoring dependency blocked |
| func_0207ef90 | 204 B | scoring dependency blocked |
| func_0207f05c | 220 B | scoring dependency blocked |
| func_0207f510 | 256 B | scoring dependency blocked |
| func_0207fd60 | 68 B | scoring dependency blocked |
| func_0207ff84 | 116 B | scoring dependency blocked |

## Evidence

All commands use Python 3.13. Results on
`d7cfc24763522f12b8145fc89696ce050f0ec77f`:

| Command | Exit | Real output |
|---|---:|---|
| `python3.13 tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python3.13 tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` |
| `python3.13 tools/validate_attempts.py` | 0 | `"rows": 1988, "errors": 0, "shape_migrations": 0, "shape_conflicts": 66` (existing shape-conflict notes; none for batch-06) |
| `python3.13 tools/check_fake_matches.py` | 0 | `raw-data-directive 0, section-override 0, data-in-pragma-section 0, text-unit-without-function 0, register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`; `check_fake_matches: OK` |
| `python3.13 -m pytest -q tests` | 0 | `1330 passed, 15 skipped, 132 subtests passed in 16.90s` |
| `python3.13 -m unittest discover -s tests` | 0 | `Ran 1345 tests in 15.842s`; `OK (skipped=15)` |
| `ruff check .` | 127 | `zsh:1: command not found: ruff` |
| `python3.13 -m ruff check .` | 0 | `All checks passed!` |
| `python3.13 tools/progress.py --version eur` | 0 | `Natural-C: 424482 / 2385948 bytes (17.79%)` |

Natural-C before at `0cc273a7a`: **424,482 B**. After at the ledger commit:
**424,482 B**, gain **0 B**. Both progress outputs identify their source as
`delinks.txt (approximate — run ninja report locally for objdiff-verified numbers)`.

## Not verified and limitations

No last code commit exists in this batch: only the ledger and this summary
changed. The three-region gate was not run after the scoring-tool blocker;
there are no SHA1 PASS, GATE PASS or gate log-check lines to claim. Tests do
not prove the ROM. No match score was obtained and no C conversion is delivered.
No reference baseline was pruned. No renames, ports, shared headers or framework
changes were made. The exact model variant and reasoning effort cannot be
truthfully supplied from the available session metadata.

Batch 02's summary and review were read; no tier retries went unrecorded and
no non-default tier was selected without evidence.

## Message 2: authorized library-path workaround, still blocked

Brain identified the macOS downloader's missing libzstd dependency and
instructed this Worker to use the existing library through
`DYLD_LIBRARY_PATH`, with no tool changes or software installation. Brain
explicitly required stopping if the known-match check failed.

At `b07d9f4870ce7bfd7bac98d98418f35804092e99`:

```text
$ ls /opt/homebrew/lib/libzstd.1.dylib /usr/local/lib/libzstd.1.dylib
/opt/homebrew/lib/libzstd.1.dylib
ls: /usr/local/lib/libzstd.1.dylib: No such file or directory
```

Exit 1: the Homebrew library exists; the alternate location does not.

```text
$ DYLD_LIBRARY_PATH=/opt/homebrew/lib python3.13 tools/fastmatch.py eur src/main/func_02032b30.c
[eur] func_02032b30.c: COMPILE ERROR
  ninja: error: build.ninja:107985: multiple rules generate build/eur/src/main/func_0207084c.o
```

Exit 2. The known-match prerequisite did not pass, so the library-path
workaround remains unverified. The generated build graph retained the previous
draft's C rule after the function was parked back to assembly. No generated
files were hand-edited, no new matching attempt was made, and the tool-anomaly
ledger row remains unchanged. No gate was run.

Brain decision needed: authorize re-running `python3.13 tools/configure.py eur`
to regenerate the graph after the parked draft, then retry the known-match
check with the authorized library-path environment.
