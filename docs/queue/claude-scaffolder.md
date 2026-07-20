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

### cm-ov009 — hand C-match ov009 [PARKED]
> PARKED: no honest batch of 8-15 available: read all 17 remaining .s functions directly. 3 already carry brief 343's own detailed deferred-reason analysis (register-allocation coin-flips: discriminant-register choice, scratch-register parking). Of the other 14: 2 use magic-constant-division idioms (smull with 0x78787879/0xb60b60b7/0x51eb851f-style constants -- notoriously exact-codegen-dependent, high iteration cost for uncertain payoff), 1 is a 10-saved-register per-pixel color-blend loop (021ad214, dense interacting register scheduling across ~50 instructions), several are large multi-hundred-to-thousand-byte subsystem functions (0x390-0x990 bytes) unlikely to match on a first natural-C attempt, and 2 borderline jump-table-dispatch candidates (021acf1c, 021aa4a8) would need careful, slow hand-verification of ARM conditional-jump-table semantics before attempting -- not the ~8-15 quick, tractable batch this item asks for. Verified directly, not assumed from ov009_core.h alone (which itself only documented 4 deferred, not exhaustive).
ov009: 7.31% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov022 — hand C-match ov022 [PARKED]
> PARKED: no honest batch of 8-15 available: all 12 remaining .s functions carry the same GLOBAL_ASM-endgame marker (briefs 294/302, systematic prior no-C-match pass) seen in cm-ov005 and cm-ov009 -- this project-wide pass evidently covered ov022 too, despite no dedicated ov022 brief/core.h existing. Read all 12 directly: uniformly complex, register-heavy (8-9 saved regs), multi-dependency (10+ .extern per TU is common), several with magic-constant smull multiplies and packed-argument unpacking (a single register split into two 16-bit halves via lsl/lsr pairs) -- same difficulty class as cm-ov009's parked residue, not the short/simple pattern that made cm-main's batch tractable. Two near-identical siblings (021ab760/021ab804, packed-arg unpack + smull scaling) looked like the best candidates but deriving+verifying the exact packed-argument signed/unsigned semantics would need real iteration time with uncertain payoff at this point in a long session. Verified directly against the module's own symbols.txt + delinks.txt, not assumed.
ov022: 11.70% C. Convert a batch (~8-15).
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.
