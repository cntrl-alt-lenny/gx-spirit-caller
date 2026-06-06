[//]: # (markdownlint-disable MD013 MD041)

# Brief 354 — ov002 deep-drain wave 4 (select + family sweep)

**Brief:** 354 (decomper). Keep selecting the fast forwarder/predicate/family
shapes; sweep the indirect-dispatch (`02257594…`) and arg-pack (`021d479c`)
families for siblings; defer the codegen-finicky bodies. No dual-compile (ov002 =
2.0). Gate = 3-region `ninja sha1`; carve audit; GOTCHA-18; divmod. Target 14–17.

## Headline

**14 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK** — the target floor.
This wave reached into a **harder tier** (0x3c–0x44): the easy forwarder/predicate
shapes thin out and the **codegen-finicky class grows** (inline-vs-branch,
mirror-reg, scheduling), so the per-wave yield dipped from ~16 to 14 and took more
defers to characterise.

## Family sweep (reloc-grep the gap objs)

Grepping the gap `.o` relocations for callers of a sink finds family members fast:

- **`func_02257464`** (indirect-dispatch resolver) — 12 callers, but the *simple*
  `blx`-form family is **drained** (wave 3 took 3); the rest are loops /
  struct-builders.
- **`func_021d479c`** (arg-pack sink) — **126 callers**, a big vein, but most
  remaining are **byte-pack-finicky** (`and #255; orr …,lsl#8`). The clean ones
  are simple-`(u16)`-cast tail-calls (`021d90c0`: kind 58 + `(u8)arg1` + lo/hi
  u16 of arg2 — needs `(unsigned)arg2 >> 16` for the `lsr`).

So the families are **not infinitely cheap**: the easy members go first, then the
tail is the finicky variants.

## The 14 picks

flag-compare predicates (`022090b8`, `0220a148`), guard+forward (`02281994`,
`0220444c`, `02242570`, `02292020`), bit-test with field save/restore
(`021decdc`, `021de598`), bitfield-guard + table-id tail-call (`0220a94c`,
`0220aa20`, `0220b094`), multi-counter OR predicate (`022b3910`), guard+call+store
(`021d1be4`), per-player table value-map (`02209004`).

## Recipes banked / refined

1. **The pass-through lever also rescues "mirror-reg" near-misses.** When a holder
   lands in `r2` (not `r1`) on a *pure-looking* predicate, the sink takes a live
   arg — forward it. `02292020`: `func_02291160(arg0, arg1)` pushes the holder to
   `r2` and matches. (Some "mirror-reg" defers are really pass-through.)
2. **u16-holder slot id** — `struct { u16 id : 13; }` for an `ldrh`-loaded id
   (distinct from core.h's 32-bit `Ov002Slot`); index via the asymmetric
   `(unsigned)(x << 23) >> 21` (`0220a94c`/`aa20`).
3. **dual-bitfield holder** — `struct { u16 b0:1; u16 :11; u16 f12:2; }` reads the
   u16 once and extracts bit0 + a high field (`02292020`/`0220b094`).
4. **value-map pre-zero** — `r = 0; if (v <= N) r = 1; return r;` emits `movls`
   *without* the `movhi` that `return v <= N` adds (`02209004`).

## The dominant defer class — INLINE-vs-BRANCH

The recurring miss this wave: a guard's `return 0` **inlines** (`movne#0; popne`)
where the orig **branches** to a shared `return 0` epilogue. It is **unsteerable
by C form** — even the `&&` rewrite changes the *last* condition's handling.
Affected: `02267f90`, `021efd38` (3-way dispatch), the `02201e38`/`0220d7c0`/
`02205dc8` bitfield-bit-compare family, `0220599c` (guard + tail-call). Plus
mirror-reg with no sink to forward to (`0220cff8`), multi-store scheduling, and
byte-pack (the `021d5xxx` arg-pack cluster).

Per the project's "route, don't grind" guidance, these belong in a **permuter /
`.s` / `asm_escape --c`** pass (`asm_escape --c` is 2.0-only, which *fits* ov002).
They are 1-instr-class misses, well-catalogued in `ov002_core.h`.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 14 carved) |
| `check_match_invariants.py` | 0 errors (5350 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (sha1 proves overlay-swap isolation) |

Carve-size audit caught 1 mis-size (`02292020` 0x38→0x3c), auto-fixed. No strays.
EUR-only config change (+14 `complete` blocks); `ov002_core.h` §VERIFIED extended.

## Recommendation for the brain

ov002 stays majority-matchable, but the per-wave **easy yield is now tier-bound**:
the small (≤0x38) clean shapes are largely drained, and from 0x3c up the
inline/branch + mirror-reg + byte-pack classes dominate. Two moves:

1. **Keep one more select wave** working a fresh address region's small shapes
   (the worklist still has untouched ≤0x38 clusters by address).
2. **Spin up the routing pass** — the accumulated finicky backlog (inline/branch
   especially) is now sizable and uniform; `asm_escape --c` (2.0) + permuter would
   convert a big batch in one dedicated pass, rather than 1–2 defers per wave.

## Cross-references

- `src/overlay002/ov002_core.h` — §VERIFIED (waves 1–4) + the family-sweep note +
  the inline/branch defer catalog.
- `docs/research/brief-352-ov002-deep-drain-wave3.md` — wave 3 (the indirect-
  dispatch family + the `blx` comparator fix).
