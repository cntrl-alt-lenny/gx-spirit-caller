[//]: # (markdownlint-disable MD013 MD041)

# Brief 381 — vendor m2c + make the permuter productive (WSL lane)

**Brief:** 381 (decomper). The permuter lane is validated (brief 379) but had no
near-miss inputs. Close the gap: vendor m2c (the asm→C decompiler), pipeline a
TIER-1 target through m2c → permuter → ship the C match, and prioritize the
crack-once families. Target: validate the pipeline + the first crack-once family.

## VERDICT

- **m2c + permuter pipeline is WORKING end-to-end on WSL** — proven on a real
  worklist target. m2c is vendored + reproducible; it produces clean near-miss
  C; the draft cleans to compilable C; the permuter anneals it.
- **Recoveries shipped: 0.** The first target (`021ceffc`) **resisted** — it is a
  peephole-split *with an instruction-scheduling interleave*, and that mixed
  shape plateaued the permuter (score 425 over ~49k iters across 4 threads, both
  90s and 300s runs) and re-fused under every hand-dodge. Honest finding: the
  commutative/peephole tier is **not** a guaranteed quick crack — seed shape and
  per-function budget matter, and "labeled peephole" can hide a scheduling
  component.
- **Crack-once families: not reached** (the pipeline-validation target consumed
  the budget). Note they are reg-alloc-CLASS (358 plateau evidence) and may not
  be permuter-tractable at all — see recommendation.

## Delivered: m2c vendored (reproducible)

`tools/m2c_bootstrap.py` (new) clones m2c (`matt-kempster/m2c`) at pinned commit
`ce05217168…` into `tools/_vendor/m2c` (gitignored, like decomp-permuter) and
installs `pycparser` into `.venv_permuter/`. Confirmed: `m2c.py -t arm-mwcc-c`
runs and decompiles. `tools/m2c_feed.py` (already present) produces the GNU-as
`.s` m2c consumes.

## The pipeline (validated, with a worked example)

The full loop, run on `func_ov011_021ceffc` (ov011, 0x4c, worklist TIER-1
peephole-split):

1. **feed:** `m2c_feed.py --version eur func_ov011_021ceffc > f.s` → 23-line `.s`.
2. **decompile:** `m2c.py -t arm-mwcc-c -f func_ov011_021ceffc f.s` → readable C,
   including the exact nibble-reposition the worklist flagged
   (`((x<<0x17)>>0x1C ...) >>0x13`).
3. **clean:** rewrite m2c's `?`-typed struct access into the project idiom —
   `extern char data_ov011_…[]` + `*(int *)(base + 0xNN)`, base bound to a local
   (`char *b = data_…;`) per the overlay convention.
4. **compile + gate:** carve a TU + `ninja sha1`. Compiles cleanly; the **first 9
   instructions match the target byte-for-byte** (base loads, the 0x2ac
   bitfield, the 0x2a0 guard, `bxne lr`).
5. **permute:** `dsd dis` (bridge the `func_<mod>_<addr>.s` name to the flat
   `<mod>_<addr>.s` permute.py expects) → `permute.py --run -j 4`. The permuter
   anneals (score dropped from ~700 to 425). **Works on WSL `fork`.**

So every stage of the pipeline functions. The blocker was step-5 *convergence on
this function*, not the machinery.

## Why `021ceffc` resisted (the technical finding)

The only diff is the nibble-reposition tail. The **target keeps three separate
shifts**:

```
mov r0, r1, lsl #0x17     ; x << 23
mov r0, r0, lsr #0x1c     ; >> 28
bic r1, r1, #0x1e00       ; (interleaved) x & ~0x1e00
mov r0, r0, lsl #0x1c     ; << 28
orr r0, r1, r0, lsr #0x13 ; | (>> 19)
```

but mwcc **fuses** my equivalent C's `(y>>0x1C)<<0x1C` into `and r0,r0,#0xf0000000`
and schedules the `bic` earlier — so it is a peephole-split **plus** a scheduling
interleave. The permuter plateaued at 425 (the ~3-instruction tail) and never
reached 0; hand-dodges (base-bind, temp-split into a named `unsigned int`) all
re-fused to identical bytes. This is exactly the kind of mixed case 358 warned
plateaus; a *pure* commutative-operand swap (363's fastest class, e.g. the
shipped `020195b8`) is the better validation/first-recovery target.

The failing near-miss `.c` fails `ninja sha1`, so it was **not** shipped (reverted
the carve; EUR sha1 green).

## WSL-lane additions (beyond brief 379)

- m2c bootstrap (above). pycparser into `.venv_permuter`.
- **`dsd dis` only emits CARVED functions** — to permute an uncarved target you
  must carve a (near-miss) TU first, then `dsd dis`, then bridge the name.
- Build with **`ninja sha1`/`ninja rom`, not bare `ninja`** on WSL — bare ninja
  builds the `.ctx.c` scratch-context targets, which fail to find project
  headers (`ov004_core.h`) under the Linux preprocessor and abort the build
  (the ROM/delinks are unaffected).

## Recommendation

The pipeline is a **reusable capability** now — vendored, documented, proven
end-to-end. To actually *land* recoveries:

1. **Target the pure commutative-operand subclass first** (operand-order swaps,
   363's proven-fastest), not mixed peephole+scheduling — higher crack rate,
   validates "ship a C match" cleanly.
2. **Seed quality matters** — the m2c draft's shape bounds the permuter's
   mutation space; a structurally-closer seed converges; `021ceffc`'s tail was a
   poor seed for the fusion-dodge.
3. **Budget ≥600s** for mixed cases (worklist guidance), and accept that some
   "TIER-1" entries are mislabeled mixed cases that plateau.
4. **The crack-once families (dispatcher/discriminant/post-blx/BGCNT) are
   reg-alloc-class** — 358's evidence is they *plateau* on the permuter. Probe
   one canonical at ≥600s to confirm, but expect them to remain `.s` targets
   (the scaffolder's lane already drains that tier). The permuter's real
   wheelhouse is the front-end-transform classes (commutative, peephole), not
   these.

Net: the m2c+permuter lane is stood up and working; the next session should drive
it on pure-commutative targets to bank the first shipped recoveries.
