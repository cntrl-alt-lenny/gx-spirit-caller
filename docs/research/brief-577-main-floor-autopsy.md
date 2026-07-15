# Brief 577 — USA/JPN main floor autopsy

Date: 2026-07-16
Branch: `claude/main-floor-autopsy-577`

## Result

**12 of the 14 parked functions (6/region) shipped**, root-caused to 3
distinct tool bugs in `asm_escape.py`'s whole-function emitter — modeled
directly on brief 549's "comparator bug, not a codegen wall" pattern.
The remaining 2 (1/region) are a genuine, precisely-diagnosed
architectural wall, documented below rather than forced.

| Function | Root cause | Outcome |
| --- | --- | --- |
| `func_020b40cc`, `func_020b40e0` | single-register push/pop encoding | **shipped** (fix 2) |
| `func_02020fa4`, `func_020b3988` | cross-function tail-merge target | **shipped** (fix 3) |
| `func_020b2c38`, `func_020b3b84` | embedded junk-data table | **shipped** as data blob |
| `func_02099834` | leading/shared literal pool outside the function's own declared range | **genuine wall** |

Both regions shipped identically — same functions, same fixes, real
`ninja sha1` green for every ship. `func_02099834` verify-fails
identically in both regions too (confirmed reproducible, not flaky).

## Root cause 1 — empty-mnem data words (fixed)

`func_020b2c38`/`func_020b3b84` (before the deeper fix below) showed
`word count differs: mine=230 orig=238` plus a cascade of
now-misaligned diffs. Root cause: 8 words per function that objdump
cannot decode at all (`<UNDEFINED> instruction: 0x...>`) reduce, after
`parse_objdump`'s `@`-comment strip, to an **empty** `mnem` — the
entire text IS the stripped comment. `emit_asm`'s final fallback
(`body.append("    " + hex_imm(mn))`) then emitted a blank
4-space-indented line for each one: the word silently **vanished**
from the reassembled output rather than round-tripping.

Confirmed via direct `parse_objdump()` calls: exactly 8 empty-mnem
words per function, at byte-identical values in both
(`f9fafbfc`, `f5f6f7f8`, `f1f2f3f4`, `b6b7b7b8`, `b0b1b1b2`,
`a1a1a2a2`, `96979798`, `91919292`) — the same embedded table, just at
different addresses in each function.

**Fix:** treat an empty original `mnem` the same as the existing
`_DATA_AS_CODE_RE` shapes — emit the raw encoding as `.word`, byte-exact,
instead of falling through to a blank line.

## Root cause 2 — single-register push/pop (fixed)

`func_020b40cc`/`func_020b40e0` showed a 2-word mismatch:
`e92d4000(stmfd sp!, {lr}) vs e52de004(push {lr})` and the matching
epilogue pair. objdump alias-prints **two different encodings**
identically as `push {lr}` / `pop {pc}`:

- the ordinary STMDB/LDMIA block-transfer form (`0xE92D...`/`0xE8BD...`)
- the dedicated single-register STR/LDR pre/post-indexed form
  (`str lr, [sp, #-4]!` = `0xE52D0004`, `ldr pc, [sp], #4` = `0xE49D0004`)

`to_mwasm`'s push/pop handling always assembles `push`/`pop` mnemonic
text to the STMDB/LDMIA form — byte-wrong when the original used the
second form, and the mnemonic text alone can't distinguish them.

