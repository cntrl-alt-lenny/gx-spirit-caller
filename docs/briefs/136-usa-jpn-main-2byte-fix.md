### decomper/usa-jpn-main-2byte-fix

**Goal:** **🔑 3-region 27/27 module unlock.** USA + JPN
main module fails by exactly 2 bytes per brief 134's
out-of-scope note: file offsets 0x89ac0 / 0x89b10 — BL
offset displacement (0xf4 = 244 byte displacement to a
misplaced function). Brief 134 explicitly called this
out as a separate function-tier decomp gap unrelated to
W7's veneer cascade. Brief 136 closes it.

**Context — what brief 134 documented:**

> The 2 remaining bytes in USA / JPN main are BL
> instructions with imm24 offsets that resolve to wrong
> function addresses (by 0xf4 = 244 bytes). This is a
> function-tier decomp gap that predates brief 134 and
> will resolve as more source-level matching happens in
> those regions.

EUR main passes (27/27 OK). The 2-byte residue is
USA/JPN-specific. Likely cross-region apply (brief
094/110) didn't pick up a particular function that had
a region-specific signature.

**Method:**

1. **Identify the diff** at USA file offsets 0x89ac0
   and 0x89b10:

   ```bash
   xxd build/usa/build/arm9.bin | grep -A1 -B1 -E '^0008(9ac|9b1)'
   xxd extract/usa/arm9/arm9.bin | grep -A1 -B1 -E '^0008(9ac|9b1)'
   ```

2. **Decode the BL instruction** at each location to
   find the (built_target_addr, orig_target_addr) pair.
   The 0xf4 byte displacement means the built target
   is 244 bytes off from where the orig target lives.

3. **Map the displacement to a function.**
   - Use `config/usa/arm9/symbols.txt` to find what
     symbol is at the orig target address.
   - Check what's currently at the built target address.
   - The displacement is likely because a function got
     decomp'd in a way that produced a slightly
     different size, shifting downstream symbols by
     0xf4 bytes.

4. **Fix the source** to match orig placement. Two
   possible shapes:
   - **Source-form fix**: modify the function whose
     decomp shifted neighbors. Make it match orig's
     byte-size.
   - **Reorder fix**: if a function is in the wrong
     order in the link list, reorder it.

5. **Verify per region:**
   - `python tools/configure.py usa && ninja rom`
   - `./dsd check modules -c config/usa/arm9/config.yaml`
   - **Goal: USA main flips FAILED → OK → 27/27.**
   - Same for JPN.

6. **Confirm EUR unchanged:**
   - EUR baseline was 27/27 post-brief-134; should
     remain 27/27.

**Repeat for JPN** if the same fix doesn't cover it
(may be a parallel issue with the same shape).

**Non-scope:**

- ❌ ROM-level SHA1 work (brief 137 covers).
- ❌ ov004 / overlay-checksum changes.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **USA main: FAILED → OK (27/27).**
- **JPN main: FAILED → OK (27/27).**
- **🎉 3-region 27/27 module baseline.**
- No regressions in any other module across any region.
- Per-PR funnel: which function was displaced, what
  the source-fix was.

**Branch:** `decomper/usa-jpn-main-2byte-fix`

**After this brief lands:**

1. **3-region 27/27 module baseline.** Full clean
   module-checksum state across EUR + USA + JPN.
2. **SHA1 may pass for USA + JPN** if their ROM-level
   bytes happen to align without the EUR-specific
   issue brief 137 is investigating. Verify via
   `ninja sha1` per region.
3. **Brief 138+ candidate** — depends on brief 137
   findings + whether brief 136 unlocks per-region
   SHA1.
