[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CONVERTIBLE (non-wall) functions — get them with `python3.13 tools/wall_aware_headroom.py --json` (that module's `convertible_files`). Do NOT re-attempt documented walls (GLOBAL_ASM-endgame / C-32). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be an unmarked wall (add the marker). Effort MAX.

NOTE: only ~245 convertible functions remain project-wide, mostly in the hard asymptotic modules below — batches may be small and some "convertible" ones are still difficult. That's the real frontier; honest low counts are fine.

---

### cm-main-batch1 — C-match main convertibles (batch 1) [DONE]
main has ~115 convertible (non-wall) functions — the biggest remaining pool. Get the list via `wall_aware_headroom.py --json` (main.convertible_files), C-match a batch (~8-15), prefer the SDK-named ones.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov004 — C-match ov004 convertibles [DONE]
ov004 has ~35 convertible functions. Get the list, C-match a batch.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-main-batch2 — C-match main convertibles (batch 2) [DONE]
Continue main's convertible pool — different functions than batch 1.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
