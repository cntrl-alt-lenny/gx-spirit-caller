[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-decomper` → hand C-match a batch (~8-15) of that module's matched-`.s` functions to readable C, byte-verified; `cmatch_loop.py` drafts a start, judgment is yours; skip documented walls. Gate `python3.13 tools/gate3.py --scope all` (paste the sha1 PASS), open ONE PR, `work_queue.py done claude-decomper <id>`, commit, next. Park un-matchable walls, move on. Effort MAX. This moves the readable-C % — ship real matches.

---

### cm-ov019 — hand C-match ov019 [TODO]
ov019: 8.5% C, ~1208/14212 bytes matched — lots of headroom. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted (new .c / removed .s).

### cm-ov013 — hand C-match ov013 [TODO]
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
