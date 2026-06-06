[//]: # (markdownlint-disable MD013 MD041)

# Brief 363 — permuter PILOT on the main near-miss backlog

**Brief:** 363 (scaffolder). main's direct-mwcc yield declined three waves
(16→13→10), so pivot to the vendored permuter (`tools/_vendor/decomp-permuter`).
Run it on the well-characterised routed batch; ship anneals to EUR objdiff 100% as
clean C; **report the hit rate** (worth scaling?); flag data-reloc deps (the real
gate is `ninja sha1`). Fallback to main wave 8 if hit rate < ~30%. Branch
`scaffolder/main-permuter`.

## Headline — 3 of 8 matched (37.5%, ABOVE the 30% bar); the split is by class

**The permuter lane is worth scaling.** It cracked **3 of the 8** routed
near-misses to byte-identical C — and the 3/5 split is **class-determined, not
random**: the permuter solves the canonicalisation/peephole classes that
hand-written C *cannot* reach (because the divergence is in a mwcc transform the
front-end re-applies regardless of source), but plateaus on the CSE-of-constant
and frame-allocation classes.

| func | class | result | best score |
|---|---|:---:|---|
| `020195b8` | commutative-operand (add order) | **MATCH** | 0 |
| `02018dcc` | peephole-split (`(v<<31)>>31`→`and#1`) | **MATCH** | 0 |
| `0201b690` | peephole-split (`(v<<24)>>24`→`and#0xff`) | **MATCH** | 0 |
| `02031794` | `\|\|`-equality (CSE-of-base) | plateau | 705 |
| `0202ef08` | `\|\|`-equality | plateau | 705 |
| `0202f59c` | `\|\|`-equality | plateau | 805 |
| `02031764` | `\|\|`-equality | plateau | 705 |
| `020536d0` | frame push-reg-vs-`sub sp` | plateau | 355 |

3 shipped as clean C, all EUR objdiff 100% + clean re-delink drop-out + **EUR
`ninja sha1` OK** (link-clean — bl relocs only, no data-reloc). main `complete`
1743 → 1746.

## What the permuter found (the levers hand-C can't reach)

- **`020195b8`** — the orig's `entry + a1` add canonicalises to a fixed operand
  order under mwcc no matter how you write it in C (wave 6 hand-reorder failed).
  The permuter found a **variable-reuse** form: `sys = e + a1; return *(uchar*)
  (sys + 20);` — reusing `sys` flips the operand order. Unreachable by hand.
- **`02018dcc`** — `(v<<31)>>31` peepholes to `and #1`. The permuter routed the
  shift amount through dead vars (`n=31; (v<<n)>>n`) so mwcc keeps `lsl/lsr`.
- **`0201b690`** — `(v<<24)>>24` peepholes to `and #0xff`. The permuter split the
  shift across statements (`k=v<<24; nv=k; return nv>>24;`) to keep `lsl/lsr`.

These confirm the wave-6 finding (the peephole reduces `&`-mask-able
shift-extracts) is **permuter-recoverable** — the permuter mutates the C *shape*
to dodge the peephole, which hand-C can't do cleanly.

## What resisted (route elsewhere, do NOT scale the permuter here)

- **`\|\|`-equality / CSE-of-base (4/4 plateau ~705-805).** The orig CSEs the
  comparison base into a reg (`addne r1,base,#K`); mwcc refuses to CSE it from
  *any* C the permuter generates. This is a fixed front-end decision, not a
  C-expressible permutation → genuinely permuter-resistant. Route to `.s`
  (`asm_escape --whole-function`) or leave walled.
- **`020536d0` frame push-vs-sub-sp (plateau 355).** Closest non-match; the
  frame-allocation style (`push {r3,…}` vs `sub sp,#4`) is downstream of register
  pressure, only weakly steered by C. **Borderline** — might fall to a much
  longer budget (it was capped at 150s); worth a retry at 600s before declaring
  it resistant.

## Hit-rate verdict + scale recommendation

**37.5% (3/8) is a conservative floor** — this batch was skewed toward the
*resistant* CSE class (4 of 8 were `\|\|`-equality, which I'd already flagged in
wave 5 as "mwcc won't CSE the base"). The permuter cracked **100% of the
non-CSE/non-frame batch** (3/3: commutative + peephole). So:

1. **Scale the permuter on the commutative-operand / peephole-split /
   reg-mirror / scheduling residue** — the large pile from waves 1-7 that I
   declared walls because hand-C couldn't flip the operand order or dodge a
   peephole. That pile is the permuter's wheelhouse and was *under-represented*
   in this pilot; expect a higher hit rate there.
2. **Do NOT route the `\|\|`-equality family (4) or pure frame-style misses to
   the permuter** — they plateau. `.s`-escape or leave walled.
3. Retry `020536d0` once at a 600s budget (it was the closest miss).

## Harness notes (for the next permuter wave)

- Flow that works: carve the near-miss as a TU (`.c` + `delinks` `complete`) →
  `ninja <tu>.o` → `dsd dis -c … -a build/eur/disasm` → **bridge the name**
  (`cp build/eur/disasm/src/main/func_<a>.s build/eur/disasm/main_<a>.s`) →
  `tools/permute.py func_<a> --run --max-seconds N --threads 6`.
- **Bridge gotcha:** `dsd dis` emits `build/eur/disasm/src/main/func_<a>.s`, but
  `permute.py` looks for `build/eur/disasm/main_<a>.s`. The wrapper's path
  expectation is stale vs current dsd-dis output naming — bridge with a copy, or
  fix `permute.py`'s target-`.s` resolver (recommended follow-up).
- Matched C is **permuter-ugly** (helper vars like `new_var2`) but byte-exact;
  shipped as-is with a header comment. Scratch dirs (`nonmatchings/`,
  `perm_work/`, `permute_log/`) are gitignored.

## Verification

| Gate | Status |
|---|:---:|
| permuter objdiff (score 0) | **3/3 byte-identical** |
| clean re-delink drop-out | **3/3** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical; link-clean) |
| `ruff` / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 3 `.c` (`020195b8`, `02018dcc`, `0201b690`); EUR
`arm9/delinks.txt` +3 `complete` (1743 → 1746). No tool / USA / JPN change.

## Cross-references

- `docs/research/brief-361-main-wave7-tri-compile.md` — the pivot flag that
  triggered this pilot.
- `tools/permute.py` / `tools/_vendor/decomp-permuter/` — the permuter harness.
