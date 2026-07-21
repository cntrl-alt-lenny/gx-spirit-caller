[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue

**Protocol (the standing kickoff drives this):**
1. `python3.13 tools/queue.py next claude-decomper` → prints the next module, marks it CLAIMED. `QUEUE-EMPTY` → stop, ping brain.
2. Hand C-match a batch of that module's matched-but-still-`.s` functions to readable C, each byte-verified. `cmatch_loop.py` drafts a starting point; the C-writing judgment is yours. Skip documented reg-alloc walls.
3. Gate with `python3.13 tools/gate3.py --scope all` (paste the real sha1 PASS). Open ONE PR. Then `queue.py done claude-decomper <id>`, commit the queue file, back to step 1.
4. A function that won't byte-match after honest iteration → park it (note it in the PR), move on. Don't grind a single wall.

Set effort MAX. This is the work that moves the readable-C % — ship real matches.

---

### cm-ov008 — hand C-match ov008 [DONE]
ov008 is the lowest-C% overlay (3.52%). b620 triaged 70 candidates: 12 are known codegen walls (see ov008_core.h / briefs 323/325/403), ~46 genuinely open. Convert a batch (~8-15) of the open ones.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted (new .c / removed .s).

### cm-ov001 — hand C-match ov001 [DONE]
ov001: 5.29% C, lots of headroom. Convert a batch (~8-15) of matched-.s functions.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov014 — hand C-match ov014 [DONE]
ov014: 5.01% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov019 — hand C-match ov019 [PARKED]
> PARKED: 0 fresh candidates: all 25 remaining .s functions in src/overlay019/ carry brief 294/302 GLOBAL_ASM-endgame headers (documented reg-alloc walls, no C match, already shipped as permanent .s by a past sweep). Verified against origin/main tip (0 commits behind, 0 diff on overlay019 paths). Cross-checked delinks.txt (26 .s: entries = 25 functions + 1 bss data section, all 25 functions confirmed walled, none missing a marker). No code changes to gate or PR. See PR #1216 (cm-ov014) for the sibling case.
ov019: 8.5% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
