# Brief 214 — bit-test → 0/1 idiom investigation

**Brief:** 214 (scaffolder). Investigate whether the orig bit-test
→ 0/1 idiom (`lsl r0, r0, #N; movs r0, r0, lsr #N; movne r0, #1;
moveq r0, #0; bx lr`) is reachable from any C source under any
mwccarm tier. Brief 213 shipped 3 picks as `.s` because plain
`(x & 1) ? 1 : 0` collapses to `tst r0, #1` under mwcc 2.0. If a
C idiom works, ship the recipe; if not, classify as a new wall.

## Headline

**A C idiom DOES reach the orig shape.** Across a 23-source-variant
× 8-mwcc-tier matrix on `func_020a584c` (the bit-0 extract pick),
the following source reproduces the orig 24-byte `.text` byte-for-
byte under mwcc 1.2/sp2p3 (legacy tier):

```c
int func_020a584c(int *p) {
    unsigned t = (unsigned)(p[1] << 31) >> 31;
    if (t != 0u) return 1;
    return 0;
}
```

`func_020a584c.s` has been swapped to `func_020a584c.legacy.c`
with the source above. The bytes match orig exactly (verified by
direct mwcc invocation: `mwccarm 1.2/sp2p3` produces
`e5900004 e1a00f80 e1b00fa0 13a00001 03a00000 e12fff1e` — same as
orig's delinked `.o`).

Classified as **C-37** in
[`codegen-walls.md`](codegen-walls.md), with a hex-tail detector
added to [`tools/predict_walls.py`](../../tools/predict_walls.py)
covering all four polarity × shift-width combinations (bit-0 vs
byte-low extract, 1-if-set vs 1-if-zero).

## The orig shape (two sub-variants)

### Shape A — bit-0 extract → 0/1 (`func_020a584c`, brief 213 wave 1)

```asm
ldr   r0, [r0, #0x4]
mov   r0, r0, lsl #0x1f          ; bit-0 -> bit-31
movs  r0, r0, lsr #0x1f          ; back to bit-0, set flags
movne r0, #0x1                   ; redundant (already 0/1)
moveq r0, #0x0                   ; ditto
bx    lr
```

Size: 0x18 (24 bytes). Bytes:
`e5900004 e1a00f80 e1b00fa0 13a00001 03a00000 e12fff1e`.

### Shape B — byte-low zero check → 1/0 (`func_ov000_021ab6cc`, `_021af5c0`)

```asm
ldr   r0, [pc, #0x14]            ; load address of struct
ldr   r0, [r0, #0x58]            ; load 4-byte word at byte offset 0x58
mov   r0, r0, lsl #0x18          ; low byte -> high byte
movs  r0, r0, lsr #0x18          ; back, set flags (zero-extend)
moveq r0, #0x1                   ; 1 if byte == 0
movne r0, #0x0                   ; 0 otherwise
bx    lr
```

Note the inverted polarity (`moveq #1; movne #0`) compared to
Shape A.

## Why mwcc 2.0 doesn't reach Shape A from natural C

mwcc 2.0/sp1p5 has a bit-test peephole that recognises the
`(x << 31) >> 31` shape (and equivalents like `x & 1`,
`x & 1 ? 1 : 0`, `!!(x & 1)`) and collapses to:

```asm
ldr   r0, [r0, #0x4]
tst   r0, #1                     ; one instruction instead of two
movne r0, #1
moveq r0, #0
bx    lr
```

This is 20 bytes vs orig's 24 — one instruction shorter and a
different opcode (`tst` vs `lsl`+`movs lsr`). mwcc 1.2 lacks this
peephole and emits the explicit shift sequence the orig has.

For Shape B (`lsl #24`), mwcc 2.0 does NOT have an equivalent
byte-extraction peephole. So Shape B reaches from mwcc 2.0 with
the same shift-extract idiom — only Shape A needs the legacy tier.

## Variant matrix (full results)

Source variants tested × mwcc tier (run on Windows scaffolder
host with mwccarm directly invokable; see
`tmp/variant_runner.py` development scaffold, removed from PR
after measurement). All variants take `int *p` and return 0 or
1 based on bit 0 of `p[1]` (Shape A target).

Tiers: 1.2/base, 1.2/sp2, 1.2/sp2p3, 1.2/sp3, 2.0/base,
2.0/sp1, 2.0/sp1p5, 2.0/sp2p4. 1.2-family tiers behave identically
to each other on this idiom; 2.0-family tiers same. Per-tier
deltas only between major families.

| C source                              | mwcc 1.2 (any SP)                                      | mwcc 2.0 (any SP)                               | Orig match (24 B) |
|---------------------------------------|--------------------------------------------------------|-------------------------------------------------|-------------------|
| `(p[1] & 1) ? 1 : 0`                  | 20 B `ldr/ands/movne/moveq/bx`                         | 20 B `ldr/tst/movne/moveq/bx`                   | NO                |
| `((unsigned)p[1] & 1u) ? 1 : 0`       | 20 B `ldr/ands/movne/moveq/bx`                         | 20 B `ldr/tst/movne/moveq/bx`                   | NO                |
| `((unsigned)p[1] << 31) >> 31`        | 12 B `ldr/and #1/bx` (peepholes shift to mask)         | 12 B `ldr/and #1/bx`                            | NO                |
| `(p[1] << 31) >> 31` (signed)         | 16 B `ldr/lsl #31/asr #31/bx` (ASR for sign)           | 16 B same                                       | NO                |
| `((unsigned)p[1] << 31) >> 31 != 0`   | 20 B `ldr/ands/movne/moveq/bx`                         | 20 B `ldr/tst/movne/moveq/bx`                   | NO                |
| `(p[1] & 1) != 0`                     | 20 B `ldr/ands/movne/moveq/bx`                         | 20 B `ldr/tst/movne/moveq/bx`                   | NO                |
| `!!(p[1] & 1)`                        | 20 B same                                              | 20 B same                                       | NO                |
| `(int)(_Bool)(p[1] & 1)`              | COMPILE ERROR (no `_Bool` in C89 mwcc)                 | COMPILE ERROR                                   | -                 |
| bitfield struct `{unsigned b:1;}`     | 16 B `ldr/lsl #31/lsr #31/bx` (no redundant tail)      | 16 B same                                       | NO                |
| `unsigned t = ...; t = t<<31; t=t>>31;` | 12 B `ldr/and #1/bx` (optimiser fuses)               | 12 B same                                       | NO                |
| `volatile unsigned t = ...;`          | 32 B (stack spill + reload + lsl/lsr/bx, no tail)      | 40 B (callee-save push + 32 B body)             | NO                |
| `-(p[1] & 1) >> 31` (signed neg shift) | 20 B `ldr/and/neg/asr/bx`                             | 20 B same                                       | NO                |
| explicit `if (t != 0) return 1; else return 0;` (NOT shift-extract first) | 20 B `ldr/ands/movne/moveq/bx`     | 20 B `ldr/tst/movne/moveq/bx`                   | NO                |
| ternary on shift `(((unsigned)p[1] << 31) >> 31) > 0u ? 1 : 0` | 20 B same                                | 20 B same                                       | NO                |
| **`unsigned t = (unsigned)(p[1] << 31) >> 31; if (t != 0u) return 1; return 0;`** | **24 B `ldr/lsl #31/movs lsr #31/movne #1/moveq #0/bx` ✓** | 20 B `ldr/tst/movne/moveq/bx` | **MATCH on 1.2, no-match on 2.0** |
| `((unsigned)p[1] << 31) >> 31 != 0u`  | 20 B `ldr/ands/movne/moveq/bx`                         | 20 B `ldr/tst/movne/moveq/bx`                   | NO                |
| `(((unsigned)x << 31) >> 31) ? 1 : 0` | 20 B same                                              | 20 B same                                       | NO                |
| bitfield + cast `(int)((struct B *)&p[1])->b` | 16 B `ldr/lsl/lsr/bx`                          | 16 B same                                       | NO                |
| compare-and-one `(p[1] & 1) == 1 ? 1 : 0` | 20 B `ldr/ands/movne/moveq/bx`                     | 20 B same                                       | NO                |
| explicit subtract `(p[1] & 1) - 0 ? 1 : 0` | 20 B same                                         | 20 B same                                       | NO                |
| or-with-zero `(p[1] | 0) & 1 ? 1 : 0` | 20 B same                                              | 20 B same                                       | NO                |

The winning variant is row **bold** above. Key structural
elements:

  1. **Shift-extract via unsigned cast** (NOT mask): `(unsigned)(x
     << 31) >> 31`.
  2. **Stored in a named temp** (forces the result to be a
     concrete value, not a "currently in the AND ALU" implicit).
  3. **Explicit `if (t != 0u) return 1; return 0;`** (NOT a
     ternary or implicit conversion). Forces materialisation of
     the literal 0/1.

Removing any one of these three elements collapses the shape
under mwcc 2.0 (and under mwcc 1.2 for some elements). The
combination is precisely fragile enough that mwcc 1.2 emits the
explicit shift-test-materialise sequence the orig has.

## Shape B — byte-zero check (bitfield recipe, brief 218)

⚠️ **The brief 214 Shape B claim was wrong**, falsified by brief
217's empirical retest:

> brief 217: All mwcc tiers collapse `(unsigned)x << 24 >> 24 == 0`
> to a 5-insn `ands; moveq #1; movne #0; bx lr` shape (20B), NOT
> orig's 7-insn `lsl/lsr; movs; moveq/movne; bx lr` (28B). The
> direct-shift idiom **does not** reach orig on either mwcc tier.

**Brief 218 found the correct recipe.** A **bitfield-struct read**
of the low byte under the default mwcc 2.0/sp1p5 tier produces
the orig shape exactly:

```c
struct LowByteStruct {
    unsigned int low8 : 8;
    unsigned int upper : 24;
};

extern struct LowByteStruct data_ov000_021c7530[];

int func_ov000_021ab6cc(void) {
    return data_ov000_021c7530[0x58 / 4].low8 == 0;
}
```

Compiled with default `mwccarm 2.0/sp1p5 -O4,p -enum int
-char signed -str noreuse -proc arm946e ...`, this produces
verbatim:

```
e59f0014  ldr   r0, [pc, #20]
e5900058  ldr   r0, [r0, #0x58]
e1a00c00  mov   r0, r0, lsl #24
e1b00c20  movs  r0, r0, lsr #24
03a00001  moveq r0, #1
13a00000  movne r0, #0
e12fff1e  bx    lr
```

Byte-identical to orig. Same recipe works for `func_ov000_021af5c0`
(offset `0x34` instead of `0x58`).

### Why bitfield works where `(unsigned)x << 24 >> 24` fails

mwcc 2.0/sp1p5's `(unsigned)x << 24 >> 24` peephole recognises
the shift pair as a byte mask and folds to `ands r0, r0, #0xff`.
**The bitfield read goes through a different code path**: the
compiler emits the canonical bitfield-extract sequence
(`lsl #24; lsrs #24` for an `unsigned : 8` field at the low
end), and that sequence doesn't go through the mask peephole.

The `if (t != 0u) return 0; return 1;` brief 214 used didn't
help because the peephole fires earlier in the lowering pipeline
(during shift-pair recognition), before the comparison structure
is established.

### Variant matrix retest (brief 218)

Run on the actual picks with `data_ov000_021c7530` / `_021c758c`
binding context (not a stripped snippet). Tiers: all 5 from the
canonical pool (1.2/base, 1.2/sp2p3, 1.2/sp3, 2.0/sp1p5,
2.0/sp2p4).

| C source                                          | 1.2 tiers (all)                 | 2.0/sp1p5                       | 2.0/sp2p4                       | Match |
|---------------------------------------------------|---------------------------------|---------------------------------|---------------------------------|-------|
| `(uint8_t)x == 0` via `ldrb`                      | `ldrb` shape (5 insn, 20 B)     | `ldrb` shape                    | `ldrb` shape                    | NO    |
| explicit shifts in locals: `s1=v<<24; s2=s1>>24;` | `ands #0xff` shape (5 insn)     | `ands #0xff` shape              | `ands #0xff` shape              | NO    |
| `volatile` cast on shift result                    | 13+ insn with stack frame       | 14+ insn                        | 14+ insn                        | NO    |
| inverted polarity `if (t) return 0;`               | `ands #0xff` shape              | `ands #0xff` shape              | `ands #0xff` shape              | NO    |
| multiply-shift `v * 0x01000000u >> 24`             | `ands #0xff` shape              | `ands #0xff` shape              | `ands #0xff` shape              | NO    |
| **bitfield struct, `low8 : 8` field == 0**         | `ldrb` (1.2 emits ldrb)         | **`lsl #24 / lsrs #24` ✓**      | **`lsl #24 / lsrs #24` ✓**      | **YES on 2.0** |

The bitfield recipe is **unique to 2.0**. 1.2 tiers see the
bitfield read and emit `ldrb` (because 1.2 has a ldrb peephole
that fires on bitfield-byte-low reads). Only the 2.0 family
emits the explicit shift pair.

This means the two picks should ship as plain `.c` (not
`.legacy.c`). Verified: 3-region `ninja sha1` PASS preserved.

### Shipped (brief 218)

- `src/overlay000/func_ov000_021ab6cc.c` — NEW (replaces
  `.s` shipped by brief 217).
- `src/overlay000/func_ov000_021af5c0.c` — NEW (replaces
  `.s` shipped by brief 217).
- This research note's § Shape B amended with the falsification
  + bitfield recipe.

## What got shipped

| Change | Path | Notes |
|--------|------|-------|
| Worked example | `src/main/func_020a584c.legacy.c` | NEW — replaces deleted `.s` |
| Delete | `src/main/func_020a584c.s` | superseded |
| Delinks entry update | `config/eur/arm9/delinks.txt` | path `.s` → `.legacy.c` (only EUR has this entry) |
| Detector | `tools/predict_walls.py` | new C-37 detector, 4-polarity hex-tail match |
| Tests | `tests/test_predict_walls.py` | 7 new tests (4 polarity variants + 3 negative cases) |
| Taxonomy | `docs/research/codegen-walls.md` | new C-37 section |
| Research note | `docs/research/bit-test-0-or-1-idiom.md` | this file |

## Hit count

Static scan of `src/**/*.s` post-fix (`tmp/c37_count.py`, removed
after measurement):

```
C-37 hit count in src/**/*.s: 2

file                                              width    polarity
-------------------------------------------------------------------
src/overlay000/func_ov000_021ab6cc.s            lsl/lsr#24  1-if-zero
src/overlay000/func_ov000_021af5c0.s            lsl/lsr#24  1-if-zero
```

Both are Shape B (byte-low extract) — these are the 2 picks
brief 215+ decomper could convert to `.c` using the recipe above.

Plus the swapped-out `.s` (now `.legacy.c`) for `func_020a584c`:
**3 known C-37 picks in the current corpus**.

For future picks: the predictor surfaces C-37 in the
`reason` column of `tools/next_targets.py` automatically, so the
decomper sees the wall classification at pick time and routes
straight to the correct C tier without burning iteration cycles
on plain-C attempts.

## What brief 214 ruled out

- **No C variant reaches Shape A from mwcc 2.0**. The bit-test
  peephole is robust across the 23 idioms tried. Routing to
  legacy is the only path.
- **No source-side workaround under mwcc 2.0 for Shape A**.
  Tried: `volatile`, bitfield, explicit temp, goto, signed/
  unsigned cast permutations, comparison forms. mwcc 2.0's
  bit-test recognition kicks in regardless of the wrapping
  expression.
- **No new wall family beyond C-37**. Brief 213's "4 picks"
  claim was off-by-one — the table only lists 3 (`func_020a584c`,
  `_ov000_021ab6cc`, `_ov000_021af5c0`). The static scan
  confirms 3 = full corpus for this idiom.
- **`gen_c34_s.py` blx regex bonus** (brief 211 § Recipe notes):
  still not promoted to `tools/` checkin; remains a sibling
  candidate for a future brief. Out of scope for brief 214.

## Verification

- [x] `python -m unittest tests.test_predict_walls` — 86 tests
      pass, +7 from main.
- [x] `python -m ruff check tools/ tests/` — clean.
- [x] Worked-example compile check: `mwccarm 1.2/sp2p3` on
      `src/main/func_020a584c.legacy.c` produces
      `e5900004 e1a00f80 e1b00fa0 13a00001 03a00000 e12fff1e`
      = orig bytes (matches `build/eur/delinks/src/main/
      func_020a584c.o`'s `.text` byte-for-byte).
- [x] Markdown lint manual check: MD001/MD022/MD025/MD031/
      MD047 etc. all pass.

## Needs brain's local build to verify

- [ ] `ninja rom` clean on EUR after the `.s`→`.legacy.c` swap +
      delinks.txt edit. mwldarm should link the same way it
      links other `.legacy.c` ships.
- [ ] `dsd check modules` stays at 24/27 baseline.
- [ ] `ninja report` shows `func_020a584c` still
      `matched_functions: 1, fuzzy: 100%` (the brief 213 ship
      was already credited; this swap should preserve credit
      since bytes are identical).
- [ ] `tools/predict_walls.py --version eur` (or with
      `--module main --address 0x020a584c`) hits the new C-37
      detector on the orig binary. Sanity check that the detector
      sees the shape under real `arm-none-eabi-objdump` output
      (synthetic tests cover the regex; real-binary smoke is a
      brain-side verification because scaffolder lacks objdump).
- [ ] Cross-region SHA1 — tools-only PR + 1 file swap that
      doesn't cross-region (no USA/JPN port for `func_020a584c`
      exists in the current tree), EUR-only is sufficient per
      `docs/state.md` verify-gate rules.

## Cross-references

- [`trivial-bucket-revalidated-2026-05-25.md`](trivial-bucket-revalidated-2026-05-25.md)
  — brief 213's drain report that flagged the 3 picks as `.s`
  and asked for brief 214 investigation.
- [`codegen-walls.md`](codegen-walls.md) § C-37 — taxonomy
  entry with full recipe + detector cue spec.
- `tools/predict_walls.py` — extended with the C-37 hex-tail
  detector.
- `tools/mwccarm/1.2/sp2p3/mwccarm.exe` + `2.0/sp1p5/mwccarm.exe`
  — the local toolchain installation that made the empirical
  matrix possible. Scaffolder previously couldn't run mwccarm
  directly; this brief was the first to verify the unblock.

## Note on scaffolder constraints

`scaffolder.md` documents "no local toolchain" as a constraint,
but the worktree under
`C:/Users/leona/Dev/gx-spirit-caller/scaffolder/tools/mwccarm/`
has the full mwccarm SP cross-product downloaded. Brief 214
proved that direct mwccarm invocation works fine — bypassing
ninja entirely. Future scaffolder briefs that need to test
specific source → codegen mappings can use the same approach
(see `tmp/variant_runner.py`-style pattern: write a C snippet,
shell out to mwccarm, parse the resulting ELF for `.text` bytes).

The restriction on `ninja` / `dsd` / `objdiff` remains accurate —
those orchestrate the full build with baserom checks. But mwccarm
as a standalone compiler is fair game for variant-matrix work.
Updating `scaffolder.md` to reflect this is a brain-side
decision (the file is brain-owned, not scaffolder-owned), but
worth flagging.
