[//]: # (markdownlint-disable MD013 MD041)

# Brief 275 — first Track-2 cold-RE wave (ov002 0x200-0x400 band)

**Brief:** 275 (decomper). First genuine cold-RE wave on the ov002
0x200-0x400 size band, using m2c (brief 272) for comprehension drafts.
**This is a calibration wave** — "report minutes / yield / gotcha per
pick so we can calibrate Track-2 velocity vs the old recipe drains."

## Headline — the calibration result

**0 shipped / 2 attempted in ~90 min** (`021d91e0` 67 %, `021b05d0`
82 %). **Comprehension is NOT the bottleneck — byte-match is.** m2c
gives excellent drafts in ~2 min/pick; coercing a 0x200-0x400 *branchy*
function to a byte-identical reg-alloc/instruction-schedule is the wall,
and it is a **hard** wall (each pick = a multi-hour grind with uncertain
success). Track-2 on this band is **>10× slower than the recipe drains**
(waves 1-5: 3-10 min/pick at 80-100 % yield) and currently sub-50 %
first-pass.

## The m2c pipeline — VALIDATED end-to-end

Brief 272's `/tmp/sc272` clone + `to_gas.py` converter work against the
**decomper** build (patched `DELINKS` path). Per-pick flow:

1. add a delinks `complete` block → `ninja build/eur/delinks/delink.yaml`
   extracts the orig `.o` (with `R_ARM_ABS32`/`PC24` relocs).
2. `to_gas.py <obj> <func>` → GAS `.s` (resolves pool loads to `=sym`).
3. `python3.13 m2c.py -t arm-mwcc-c -f <func> x.s` → comprehension draft.

The drafts are **genuinely good**: full control flow, struct offsets
(`unkD20`, `unk2C`…), call args, the C-39f `(arg0 & 1) * 0x868` indices,
even the bit-pack expressions. m2c solves *comprehension*; it explicitly
does not byte-match (the brief's non-goal).

## Per-pick log

### `func_ov002_021d91e0` (0x200, default tier) — ~30 min → 67 %, DEFERRED

A 2-D C-39f dispatcher (`arg0`→bit0, `arg1`→`*0x14` into the 0x868-stride
tables) + 4 helper calls with bit-packed args. **Structure byte-exact**
(control flow, indices, guards all matched). **Blocker:** mwcc's
**arg-eval order / instruction scheduling** at the 4 arg-packing call
sites — e.g. `func_ov002_021d479c((u16)((arg0?0x8000:0)|0x3c), arg1,
(u16)(s16)arg2, 0)`: orig computes the `(s16)arg2` cast *before* the
`orr` for the first arg; mwcc (from my source) schedules the `orr`
first, and casts `arg1` differently. The `func_ov002_021e30b4` pack (4
shift/mask terms) is hairier still. Coercing all 4 sites' scheduling is
the grind. **P-candidate: arg-pack instruction-scheduling.**

### `func_ov002_021b05d0` (0x28c, default tier) — ~40 min → 82 %, DEFERRED

A regular state-machine: `switch (g.d20)` with case 0 = 3 repeated
per-card-type blocks (`if (g.f2c==K||g.f894==K) { idx = (table[bit0]==K)
? bit0 : 1-bit0; func_021d479c((idx?0x8000:0)|STATE, 0,0,0); }`) +
finalizer + state++. Fixes that *helped*: the `switch` matched as an
if-chain (`cmp #0;beq; cmp #1;beq`), and **extern-struct accessors**
(`struct{char _[0xcec]; int cec; …}`) fixed the constant-offset
**fold** (`*(int*)(sym+0xd20)` folds `sym+0xd20` into one pool word; the
struct keeps base + `[#0xd20]`) — +3 %. **Remaining blocker:**
systematic **reg-alloc** (~29 instr diffs / 163) — `temp_r4` + the
per-block indexed-read temps don't land in the orig's registers across
the 3 repeated blocks. Not close. **P-candidate: repeated-block
reg-alloc.**

## Band-wide finding — uniformly complex, no flat picks

Triaged **28 of 260** band picks (delink + m2c, scored by branches +
bit-pack ops + calls). **Every** one is complex: 12-18 `if`/`switch` +
bit-packing + 10-39 calls; flattest still had 12 branches. There is **no
"easy" sub-cohort** in this band — it is all big dispatchers / handlers
/ device-init sequences. (Contrast the recipe cohorts, which had clean
template families.)

## Velocity calibration vs the recipe drains

| | recipe drains (waves 1-5) | Track-2 cold-RE (this band) |
|---|---|---|
| comprehension | pattern-match, instant | m2c, ~2 min/pick (solved) |
| byte-match | recipe + 1 gotcha, ~3-10 min | **hours**, mwcc reg-alloc/sched |
| first-pass yield | 80-100 % | **sub-50 %** (0/2 here) |
| ships/hour | ~6-20 | **<1**, often 0 |

The wall is **not** "what does the function do" — it is "reproduce
mwcc's exact register allocation + instruction scheduling on a 100-250
instruction branchy function from C source." On big functions the
degrees of freedom (temp regs, eval order, fold-vs-offset, switch
lowering) explode beyond hand-coercion.

## Recommendation for the brain

1. **The 0x200-0x400 band is a poor Track-2 target.** Too big/branchy
   for hand reg-alloc matching. If continuing cold-RE by hand, target
   **smaller** funcs (<0x100 — fewer reg-alloc DOF) or ones **without**
   multi-site bit-packing.
2. **The real tooling gap is a PERMUTER, not better comprehension.**
   m2c already gives the draft; what's missing is brute-forcing the
   reg-alloc/scheduling to byte-match. Recommend standing up
   **decomp-permuter** (randomize source-equivalent perms, compile,
   score vs orig) as the next-tool investment — it directly attacks the
   wall this wave found. m2c (draft) → permuter (byte-match) is the
   Track-2 pipeline.
3. **decomp.me** (interactive Decompile + scratch) for the human
   byte-match loop on individual hard picks.
4. Both picks here are filed as P-candidates with the exact blocking
   pattern; revisit once a permuter exists.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK (tree clean — 0 picks shipped) |
| ships | 0 / 2 attempted (calibration wave) |
| m2c pipeline | validated (2 drafts, decomper build) |
| `ruff check .` | clean |

(No `src/` or `delinks.txt` changes — this is a docs-only calibration
PR. The `/tmp/sc272` m2c harness is research-only, not committed.)

## Cross-references

- `docs/research/brief-272-track2-coldre-accelerator-pilot.md` — the m2c
  accelerator + the objdump→GAS recipe this wave drives.
- `docs/research/brief-273-c23-mmio-drainable-cohort.md` — the last
  recipe wave; "cheap-recipe veins mined out" → this Track-2 pivot.
- `docs/research/recipe-gotchas.md` — gotcha 14 (`& 1` index), the
  constant-offset fold (C-23 MMIO doc) seen again here.
