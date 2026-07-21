[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-decomper` → hand C-match a batch (~8-15) of that module's matched-`.s` functions to readable C, byte-verified; `cmatch_loop.py` drafts a start, judgment is yours; skip documented walls. Gate `python3.13 tools/gate3.py --scope all` (paste the sha1 PASS), open ONE PR, `work_queue.py done claude-decomper <id>`, commit, next. Park un-matchable walls, move on. Effort MAX. This moves the readable-C % — ship real matches.

---

### cm-ov019 — hand C-match ov019 [PARKED]
> PARKED: RE-CONFIRMED (2nd pass, fresh origin/main a44f8894): still 0 fresh candidates. All 25 remaining .s functions in src/overlay019/ carry brief 294/302 GLOBAL_ASM-endgame headers (documented reg-alloc walls, no C match) -- identical result to the prior park on claude/decomper-queue-run. The 8.5%/1208-of-14212-bytes headroom this queue item cites is a pure not-yet-.c byte count that doesn't cross-reference wall documentation -- every one of those remaining bytes belongs to an already-walled function. Escalating: this module will keep re-appearing on every refill unless the refill heuristic excludes GLOBAL_ASM-endgame-marked functions from headroom scoring, or ov019 is retired from the candidate pool entirely. Recommend brain fix the refill query rather than re-queuing this a 3rd time.
ov019: 8.5% C, ~1208/14212 bytes matched — lots of headroom. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted (new .c / removed .s).

### cm-ov013 — hand C-match ov013 [PARKED]
> PARKED: 0 fresh candidates. 9 .s functions total: 8 carry brief 294/302 GLOBAL_ASM-endgame headers (documented reg-alloc walls), the 9th (func_ov013_021c9d60) is a documented C-32 cross-overlay-BL wall (brief 192 recipe) -- a hard mwldarm link-level constraint (module:none reloc, target address ambiguous across a shared-base overlay group), not a codegen/style issue, so there is no C-level defeat. See docs/research/codegen-walls.md C-32 entry.
ov013: 404/6640 bytes C — big headroom. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov022 — hand C-match ov022 [TODO]
ov022: 600/5128 bytes C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov012 — hand C-match ov012 [TODO]
ov012: 832/8972 bytes C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov007 — hand C-match ov007 [TODO]
ov007: 1108/3256 bytes C (already ~34% — the tractable ones may be nearly done; take what's open, park walls). Convert a batch.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
