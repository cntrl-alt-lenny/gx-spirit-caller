[//]: # (markdownlint-disable MD013 MD041)

# Brief 261 — C-39 ov002 drain wave 4

**Brief:** 261 (decomper). (A) Drain the ~20 remaining C-39f
bit0-table-index picks (gotcha 14 variants). (B) Drain the ~37 other
wrappers. Close the cohort.

## Headline

**24 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** — 16 C-39f
(higher-variation forms) + 8 wrappers. The C-39 ov002 ≤0x80 cohort is
now **121 → 36** across waves 1-4 (≈70 % drained). It is **not fully
closed**: the 36 that remain are **8 settled skip-classes** (P-11 / the
brief-260 global-ptr-chase / byte-pack) + **~28 a genuinely harder tail**
(multi-helper-pre chains, global 3-way switches, stride-reuse and
constant-fold compares, arg-bit-packing). The cheap C-39 vein is mined
out — recommend the **over-fire pivot** now, with the hard tail as
optional cleanup.

## (A) C-39f — 16 of 19 shipped via gotcha 14 + extra levers

The two-lever recipe extended cleanly to every variant **once the right
register lever was applied**:

- **self-consumed bool tails** (`helper(bit0, v) <op>`): `02294b18`
  `022938ac` `02294640` `02295940` `02287560`.
- **self-preserved + pre()/compare**: `02207fb0` `022957d0` `02293738`
  `0220ac78` (3-arg `helper(self,arg,v)`), `02209678` `0220d3cc`
  (2-pre-guard), `022874f8` (double-table).
- **2-D `mla` index** (`base + (bit0&1)*0x868 + b1_5*0x14`): `0220730c`
  `0220ba30` + the `02209db0` u16 variant — needed **gotcha 7** (helper
  `(self, arg1)` keeps r1 live → index temps to ip/r2/r3) and/or
  **invert-polarity** for the pre() guard.
- **special arg forms**: `0220378c` (helper's 2nd arg is `bit0` itself,
  left in r1 by the extract), `0220762c` (b6_11-guard + arg1 lever).

**New levers exercised this wave:** gotcha 7 applied to the 2-D-index
reg-alloc; invert-polarity to force the orig's branch-to-shared-epilogue
(`0220ba30`, `0220762c`); the C89 **mid-block-declaration** trap
(`022874f8` — mwcc rejects a decl after a statement).

`16/16 attempted-and-shipped at objdiff 100 %`.

### C-39f non-shippers (3)

- `0220b420`, `0228abd8` — **stride-reuse compare**: orig computes the
  guard bound as `add rN, stride, #K` (reusing the 0x868 already in a
  reg). C constant-folds `0x868 + K` to one literal, so the `add` can't
  be expressed. Lean P (codegen/fold).
- `0220000c` — complex composite (b6_11 guard + 2-D table + bit5 test +
  helper, multiple shared return-0 paths). Best 57 %; the predication/
  branch split across 3 exits didn't reconcile with one source form.

## (B) Wrappers — 8 shipped

| Pick | Shape |
|---|---|
| `0220acd8` | two global-word guards + `helper(bit0,bit0,b1_5)` |
| `02288428` | two global-word guards + `helper(bit0) < 0` |
| `0228867c` | two global-word guards + `helper(bit0,0x17) != 0` |
| `0222706c` | global-word guard → conditional helper1; tail helper2 |
| `02207010` | 5-arg helper (stack arg) gated + tail helper2 |
| `02202a78` | b6_11-guard (invert-polarity) + 5-arg helper |
| `02209db0` | 2-D u16 table + helper (gotcha 7 arg1) |
| `02209e50` | b6_11-guard (invert-polarity) + helper vs f14 bitfield |

The single-deref global-word guards (`*(g+0xcec)` etc.) drain fine —
they are NOT the brief-260 global-ptr-chase (which is `g->ptr->field`).

## Cohort state — 121 → 36 (not fully closed)

```text
remaining sole-C-39 <=0x80 ov002: 36
  settled skip-classes (8): P-11 CSE field-temp (02200084 / 02292020 /
    022319f4 / 0220d7c0 / 022946e4), global-ptr-chase (0223ba28 /
    02273b54, brief 260), byte-pack 021f4d3c
  hard tail (~28): multi-helper-pre chains (02294b64), global 3-way
    switches (0222b2e0 / 0223483c), arg-bit-packing (02231f4c), weird
    range/mask (02205c4c), + the 3 C-39f resisters above
```

**Honest status:** waves 1-4 drained 70 % of the cohort; each wave's
"drainable" estimate undercounted the complex tail. The remaining ~28
are NOT the clean bitfield/C-39f recipes — they are composite shapes
(global switches, helper-pre chains, constant-fold/stride-reuse
compares, runtime arg construction). Several are P-leaning. A wave 5
could grind a handful more, but the **cost/pick has risen sharply**.

## Next cohort

The **brief-256 over-fire worklist (584 cheap picks)** is the
recommended next cohort — far higher throughput than the C-39 hard tail.
The C-39 ov002 ≤0x80 residue (~28) is best left as opportunistic cleanup
or handed to the permuter, not a dedicated wave.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 24/24 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4481 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2264 passed |

## Cross-references

- `docs/research/recipe-gotchas.md` gotcha 14 (C-39f) + gotcha 7.
- `docs/research/brief-259-c39-ov002-drain-wave3.md` — wave 3; the
  cohort scoping correction this wave continues.
- `docs/research/brief-256-c39-table-index-and-overfire-scope.md` — the
  over-fire worklist (next cohort).
