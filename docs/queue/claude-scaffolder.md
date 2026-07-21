[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Scaffolder — autonomous C-match queue

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-scaffolder` → hand C-match a batch (~8-15) of that module's matched-`.s` functions, byte-verified; `cmatch_loop.py` assists. Different modules from the Claude Code Decomper lane — no collision. Gate `python3.13 tools/gate3.py --scope all` (paste sha1 PASS), open ONE PR, `work_queue.py done claude-scaffolder <id>`, commit, next. Park walls. Effort MAX.

---

### cm-ov005 — hand C-match ov005 [CLAIMED]
ov005: 1532/28832 bytes C — huge module, lots of headroom. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov009 — hand C-match ov009 [TODO]
ov009: 964/13196 bytes C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov003 — hand C-match ov003 [TODO]
ov003: 1336/21280 bytes C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-main2 — hand C-match main (more) [TODO]
main: 7.9% C, biggest module. b621/b629 converted ~22; hundreds remain (SDK-named ones easiest). Take fresh functions. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov016 — hand C-match ov016 [TODO]
ov016: 2980/27388 bytes C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
