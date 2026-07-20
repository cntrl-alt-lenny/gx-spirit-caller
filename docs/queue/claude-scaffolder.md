[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Scaffolder — autonomous C-match queue

**Protocol (the standing kickoff drives this):**
1. `python3.13 tools/queue.py next claude-scaffolder` → prints the next module, marks it CLAIMED. `QUEUE-EMPTY` → stop, ping brain.
2. Hand C-match a batch of that module's matched-`.s` functions to readable C, byte-verified. `cmatch_loop.py` assists; judgment is yours. Different modules from the Claude Code Decomper lane, so no collision.
3. Gate with `python3.13 tools/gate3.py --scope all` (paste the real sha1 PASS). Open ONE PR. Then `queue.py done claude-scaffolder <id>`, commit, back to step 1.
4. Park un-matchable walls (note in PR), move on.

Set effort MAX. Readable-C output is the frontier — ship real matches.

---

### cm-main — hand C-match main (continue b621) [TODO]
main: 7.88% C, the biggest module. b621 converted 10; hundreds remain, especially newly-named SDK-style functions (Copy32/Fill32/OS_*/SNDi_* from b618, plus b627/b630 sig names). Take functions b621 didn't. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov005 — hand C-match ov005 [TODO]
ov005: 5.31% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov009 — hand C-match ov009 [TODO]
ov009: 7.31% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov022 — hand C-match ov022 [TODO]
ov022: 11.70% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
