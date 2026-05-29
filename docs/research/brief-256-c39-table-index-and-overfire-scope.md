[//]: # (markdownlint-disable MD013 MD041)

# Brief 256 — classify the C-39 table-index sub-shape + scope the over-fire cohort

**Status:** both deliverables empirically settled. Direct-mwcc only (no
ROM build, no SHA1). Every verdict is a real mwcc compile this session
vs the `dsd`-delinked orig bytes.

## Headline

- **(A) The `db973` table-index resister is COERCIBLE** — a new C-39
  sub-shape (**C-39f**), not a P-N plateau. Pilot `func_ov002_02205508`
  ships **byte-identical** with two levers: a 3-arg helper (fixes the
  reg-alloc) + an explicit `& 1` on the index (reproduces the redundant
  `and #1`). ~11 ov002 picks drainable.
- **(B) The over-fire cohort is 584 picks, all cheap, tiered by ACTUAL
  tier** (validated by 5 direct-mwcc compiles, not the over-firing
  labels): **450 default-tier natural recipe** + **132 `.legacy.c`
  routing** + 2 per-pick edges. None needs cold RE.

## (A) db973 — bit-0-indexed strided table lookup → C-39f (coercible)

Brief 255 deferred `db973` at 43.75% with a two-part divergence: a
reg-alloc miss (orig field→ip, pools→r2/r3; mine field→r2, pools→r0/r1)
**plus** a redundant `and ip,ip,#1` index mask the natural build omits.
Both halves are coercible.

Pilot `func_ov002_02205508` (0x40):

```text
push  {r3, lr}
ldrh  ip, [r0, #2]            ; field → ip
ldr   r2, 0x868              ; stride → r2
ldr   r3, base              ; base → r3
lsl ip,#31; lsr ip,#31       ; bit0 extract
and   ip, ip, #1            ; REDUNDANT (ip already 0/1) — present in orig
mul   r2, ip, r2; ldr r2, [r3, r2]   ; r2 = table[bit0] = helper arg2
cmp r2,#0; moveq r0,#0; popeq
bl    func_ov002_021ff3bc     ; helper(self, arg1, v)
pop   {r3, pc}
```

### Recipe (byte-identical, 16/16 words)

```c
struct S { unsigned short f0; unsigned short bit0:1; unsigned short rest:15; };
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff3bc(struct S *self, int arg1, int v);

int f(struct S *self, int arg1) {
    int v = *(int *)(data_ov002_022cf17c + (self->bit0 & 1) * 0x868);
    if (v == 0) return 0;
    return func_ov002_021ff3bc(self, arg1, v);
}
```

Two independent levers (filed as gotcha 14):

1. **3-arg helper `helper(self, arg1, v)`** keeps `self` (r0) and
   `arg1` (r1) live, forcing the index computation into ip + r2/r3 and
   the table value into r2 (= arg2). This is the gotcha-7 mechanism on
   a table-index temp.
2. **Explicit `& 1` on the bitfield index** reproduces the redundant
   `and ip,ip,#1`.

### Falsification (ran)

`v0` (3-arg helper, no `& 1`) → reg-alloc EXACT but the `and #1` gap
remains (1-insn diff). `v1` (3-arg helper + `& 1`) → **byte-identical**.
A 2-arg helper reverts to the brief-255 `field→r2, pools→r0/r1` miss.
Both levers are independently necessary; a single form needing neither
would disprove the recipe — none exists.

### Family transfer (~11 picks)

`db973` siblings `0220c940` / `0220e108` + relatives `8446c`
(`02206490` / `02208720`), `f030a` (`02204a68` / `0220b208`), `46a3d`
(`022958a8` / `02296f54`), `e9e9e` (`022056f0` / `0220aa64`) all share
the identical `ldrh ip; lsl;lsr; and ip,#1; mul r2,ip,r2; ldr r2,[r3,r2]`
core (confirmed on `0220c940` / `0220e108` / `02206490`). Per-pick
variation is the guard polarity (`cmp #0`/`#1`) + trailing wrappers,
covered by the catalog. Helpers are per-overlay — confirm each `.word`
/ `bl` before cloning (brief 251 caveat). Filed as **C-39f**.

## (B) Over-fire cohort — sized, tiered worklist (584 picks)

Brief 254 validated that the solo-C-23 / solo-StyleA picks the swarm
flagged as "Track-2" are detector over-fires that ship cheap. This
scopes the whole cohort and triages it by **actual tier**.

**Method.** The labels over-fire, so triage by disasm structure (which
predicts the tier), then validate by compiling. Discriminators:

- **solo-C-23**: has an MMIO pool word (`0x040xxxxx`)? → genuine C-23
  (`.legacy.c`); else no-MMIO → default tier. (A solo-C-23 has no
  Style-A epilogue, or StyleA would co-fire — so the epilogue is
  normal and routing is not needed.)
- **solo-StyleA**: saves `lr` in the prologue and ends `ldmfd {…}` +
  separate `bx{cond} lr`? → real Style-A (`.legacy.c`). No lr-save,
  frameless `bx lr`? → leaf, default tier (mwcc 2.0 emits `bx lr`
  natively for leaves).

**Counts** (every unmatched solo-C-23 + solo-StyleA, all sizes):

| Tier | Bucket | Count | Sizes | Top modules |
|---|---|---:|---|---|
| **default-tier natural** | C23-noMMIO | 236 | 5 ≤0x40 / 72 ≤0x80 / 86 ≤0x100 / 73 >0x100 | main 68, ov002 66, ov004 30 |
| **default-tier natural** | StyleA-frameless-leaf | 214 | 137 ≤0x40 / 71 ≤0x80 / 6 bigger | ov002 81, main 73, ov011 22 |
| **`.legacy.c` routing** | StyleA-real | 132 | 86 ≤0x40 / 46 ≤0x80 | main 130, itcm 2 |
| per-pick edge | StyleA-other | 2 | big (0x5ec) multi-return | ov002, ov011 |

ALL 236 solo-C-23 are **no-MMIO** — C-23 over-fires entirely on this
cohort (it fired on clustered pool refs, not MMIO base-folding).

**Tier validation (actual tier via direct mwcc — 5 compiles, 0
falsified):**

| Bucket | Pick | Tier confirmed |
|---|---|---|
| StyleA-real | `func_0208f284` (b254), `func_02094c70` (this session) | byte-identical on sp2p3; **wrong** push/pop on sp1p5 |
| StyleA-frameless-leaf | `func_02082210` (b254) | byte-identical on sp1p5 (default) |
| C23-noMMIO | `func_ov006_021b8d30`, `func_ov002_021d1be4` (b254) | byte-identical on sp1p5 (default) |

**Drain order for brief 258 (cheapest first):**

1. **StyleA-real (132)** — `.legacy.c` routing, all small; mechanical
   (write natural C, name the file `*.legacy.c`).
2. **StyleA-frameless-leaf small (~208 ≤0x80)** — default tier;
   transcribe the leaf as natural C.
3. **C23-noMMIO small (~77 ≤0x80)** — default tier, modest.
4. **C23-noMMIO medium (~159 >0x80)** — default tier but real decomp
   (median 0xb8 ≈ 46 insns); routing is *not* the blocker, but these
   are not trivial transcriptions.
5. Defer the 2 StyleA-other (big multi-return).

The genuinely-cheap front (1+2+3 ≈ **417 picks**) is several drain
waves of low-effort work; the C23-noMMIO medium tail is standard
per-pick decomp.

## What did NOT pan out

1. **brief 255's db973 P-N lean.** It is coercible — the resister
   stalled because neither the 3-arg-helper reg-alloc lever nor the
   `& 1` mask lever had been tried (they tried index *expression*
   forms, which don't touch either).
2. **The C-23/StyleA labels as tier signals.** Worthless here — 236/236
   C-23 are no-MMIO over-fires, and StyleA splits ~62%/38%
   frameless-leaf vs real. Tier must come from the epilogue/MMIO
   structure, not the label.
3. **"Cheap" ≠ "trivial" for all of it.** The 159 C23-noMMIO medium
   picks ship on the default tier (no routing) but are ~46-instruction
   functions — real decomp work, just not wall-blocked. Calling the
   whole 584 "cheap leading edge" would overstate it.

## Note for the brain — over-fire detector refinement (deferred)

The triage shows `predict_walls.py`'s StyleA + C-23 cues over-fire
badly on this cohort (StyleA on every frameless leaf; C-23 on
no-MMIO clustered-pool functions). A focused refinement — StyleA
distinguishing frameless-leaf from real Style-A by the lr-save
prologue, and C-23 requiring an actual MMIO pool word — would cut the
false-positive rate. **Not done this session** (it changes existing
detector behavior + needs careful test updates; out of scope for a
classification brief). Recommend a dedicated follow-up after brief 258
drains the cohort, so the refinement can be validated against the
drain outcomes.

## Falsification-test ledger (this session)

| Claim | Test | Result |
|---|---|---|
| db973 coercible (C-39f) | recipe vs orig bytes | byte-identical (16/16) |
| both db973 levers needed | v0 (no `& 1`) / 2-arg helper | each leaves a divergence |
| StyleA-real → `.legacy.c` | `func_02094c70` on both tiers | sp2p3 identical, sp1p5 wrong |
| over-fire tiers structural | 5 compiles across buckets | 0 falsified |

## Cross-references

- `docs/research/brief-255-c39-ov002-bit-extract-drain-wave1.md` — the
  db973 ask + the C-39 wrapper recipes.
- `docs/research/brief-254-track2-leading-edge-and-c42-resisters.md` —
  the over-fire finding this scopes.
- `docs/research/codegen-walls.md` § C-39f (new) + § C-23 / StyleA.
- `docs/research/recipe-gotchas.md` — gotcha 14 (db973 recipe).
