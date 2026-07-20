[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Scaffolder — autonomous C-match queue

**Protocol (the standing kickoff drives this):**
1. `python3.13 tools/work_queue.py next claude-scaffolder` → prints the next module, marks it CLAIMED. `QUEUE-EMPTY` → stop, ping brain.
2. Hand C-match a batch of that module's matched-`.s` functions to readable C, byte-verified. `cmatch_loop.py` assists; judgment is yours. Different modules from the Claude Code Decomper lane, so no collision.
3. Gate with `python3.13 tools/gate3.py --scope all` (paste the real sha1 PASS). Open ONE PR. Then `queue.py done claude-scaffolder <id>`, commit, back to step 1.
4. Park un-matchable walls (note in PR), move on.

Set effort MAX. Readable-C output is the frontier — ship real matches.

---

### cm-main — hand C-match main (continue b621) [DONE]
main: 7.88% C, the biggest module. b621 converted 10; hundreds remain, especially newly-named SDK-style functions (Copy32/Fill32/OS_*/SNDi_* from b618, plus b627/b630 sig names). Take functions b621 didn't. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov005 — hand C-match ov005 [PARKED]
> PARKED: genuinely exhausted, not skipped: 32/33 remaining .s functions are individually marked GLOBAL_ASM-endgame reg-alloc-walls (briefs 294/302, confirmed no C match) on top of briefs 327/329's own easy-tier drain (20 functions) + explicit pivot-away recommendation. Only func_ov005_021acadc (a 2-bit bitfield-insert, size 0x74) is unmarked/potentially tractable -- 1 function, not a batch. Verified via direct census against ov005's own symbols.txt + grep for the wall-marker comment across every remaining TU, not assumed from the doc alone.
ov005: 5.31% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov009 — hand C-match ov009 [TODO]
ov009: 7.31% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov022 — hand C-match ov022 [TODO]
ov022: 11.70% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
