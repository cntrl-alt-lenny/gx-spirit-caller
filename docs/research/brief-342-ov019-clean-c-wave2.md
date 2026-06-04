[//]: # (markdownlint-disable MD013 MD041)

# Brief 342 — ov019 clean-C wave 2 (thinning; lever-scope refinement)

**Brief:** 342 (decomper, Windows lane). Continue draining ov019 after wave 1's
5. Full recipe library; reshape register-CHOICE inline; catalogue
scheduling/SR/caller-saved/LICM/post-blx misses for the Mac lane (proven not
Windows-recoverable by brief 340 — don't grind them). Target ~6; pivot to
ov007/ov014 if ov019 thins below ~4 (steer clear of ov009, the scaffolder's).

## Headline — 4 matched; ov019 wave-2 tier drained

**4 shipped (all `.c`), EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** ov019 is
lower-cluster than ov018 (the brief flagged the smaller ramp), and wave 1 took
the cleanest 5. Wave 2 cleared the teardown/render-setup subset; the residue is
big render builders (120–261 insns) and a cohort of by-class Mac-only
near-misses. At the ~4 floor — recommend the next wave pivot to a fresh overlay
(ov007=16 / ov014=13).

## The 4 picks

| func | size | shape | recipe |
|---|---|---|---|
| `021b266c` | 0x64 | paired-scene teardown | **direct-MMIO** DISPCNT clear (ov018 `021accc8`) + call chain |
| `021b49bc` | 0x90 | scene-B teardown | dual guarded commit (`func_0201ef3c`) + Task_Invoke |
| `021b4560` | 0x9c | dual render-task stop | `func_0208f458/f3e4/f38c` + Task_InvokeLocked; const-reuse |
| `021b2818` | 0xc4 | number-render sprite | **magic-multiply `/10` & `%10` reproduce** from clean `a1/10` |

`021b266c`, `021b49bc`, `021b4560` matched on the **first** attempt — the ov018
direct-MMIO recipe and the `func_0201ef3c`/`func_0208f3e4` teardown families
transferred directly.

## Finding — clean magic-multiply division *does* reproduce

`021b2818` needs `a1 / 10` and `a1 % 10` (the `0x66666667` signed-div magic).
Written as a plain `a1 / 10 == 1 || a1 % 10 == 1`, mwcc emitted the magic
sequence **byte-exact, first try.** This is the same compiler, so a clean `/N`
or `%N` on an int is *not* permuter-class — it only becomes Mac-only when the
magic is interleaved into a larger expression (the HSV recombine `021acf80` in
ov018). Bank: don't pre-defer a function just because it divides.

## Lever-scope refinement (the useful negative result)

`021b4324` (row hit-test loop) came in at 63% as a **callee-saved register
permutation** — the class the declaration-order lever cracked on ov018
`021ad118`. But it did **not** crack here: the permuted set is {loop-i, the
param `a0`, the clamp const, the address-taken `&rect`}, and reordering the
local declarations (i-first, i-last, i=0-hoist) moved nothing. The param-binding
and address-taken-pointer allocations are decided by passes the source
declaration order doesn't reach.

**Refinement:** declaration-order cracks **pure loop-local** permutations
(`021ad118`'s count/min/i). When the permuted set is entangled with a parameter
or an address-taken pointer (`021b4324`), it's Mac-only. This sharpens the
brief-340 discriminator.

## Deferred — Mac/permuter, by class

| func | % | class |
|---|---|---|
| `021b4c30` | 70 | caller-saved flag-load r0/r1 (no call-arg use → r1) |
| `021b28dc` | 73 | caller-saved `lr`/`r12` swap + orr operand order in a bit-pack |
| `021b4324` | 63 | callee-saved permutation entangled with param + `&rect` (see above) |
| `021b3f34` | 77 | `ldrsh` (orig, inline signed) vs `ldrh` (mwcc truncation-opt); int-temps force `ldrsh` but spill (50%) |
| `021b26d0` | — | script-step dispatcher increment rotation (= ov017 `021b2c8c`) |
| `021b3068`/`021b4a4c`/`021b4258` | — | big render/init builders (long-tail) |
| `021b4f1c` | — | jump-table value-remapper (dense switch + counter checks) |

## Recommendation

ov019 is drained of its clean/teardown tier (waves 1+2 = 9). Pivot the next
clean-C wave to a fresh overlay (ov007 = 16, ov014 = 13). Route the by-class
near-misses + the dispatcher-rotation shape to the Mac permuter; they are
confirmed not Windows-recoverable.
