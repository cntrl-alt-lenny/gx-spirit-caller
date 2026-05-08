# sp3-routing-decision

**Asked:** brief 042 (PR #334) verified that mwcc 1.2/sp3 emits a
prologue/epilogue combination — `push {regs, lr}; sub sp, sp, #4
... pop {regs, pc}` — that **neither of the project's two current
routing tiers** (default mwcc 2.0/sp1p5; `*.legacy.c` →
mwcc 1.2/sp2p3) produces. W-B (`func_020467f4`) byte-matched via
sp3. Question: how many *more* unmatched candidates would also
reproduce sp3-byte-identically? Decide whether to ship a third
routing tier (e.g. `*.legacy_sp3.c`), accept .s-file workarounds
for a handful of one-offs, or shelve the entire sp3 thread.

**Short answer:** **7 sp3-unique candidates** in medium+easy tiers
(5 medium + 2 easy) — borderline per the brief's 5–9 range.
**416 sp3-unique candidates** in hard tier (out-of-scope today,
but real future leverage). **Recommendation: ship the routing
tier.** The borderline 7 plus the brief 038–documented
.s-file-on-data-reference pool layout regression argue for the
routing tier over the brief's default ".s files only"
prescription. Same complexity as the brief 037 + 039 chain.
Implementation brief sketch at the bottom of this doc.

## Method

mwcc 1.2/sp3 differs from sp1p5 and sp2p3 specifically in the
prologue/epilogue *combination* — per brief 042's per-compiler
sweep on a known-source W-B reproduction:

| Compiler          | Push prologue                  | Stack-align  | Epilogue               |
|-------------------|--------------------------------|--------------|------------------------|
| mwcc 2.0/sp1p5    | r3-spill (`push {r3, ..., lr}`) when reg-count odd | none | `pop {regs, pc}` (Style B) |
| mwcc 1.2/sp2p3    | no r3-spill                    | `sub sp, #4` | `pop {regs, lr}; bx lr` (Style A) |
| **mwcc 1.2/sp3**  | **no r3-spill**                | **`sub sp, #4`** | **`pop {regs, pc}`** (Style B) |

The signature uniquely produced by sp3 (and *not* by either
sp1p5 or sp2p3 with the project's flags) is therefore:

> push WITHOUT r3 + sub sp, #4 + pop into pc

A 3-callee-save reg test confirmed:

```c
int test_two(int a, int b) { return ext_int(a) + ext_int(b); }
```

| Compiler | Output                                                |
|----------|-------------------------------------------------------|
| sp1p5    | `push {r3, r4, r5, lr}` ... `pop {r3, r4, r5, pc}`    |
| sp2p3    | `push {r4, r5, lr}; sub sp, #4` ... `pop {r4, r5, lr}; bx lr` |
| sp3      | `push {r4, r5, lr}; sub sp, #4` ... `pop {r4, r5, pc}`|

The sp3-vs-sp1p5 discriminator at this 2-callee-save shape is
the **r3 in the push** (sp1p5 spills r3 instead of using
`sub sp, #4`).

### Sweep procedure

1. Re-ran `./dsd dis --config-path config/eur/arm9/config.yaml
   --asm-path /tmp/wabcd-asm --ual` to capture the current
   unmatched-gap-function asm.
2. Parsed every `arm_func_start ... arm_func_end` block in
   `_dsd_gap@*.s` files (412 files; 8500+ unmatched ARM
   functions).
3. For each function: regex-extracted the push register list,
   the presence of `sub sp, sp, #0x4`, the presence of
   `pop {..., pc}`, and the presence of `pop {..., lr}` + `bx
   lr` (Style A 2-step).
4. Cross-referenced the per-function tier from
   `build/eur/analysis/next_targets.json` (`tools/next_targets.py`
   output) so the sp3-unique count could be split by tier.

This is a static-pattern detection, not a compile-and-compare —
it only confirms target ROM has the sp3-unique prologue/epilogue
shape. The function body bytes still need a matching C source
to byte-match end-to-end. (Brief 042 already verified the body
match for W-B.) The count is therefore an **upper bound** on
candidates that *could* unblock under sp3 routing, not a
guarantee that all 7 will.

## Counts

```

Population per category (across 8542 unmatched ARM gap functions):
  sp3-unique          :  423
  sp2p3-unique (Style A): 881
  sp1p5-unique (r3-spill): 3085
  sp1p5-or-sp3 ambig  : 2915  (push without r3 AND no sub-sp + pop {pc})
  other               : 1160  (no push, weird epilogue, etc.)

```

Per-tier breakdown of the 423 sp3-unique:

```

  trivial   :    0
  easy      :    2
  sinit     :    0
  named     :    0
  medium    :    5
  hard      :  416
  unknown   :    0
  TOTAL     :  423

medium + easy (the brief's verdict scope): 7

```

### Medium-tier sp3-unique candidates (5)

| Module | Address     | Symbol            | Insns | Push                  |
|--------|-------------|-------------------|------:|-----------------------|
| main   | 0x0203cff8  | `func_0203cff8`   |    32 | `{r4, r5, lr}`        |
| main   | 0x0203d078  | `func_0203d078`   |    26 | `{lr}`                |
| main   | 0x020467f4  | `func_020467f4`   |    13 | `{lr}`  ← W-B (already verified byte-identical via sp3 in brief 042) |
| main   | 0x0207db8c  | `func_0207db8c`   |    28 | `{r4, r5, lr}`        |
| main   | 0x0208205c  | `func_0208205c`   |    21 | `{r4, r5, lr}`        |

### Easy-tier sp3-unique candidates (2)

| Module | Address     | Symbol            | Insns | Push  |
|--------|-------------|-------------------|------:|-------|
| main   | 0x0204548c  | `func_0204548c`   |     8 | `{lr}`|
| main   | 0x020454ac  | `func_020454ac`   |     8 | `{lr}`|

## Brief 041 provisional wall (`func_0201904c`) — sp3 doesn't fix it

Brief 041 (PR #335) flagged `func_0201904c` as a provisional new
wall: "clamped 16-bit add … the predicated 3-way `orrhi/movls/orrls`
shape is a distinct mwcc idiom the obvious `if (sum > 0xffff)` C
source doesn't trigger." The brief asked me to test sp3 against
this target as part of the sweep.

`func_0201904c`'s prologue/epilogue:

- Push: `push {r4, lr}` (2 regs, no r3, no sub-sp).
- Pop: `pop {r4, pc}` (Style B 1-step).

That's the **sp1p5-or-sp3 ambiguous** category — the 2-reg push
shape doesn't differ between sp1p5 and sp3. So sp3 routing
wouldn't change the prologue/epilogue choice on this target.

Compiled the C reproduction through all three compilers anyway:

```text

target            : 14 insn body, predicated 3-way (orrhi/lslls/orrls)
                    + single str + barrel-shifter add
                    (`add r3, r4, r3, lsr #0x10`)
mwcc 2.0/sp1p5    : 13 insn body, 2-way predicated stores, no pool
                    (uses `mov r2, #0x10000; rsb r2, r2, #0` to
                     materialise 0xffff0000 instead of pool word)
mwcc 1.2/sp2p3    : 14 insn body, 2-way predicated stores + 1 pool
                    word + Style A epilogue
mwcc 1.2/sp3      : 14 insn body, 2-way predicated stores + 1 pool
                    word + Style B epilogue (otherwise same as sp2p3)

```

**None match.** The target's `orrhi/lslls/orrls` 3-way predicate +
unconditional store combine shape doesn't fall out of any
straightforward C source through any of the three compilers. The
issue is in the *body* (predicate-merge vs predicate-store), not
the prologue/epilogue. sp3 routing doesn't unblock this target.

`func_0201904c` is **not** a sp3 candidate — it would remain a C-
source variation problem (separate from the sp3 routing
question) under all three compilers.

## Verdict

**7 medium+easy candidates** — falls in the brief's **5–9
borderline range**. Per the brief's default thresholds:

> 5–9 candidates — borderline. Recommend `.s` files for these
> specific targets instead of a third routing tier.

**Cloud's cross-cutting recommendation: override the default;
ship the routing tier.** Three reasons:

### 1. `.s` files are not a clean fallback for the 7 candidates

Brief 038's PR body documented that the `.s`-file escape hatch
**globally regresses byte-identity** when `=data_label`
pseudo-ops are used in non-trivial functions:

> the mwasmarm-emitted literal-pool placement differed from
> mwccarm's, which broke byte-identity across every module in
> the rebuild (24/27 baseline → 0/27).

5 of the 7 sp3-unique candidates have **clear data references**
in the disassembly (the brief-040-verified W-B is two
`Fill32(0, &data, N)` calls; the others have similar
data-pointer-load + bl shapes). Routing those through `.s` would
hit the brief-038 regression unless the decomper hand-rolls the
literal pools — which is significantly more work per target than
just routing through a compiler that emits the right output.
The 2 easy-tier candidates are 8-insn tiny functions where `.s`
might work, but that's only 2 of the 7.

### 2. Implementation cost is low — same shape as briefs 037 + 039

Adding the third routing tier mirrors the existing pattern:

- Add `LEGACY_SP3_MWCC_VERSION = "1.2/sp3"` constant in
  `tools/configure.py` next to `LEGACY_MWCC_VERSION`.
- Add `LEGACY_SP3_C_SUFFIX = ".legacy_sp3.c"` (or chosen) +
  `is_legacy_sp3_c()` predicate next to `is_legacy_c()`.
- Add `LEGACY_SP3_CC` path constant pointing at
  `tools/mwccarm/1.2/sp3/mwccarm.exe` (already in the
  `mwccarm latest` bundle — verified during brief 042).
- Add `mwcc_legacy_sp3` ninja rule mirroring `mwcc_legacy`.
- Extend `add_mwcc_builds()` with a third routing branch.
- Add `LEGACY_SP3_CC` to the `download_tool` rule's outputs
  list.
- Patch `tools/patch_objects_legacy.py` to also rewrite
  `.legacy_sp3.c` → `.legacy_sp3.o` entries (the same dsd lcf
  drop-the-suffix bug brief 039 fixed for `.legacy.c`; same
  one-line pattern extension).
- Tests: `tests/test_configure_asm.py` adds a
  `TestIsLegacySp3C` class mirroring `TestIsLegacyC`;
  `tests/test_patch_objects_legacy.py` adds
  `LEGACY_SP3_C_SUFFIX` regression-pin and a sp3 rewrite case.
- Docs: `CLAUDE.md` toolchain table gains a row for mwccarm
  (legacy_sp3); `docs/research/style-a-epilogue.md` cross-
  references the third tier; this file moves to "shipped" in
  state.md.

Lift estimate: **~1 day of cloud work**, including local smoke
test of the existing W-B reproduction byte-matching after
routing. Same complexity as brief 037 (which shipped in
PR #327) + brief 039 (which shipped in PR #330).

### 3. Future hard-tier upside (416 candidates)

Hard tier is out-of-scope for today's brief but the project's
roadmap eventually covers it (8290 unmatched). 416 of those
have the sp3-unique signature — meaning a future hard-tier
pivot will hit the same "neither sp1p5 nor sp2p3 emits this"
wall on those 416 functions. The routing tier is a one-time
investment that pays back across the medium+easy 7 *and* any
future hard-tier work. The .s-file alternative would mean 7
.s files + 416 future .s files (or 416 future routing-tier
implementations under deadline).

The hard-tier 416 isn't load-bearing for *this* decision (the
brief's threshold uses medium+easy), but it's a real
"shouldn't-be-ignored" multiplier on the long-term ROI.

## What this doesn't unblock

Three categories the sp3 routing tier doesn't help with:

- **W-C `func_02023fec`** — Style B half is sp1p5-or-sp3
  ambiguous (2-reg push); the wall is the pool-not-deduped
  pattern (P-7 in `codegen-walls.md`). sp3 routing doesn't
  fix it.
- **W-D `func_ov000_021ac85c`** — Style B with sp1p5-or-sp3
  ambiguous prologue; the wall is bit-chain reg-alloc (P-8).
  sp3 doesn't change reg-alloc.
- **`func_0201904c`** (brief 041's provisional wall) — body
  shape mismatch (predicate-merge vs predicate-store) under
  all three compilers. Separate C-source coercion problem.

These remain in their respective `codegen-walls.md` buckets
(P-7 / P-8 / no-bucket-yet) regardless of the sp3 routing
decision.

## Implementation brief sketch (for brain to copy into brief 045)

If brain accepts the recommendation:

```text

### cloud/sp3-routing-impl

**Goal:** Implement per-TU routing through mwcc 1.2/sp3 — the
third compiler tier — so the 7 medium+easy sp3-unique
candidates from brief 044 unblock. Same shape as brief 037
(routing infrastructure) + brief 039 (objects.txt patch).

**Scope:**

1. tools/configure.py: add LEGACY_SP3_MWCC_VERSION + LEGACY_SP3_CC
   constants, mwcc_legacy_sp3 ninja rule, is_legacy_sp3_c() helper,
   LEGACY_SP3_C_SUFFIX = ".legacy_sp3.c". Update download_tool
   outputs.
2. tools/patch_objects_legacy.py: extend the suffix list to
   include LEGACY_SP3_C_SUFFIX; same rewrite logic.
3. tests/test_configure_asm.py: TestIsLegacySp3C + LEGACY_SP3
   constant pin (mirrors TestIsLegacyC).
4. tests/test_patch_objects_legacy.py: extend mixed-route case
   + add a sp3-only test.
5. CLAUDE.md: toolchain table row for mwccarm (legacy_sp3) 1.2/sp3.
6. docs/research/style-a-epilogue.md: cross-reference the third
   tier in the recommendation section.

**Smoke test (brain runs before merge — same as brief 039):**

  echo 'extern void Fill32(int,void*,int); extern char d1[]; extern char d2[]; void func_020467f4(void) { Fill32(0,d1,0x80); Fill32(0,d2,0x100); }' \
    > src/main/func_020467f4.legacy_sp3.c
  cat >> config/eur/arm9/delinks.txt <<EOF
  src/main/func_020467f4.legacy_sp3.c:
      complete
      .text start:0x020467f4 end:0x02046828
  EOF
  python tools/configure.py eur && ninja rom

  Expected: ninja rom exit 0; mwldarm finds func_020467f4.legacy_sp3.o;
  arm9.lcf and objects.txt agree on the .legacy_sp3.o name; 24/27
  baseline preserved (modulo the stub size shift caveat from brief
  039).

**Branch:** cloud/sp3-routing-impl

**Priority:** Medium. Decomper not blocked, but unblocks 7
medium+easy targets + future-proofs hard-tier work.

```

## Sources

- Brief 042 PR (#334) — the original sp3-byte-identical W-B
  finding.
- Brief 040 PR (#332) — the W-B / W-C / W-D drops that
  motivated brief 042.
- Brief 041 PR (#335) — `func_0201904c` provisional wall;
  tested in this brief, found unrelated to sp3 routing.
- Brief 037 PR (#327) — first routing tier implementation
  (template for the proposed brief 045).
- Brief 039 PR (#330) — `tools/patch_objects_legacy.py`
  template for the dsd-lcf workaround the third tier
  also needs.
- `docs/research/codegen-walls.md` — bucketed wall reference;
  W-A through W-D + P-7 / P-8 / T-3 entries already exist
  from brief 042.
