[//]: # (markdownlint-disable MD013 MD041)

# Brief 283 — cold-RE wave 5: ov002 simple-shape + the accessor signature

**Brief:** 283 (decomper). Apply brief-282's canonical accessor signature
to clear the wave-4 1-register-off tier, then keep draining ov002's
simple-shape vein (gotchas 23/24/25 + anti-fold; loops → permuter).

## Headline

**11 shipped, all 3-region SHA1 PASS — and the 1-reg-off wall is solved.**
brief-282 hadn't landed, but the wave-4 finding pointed straight at it:
the per-player accessors **pass their parameters through to their
callees**, which keeps `r0`/`r1` reserved across the body, so mwcc colours
the index/value temp into `r2`/`ip` — exactly what the originals do. My
wave-4 *minimal* calls dropped the pass-through, freed `r1`, and mwcc took
the lower register (the +1 offset). The fix is a **calling-convention
restoration, not a struct** — 3 deferred accessors became ships, and the
principle (G26) generalises to the whole `0x868` accessor tier.

## The accessor-signature lever (the wave-4 wall, solved)

Wave 4 deferred 5 accessors that were byte-exact except one register.
Diagnosis here: in the orig, `r1` is **never written** yet is **live at
the `bl`** — i.e. the callee is invoked with the incoming `arg1` (and
often `arg0`) passed straight through. That reservation is what pushes the
`0x868`/`cf16c` temp to `r2`.

| pick | fix |
|---|---|
| `021ba1a0` / `021ba1e8` | call `func_021b91c4(slot, arg1)` — pass `arg1` through |
| `021bcfe4` | call `func_021bc288(arg0, arg1)` — pass both through |

(`(void)arg1` does **not** work — mwcc treats the cast as a use, then
drops the dead param and frees `r1`. The param must be genuinely
forwarded to a call.) `021bad58` stays deferred — it is a **leaf** (no
callee to forward to), so the lever doesn't apply; its `ip`/`r3` temp
choice is a separate allocator nuance.

## Shipped (11)

**Accessor tier cleared (3):** `021ba1a0`, `021ba1e8` (608/928-list push,
pass `arg1` to `func_021b91c4`), `021bcfe4` (slot-id guard, pass both to
`func_021bc288`).

**New simple-shape (8):**

| addr | size | role |
|---|---|---|
| `021b141c` | 0x3c | f3412 latch: run `021b12bc`, drop latch if f3408 clear |
| `021bd6c8` | 0x48 | event-code match (`arg0==0x10f4 && f220==0x150b`, or `f220==arg0`) |
| `021b8f80` | 0x4c | short-circuit chain of phase predicates |
| `021b1458` | 0x30 | pack 4×u16 record → `func_021b1570(arg0,-1,&rec[1],6)` |
| `021b3f0c` | 0x50 | cd3f4-match row select → `cd4c2[row]` → `func_021b3c10` (norm 0/1) |
| `021b3058` / `021b30f4` | 0x54/0x58 | cd3f4-match row → `cd4c2[row]` → 6-arg `func_021b2ebc` (mode 0/1 pair) |
| `021b0b0c` | 0x48 | id→flag: `cd31c[arg0]` if `<53` else bit `(arg0-54)` of the `cd3f0` bit-array (signed `/32`,`%32`; **unsigned word** → `lsr`) |

All 8 matched on the first compile (modulo the one `lsr`/`asr` word-sign
fix on `021b0b0c`) — shape-triage + the banked recipes are now reliable.

## New gotcha (added to recipe-gotchas.md)

- **G26 — pass-through params reserve their registers.** When a function
  forwards an incoming arg unchanged to a callee, that arg's register
  (`r0`/`r1`/…) stays reserved across the whole body, pushing temps to
  higher registers. If a function is byte-exact except for a **+1
  register offset** on an index/value temp, check whether the orig passes
  a parameter through to a call that your model dropped — restore the
  forwarded arg (not a `(void)` cast). (brief 283 `021ba1a0` family,
  `021bcfe4`.)

## Banked verbs

- `func_021b91c4(int *slot, int arg1)` — list-push helper.
- `func_021b1570(code, -1, u16 *rec, n)` — event-send with a record.
- `func_021b2ebc(a, v, c, mode, 0, 0)` — the 6-arg command sink.
- `data_ov002_022cd3f4` — the active `{f0=code, f28=sub}` pair; many
  dispatchers branch on `(arg0,arg1) == (cd3f4.f0, cd3f4.f28)`.
- `data_ov002_022cd4c2` — a 20-byte-row table indexed by that match flag.
- `data_ov002_022cd31c` / `cd3f0` — a direct flag table + a bit-array.

## Deferred → permuter

`021bad58` (leaf temp-reg nuance), `021b9ba0` (predication vs `popeq`),
`021b9b64` (byte-unpack canonicalisation), and the loop families
(`021b9b20`, `021b97d4`, the wave-3 search-loop / list-walk). The `0x868`
accessor tier is otherwise hand-drainable now that G26 is understood.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 11/11 byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4677 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2302 passed |

(`src/overlay002/` gains 11 `.c`; EUR ov002 `delinks.txt` gains 11
`complete` blocks. No USA/JPN config change. `tools/m2c_feed.py` + the
in-process shape-triage scan drove every pick.)

## Recommendation for the brain

1. **G26 unblocks the `0x868` accessor tier** — many of the wave-3/4
   "1-reg-off" defers are the same pass-through pattern. A wave 6 can
   sweep the accessor family applying G26 by default (model the callee
   args from the orig's live registers, not from minimal signatures).
2. Keep shape-triaging the `<0x100` vein — straight-line / dispatcher /
   accessor shapes are now a high-yield hand-drain (11/12 attempted this
   wave shipped).
3. Route the genuine loops + leaf-temp/predication nuances to the
   permuter; they are a small residue, not the bulk.

## Cross-references

- `docs/research/brief-281-coldre-wave4-ov002-simple.md` — the 1-reg-off
  wall this wave solves; G23-25.
- `docs/research/brief-278-harvest-census-clusterA-map.md` — the `<0x100`
  runway + `size_census.py`.
- `docs/research/recipe-gotchas.md` — G21 (bitfield via pointer), G25
  (only bitfields force `lsl;lsr`), G26 (pass-through reg reservation).
