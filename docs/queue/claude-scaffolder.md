[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Scaffolder — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-scaffolder`. Candidate list = the module's CONVERTIBLE (non-wall) functions via `python3.13 tools/wall_aware_headroom.py --json`. Skip documented walls. Different modules from the Decomper lane — no collision. Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Effort MAX. Only ~245 convertible remain project-wide; honest small batches are fine.

**CRITICAL — header-read each candidate before compiling.** `wall_aware_headroom.py`'s list is an UPPER BOUND: a third wall class is free-form prose with no taxonomy number (mwcc-reg-alloc / hand-`.word` cross-jumps / `mcr` ops / shared-epilogue pads) — the tool can't catch it without also skipping easy stubs. Read each candidate's `.s` header; skip prose walls; the EASY WINS are trivial stubs (no-op `bx lr`, tail-call trampolines/forwarders). ~half of a medium batch may be prose walls — that's expected.

---

### cm-ov002-batch1 — C-match ov002 convertibles (batch 1) [TODO]
ov002 has ~27 convertible (non-wall) functions. Get the list via `wall_aware_headroom.py --json` (overlay002.convertible_files), C-match a batch (~8-15). (ov002 is asymptotic-hard, but these carry no documented wall — attempt them.)
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-smalls — C-match the small-overlay convertibles [TODO]
The overlays with a few convertible each: ov008 (~6), ov011 (~5), ov010 (~5), ov015 (~4), ov003 (~2), ov016 (~2). Get each module's convertible_files, C-match what you can across them.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted (per module).

### cm-ov002-batch2 — C-match ov002 convertibles (batch 2) [TODO]
Continue ov002's convertible pool — different functions than batch 1.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