**Fix:** `is_single_reg_push_pop(bytes)` detects the raw encoding
directly (`word & 0xFFFF0FFF` matches `0xE52D0004`/`0xE49D0004`,
Rd free) and preserves it as a raw `.word` instead of translating.
Verified this does NOT affect the ordinary multi-register case
(`_LOOP` fixture's `push {r4, lr}` still translates normally).

## Root cause 3 — cross-function tail-merge targets (fixed, 2 iterations)

`func_02020fa4`/`func_020b3988` passed `asm_escape.py`'s own
byte-verify cleanly (staged fine) but failed the real `ninja sha1`
**link**, isolated by `batch_carve.py`'s bisection to these two
specific functions. Manually staging each and running `ninja sha1`
directly surfaced the real linker error:

```
mwldarm.exe: Undefined : ".L_02020fb4"
mwldarm.exe: Referenced from "func_0200886c" in func_0200886c.o
mwldarm.exe: Referenced from "func_02008aac" in func_02008aac.o
... (5 total referencing functions)
mwldarm.exe: Undefined : ".L_02020fc4"
mwldarm.exe: Referenced from "func_02006378" in func_02006378.o
```

Root cause: `func_02020fa4` is actually **three small functions the
original compiler merged into one dsd symbol** — its disassembly is
literally three `push{...}; ...; bl <panic>; b .`-shaped fragments
back to back (the third being the function's real logic). Several
*other*, already-compiled/carved functions branch directly into the
2nd and 3rd fragment's entry points (`0x02020fb4`, `0x02020fc4`) —
those addresses aren't their own symbol, so whichever file's real
callers already reference dsd's synthetic `.L_<absolute-addr>`
placeholder convention, and it stays unresolved forever unless
*whoever carves the merged symbol* also exports a matching label.
`emit_asm`'s whole-function mode only ever labelled RELATIVE addresses
found by its own internal `branch_targets()` scan — it had no
awareness that an external file could reference a mid-function address
via this convention. Same mechanism confirmed for `func_020b3988`
(`.L_020b3990`, referenced from `func_020b3720`).

**Fix, iteration 1 (incomplete):** `emit_asm` gained an optional
`base_addr` — every non-pool instruction gets an additional
`.L_<base_addr+relative-addr>:` label. Verified in isolation
(`mwasmarm` alone) that this line assembles fine — but the SAME
`Undefined: .L_02020fb4` error persisted at the real link. Root cause
of *that*: a label is LOCAL by default; only a `.global`-declared one
is exported to the object's symbol table, confirmed directly via
`objdump -t` on the standalone-assembled object.

**Fix, iteration 2:** added a matching `.global .L_<addr>` header line
for every absolute label. Re-tested — **same link error, same two
symbols still Undefined.** Root cause of *that*: Python's default
`:x` format doesn't zero-pad — the fix was generating `.L_2020fb4`
(7 hex digits) while the referencing files expect `.L_02020fb4` (8
hex digits, the full zero-padded 32-bit address) — a different symbol
name entirely. Fixed by using `:08x`. Re-verified via
`arm-none-eabi-objdump -t` on the real ninja-built object: both
`.L_02020fb4`/`.L_02020fc4` now show as `g` (global) at the correct
offsets, and the real `ninja sha1` gate passed clean.

This 3-step trace (label exists → label not exported → export name
doesn't match convention) is the closest analogue in this brief to
brief 549's own "the fix looked complete but the real gate said
otherwise" lesson — asm_escape's own pre-link comparator cannot catch
any of these three failure modes, only a real link can.

## Genuine wall — `func_02099834` (documented, not shipped)

`func_02099834` (SHA1/hash-shaped code, 0x280 bytes) references
`_LIT0`–`_LIT4` via `ldr rX, [pc, #N]`, but none of the five pool words
were ever emitted — undefined-identifier assembly failure. Root cause,
confirmed via direct address computation: the five pool words live at
addresses **0x02099820–0x02099830**, which is **before** the function's
own declared start (0x02099834) — a **leading pool**, shared with
whatever precedes it in the ROM, not embedded within or trailing the
function's own byte range.

`configured_function_size` bounds `parse_objdump` to the function's own
`[start, start+size)` — by construction it can never see bytes before
`start`, so `emit_asm`'s `lit` dict registers the referenced addresses
(computed from the referencing instructions, which are correctly
in-range) but the corresponding definition words are never walked, so
their `_LITn: .word` lines are never emitted.

Confirmed via `symbols.txt`: **no symbol at all claims
0x02099820–0x02099830** — it isn't owned by another function (not a
territory conflict), it's genuinely unclaimed. This makes the fix
*possible in principle* but non-trivial: it would require extending
the carved delinks.txt range backward past the function's own declared
symbol boundary (`start:0x02099820` instead of `start:0x02099834`),
which is a `batch_carve.py`/`asm_escape.py` cross-cutting change to
how a whole-function candidate's address range is computed — a
genuinely different, larger-scoped fix than the three above, and out
of scope for this brief. Documented here as the precise, reproducible
mechanism rather than re-attempted blindly.

## Data-blob ships — `func_020b2c38`, `func_020b3b84`

After fix 1 closed the 8-word gap, both functions still showed **5
residual single-word mismatches** (now correctly aligned, since the
word count matched) — all confirmed within the exact same embedded
junk-data region, just at word shapes (`mvn`, `sbcsle`, `adcslt`,
`adcge`, `orrhi`) that don't match `_DATA_AS_CODE_RE`'s curated
allowlist. Unlike the exotic coprocessor/svc ops that allowlist
already covers, these are ordinary ALU mnemonics that legitimately
appear as real code elsewhere — extending the allowlist to cover them
unconditionally would risk misclassifying genuine code in a future
candidate.

Rather than build a new per-word heuristic, both were closed with
`tools/emit_data_blob.py` — imported from the not-yet-merged
`claude/eur-datablob-578` branch (brief 578), which independently hit
the identical failure class ("disasm/reasm round-trip mismatch, not
literal data") on EUR at addresses ~0xf4–0x2f4 bytes away. That tool
emits the ground-truth bytes as raw `.byte` directives with no
translation step at all — safe by construction regardless of how many
mismatch shapes exist. Added a `--srcdir` override (not present in the
brief-578 cut) so a region-specific USA/JPN candidate doesn't land in
the tool's EUR-baseline default path (`src/main`).

## Gates

- Every shipped function: real `ninja sha1` (not just `asm_escape.py`'s
  own pre-link comparator) — the func_02020fa4/func_020b3988 trace
  above is a direct demonstration of why this distinction matters.
- Final: `python tools/gate3.py --no-tests` — **GATE PASS**, all three
  regions (`eur`/`usa`/`jpn`) SHA1 PASS.
- Full `tests/` suite: 78 new/updated tests (`test_asm_escape.py` +
  `test_emit_data_blob.py`), 0 regressions — the pre-existing 10
  Windows path-separator failures are unchanged (confirmed via
  `git stash` before/after comparison).

## Files changed

- `tools/asm_escape.py` — the 3 fixes (empty-mnem, single-reg
  push/pop, `base_addr` cross-function labels).
- `tests/test_asm_escape.py` — 12 new tests.
- `tools/emit_data_blob.py`, `tests/test_emit_data_blob.py` — imported
  from brief 578 + `--srcdir` override, 1 new test.
- `docs/tools-index.md` — regenerated (95 tools).
- `src/usa/main/`, `src/jpn/main/` — 6 new files each (2 whole-function
  ships via the push/pop + tail-merge fixes, 2 data blobs).
- `config/usa/arm9/delinks.txt`, `config/jpn/arm9/delinks.txt` — the
  matching TU entries.

## Not in this brief's scope

- A proper fix for `func_02099834`'s leading-pool wall (extending a
  whole-function candidate's carved range backward past its own
  declared symbol start) — a genuinely separate, larger-scoped
  `batch_carve.py`/`asm_escape.py` change.
- Generalizing the cross-function tail-merge fix's label coverage
  beyond "every non-pool instruction gets one" (e.g., only emitting
  labels for addresses some other file actually references) — the
  current blanket approach works and is safe, just more verbose than
  strictly necessary.
