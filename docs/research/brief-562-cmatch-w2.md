[//]: # (markdownlint-disable MD013)

# Brief 562 - C-match sweep, week 2 (4 families)

Branch: `claude/cmatch-w2-562`

Scope: continue the hot C-match lane from brief 560 (16/16 VRAM family).
Reference: `docs/research/campaign-analytics/cmatch-sweep-queue.md` +
prep dossiers in `docs/research/c-match-prep/<addr>.c`. Four target
families, exemplar-first then sibling-sweep.

## Outcome

| Family | Members | Result |
|---|---:|---|
| 1. Branch-table constant-return | 3 | **0/3** — near-miss, parked (24-byte diff, mwcc rematerialization coin-flip) |
| 2. Guard-chain clone | 3 | **0/3** — near-miss, parked (12-byte diff, push/pop-vs-sub/add stack-layout coin-flip) |
| 3. MMIO-extract quad | 4 | **0/4** — near-miss, parked (fixed a real C-23 wall; residual is a single register-numbering diff) |
| 4. Relative-offset table-walker | **7** | **7/7 MATCHED** — exemplar cracked, all 6 siblings zero-shot |

**7 EUR matches, 21 ships (7 × 3 regions), all sha1-verified.** All 3
regions pass `python tools/gate3.py --no-tests`.

This is an honest mixed wave: the "big" stretch target (Family 4)
fully succeeded and over-delivered relative to its "if time" framing,
while all three smaller D/MED-tier dossiers hit genuine, well-
characterized mwcc near-misses that resisted the standard reshape
levers. Each near-miss is documented below with enough detail that a
follow-up wave (or a permuter/exhaustive-search tool) can pick it up
without re-deriving the diagnosis.

## Family 4 — relative-offset table-walker (7/7 MATCHED)

### The crack

`func_02089134`'s dossier draft (confidence: high) was structurally
correct — a `Mgr*`/`Hdr*`/`RelTable*` chain with a ternary-bound
conditional pointer resolve, exactly matching the brief's own recipe
hint. It built to the right size (0x64) immediately but had 2
residual diffs, both **predicated-instruction-pair emission order**
mismatches — not register or value errors, purely which of two
mutually-exclusive conditional instructions mwcc emits first:

1. **`t = cond ? A : 0` emits `addne;moveq` (true-branch first);
   the original wants `moveq;addne` (false-branch first).** Fix:
   don't write it as a ternary — write the null case as an explicit
   `if (cond == 0) { t = 0; } else { t = A; }`. mwcc then emits the
   `if`-condition's instructions in the same false-first order as
   the source.
2. **The final `return v ? base+v : 0` needs the base pointer
   RELOADED unconditionally (no `ne` suffix) while the ADD stays
   conditional (`addne`).** A plain ternary makes mwcc materialize
   the whole `base+v` expression unconditionally (right idea, wrong
   scope — the ADD became unconditional too). Fix: hoist the reload
   into its own statement *before* an explicit if/else, so only the
   reload is unconditional and the add/zero stays inside the
   conditional branches:
   ```c
   char *h_reload = (char *)g->h;
   if (v == 0) { result = 0; } else { result = h_reload + v; }
   ```

Both fixes are variations on one theme: **a ternary's "true value
first" emission order isn't always what the original has — when a
predicated pair comes out reversed, restructure as an explicit
`if (falsy-condition) { false-case } else { true-case }` instead of
`cond ? true : false`.** This is a new, generalizable lever — added
to `docs/research/mwcc-register-reuse-recipe.md`'s catalogue via
memory (not yet in the repo doc; worth a follow-up to fold in).

After both fixes: **byte-identical**, `containment_check.py` reports
`diff: 0 byte(s) across 0 run(s)`.

### The sweep

The dossier catalogue confirmed a clean 7-clone family — the
exemplar (`rel[5]`, offset 0x1c) plus 6 siblings varying only the
`Hdr.rel[N]` index used (`rel[0]` through `rel[7]`, skipping `rel[5]`
itself and one unlisted slot): `0208938c`(rel[0]), `02089328`(rel[1]),
`020892c4`(rel[2]), `02089260`(rel[3]), `02089198`(rel[4]),
`020891fc`(rel[7]). Cloning the fixed template with only the index
swapped matched **6/6 zero-shot** — no per-sibling iteration needed.

All 7 ported to USA + JPN: 14/14 resolved at HIGH/EXACT confidence,
no manual fixups needed (unlike brief 560's VRAM family, which hit an
EUR-only-renamed-symbol port gap — this family's callees were all
still address-named, no renames to trip over).

## Family 1 — branch-table constant-return (0/3, parked)

`02047fb8`/`02048880`/`0204ab88` are a 3-member clone family: a
5-entry dense jump table (`cmp r4,#4; addls pc,pc,r4,lsl#2`) selecting
a `(sel, off)` constant pair per case, then one shared call site
`handler(sel, MSG_BASE+off)`.

Structural read fully confirmed against raw `.s` (including
correcting the campaign-prep dossier's draft, which mis-mapped case
0/1 as a shared `default:` — the real shape is `case 0: break;`
[dead, since an earlier `if(r4==0)return 0;` already handles it, but
still needed to keep the table dense at width 5] plus `case 1..4:`
each setting real values, with **no default** at all so `case 5+`
silently falls through with `sel`/`off` left uninitialized —
matching the raw disassembly's two-target `b`-to-shared-tail
structure exactly).

**The wall:** all 3 family members use the identical `(sel, off)`
constant relationship per case (`(9,~0)`, `(9,~1)`, `(6,~9)`,
`(6,~0x13)`). mwcc recognizes that `off` is algebraically
`sel - K` for a small immediate `K` (since `sel` is already loaded
into a register at that point) and materializes `off` via
`sub r2, r0, #K` instead of an independent `mvn r2, #N` immediate
load — the original does NOT perform this rematerialization.
**4 source variants tried, all produced the identical wrong
codegen:** `sel`-then-`off` (any literal form: `~N`, plain negative
decimal, full 32-bit hex), comma-expression sequencing. Reversing to
`off`-then-`sel` source order DOES force the correct `mvn`
materialization, but flips the *emission* order too (the original
wants `sel`'s `mov` first, `off`'s `mvn` second — off-first source
gives the opposite). No combination tried produces both correctly.

**Classification:** this is a pure mwcc backend constant-
rematerialization heuristic, insensitive to C-level literal syntax —
matches the "what does NOT yield to reshaping" class in
`docs/research/mwcc-register-reuse-recipe.md`. Best diff:
`02047fb8`, 24 bytes across 8 runs, CONTAINED (not avalanche).

## Family 2 — guard-chain clone (0/3, parked)

`02089df8`/`02089e70`/`02089ee8`: a 3-arg guard chain — an early
`func_02089024(p0)` check, a conditional `func_020893f0()` call, a
5-arg call (4 register + 1 stack-passed), then a conditional
follow-up call.

The campaign-prep dossier's own header comment DID call out the
right shape ("if (r4 != 0) **goto end**") but its draft C used a
direct early `return r;`, which mwcc compiles as an inline
conditional epilogue rather than the original's branch-to-shared-tail.
Restructuring as `if (r == 0) { ...rest of function... } return r;`
fixed that specific divergence and got the callee-saved REGISTER
CHOICE right too (p0/p1/p2/accumulator land in r7/r6/r5/r4 exactly
matching the original) — but introduced a NEW divergence: mwcc folded
the 5th call argument's stack slot into the push/pop register list
(`push {r3,r4,r5,r6,r7,lr}`, 6 regs, no separate `sub sp,#4`) instead
of the original's `push {r4,r5,r6,r7,lr}` (5 regs) + a genuinely
separate `sub sp,sp,#4` for the outgoing-argument slot. Both reach
the same 24-byte-aligned stack adjustment; it's a pure code-size-
minimizing scheduling choice mwcc makes when it can, that the
original doesn't take. Un-fusing the `&&` in the trailing guard
(`if (p2!=0 && r!=0)` → nested `if`s, matching the original's 2
separate `cmp+beq` pairs instead of a fused `cmp+cmpne+beq`) also had
no effect — mwcc's -O4 control-flow optimizer reconstructs the same
fused form regardless of source nesting.

**Classification:** stack-frame-layout coin-flip (push/pop-fold vs
explicit sub/add), didn't respond to the condition-fusion or
early-return restructuring levers tried. Best diff: `02089df8`,
12 bytes (3 instructions: the folded prologue/epilogue pair + the
fused `&&`), CONTAINED.

## Family 3 — MMIO-extract quad (0/4, parked, but real progress)

`0208df0c`/`0208df60`/`0208e1cc`/`0208e220`: two-MMIO-register
combine (`DISPCNT` bank field + a `REG_OFS`-style u16 register 0xa or
0x8 bytes away), each masked/shifted and summed into a VRAM page
address. Sibling of the already-matched `Vram_GetBankBaseE`/
`Vram_GetBankBaseCD` single-register recipe
(`docs/research/mmio-bit-extract.md`, brief 233/234).

**Found and fixed a real wall:** the default mwcc 2.0/sp1p5 build
recognized `DISPCNT` (0x04000000) and `REG_OFS` (0x0400000a/0x08) are
close enough to share one base register, folding what should be 2
independent address loads into 1 shared-base + 2 offset reads — 8
bytes shorter than the original (which loads each address
independently via 2 unrelated instructions). This is
**`codegen-walls.md` § C-23 "MMIO base-folding"** — a known,
documented wall whose fix is `.legacy.c` routing (mwcc 1.2/sp2p3
lacks this specific peephole). Routing through `.legacy.c` restored
the exact byte size (0x34) and got 7 of 12 instructions byte-
identical, including the literal-pool load order.

**Residual:** the two MMIO-derived values still land in the *opposite*
registers from the original throughout (original: hi-chain in r0,
lo-chain in r1; mine: reversed) — purely a register-NUMBERING
difference, not a structural one; the instruction *sequence*/mnemonics
match almost perfectly once a `unsigned short lo_raw = REG_OFS;` value
temp is introduced to hint load order (this got the load/store
*sequence* byte-identical for 2 of 3 differing spots, leaving only
one `ldrh r2,[r1]` vs `ldrh r1,[r1]`-style register-number mismatch).
5 variants tried (plain nested expr, reordered nested expr, `hi` as
temp, `lo_raw` as temp, both as temps together) — the closest gets
down to a single register-numbering diff, but no variant reproduces
the original's exact numbering. Confirmed on 2 of 4 family members
(`0208df0c`, `0208df60`) that this specific residual is family-wide,
not a one-off.

**Classification:** `.legacy.c` routing is a confirmed, reusable fix
for this family (worth applying to any future MMIO-base-fold near-
miss); the register-numbering residual likely needs either a
permuter/exhaustive search or a deeper look at mwcc's specific
local-variable-vs-subexpression register-class assignment heuristic.
Best diff: `0208df0c` under `.legacy.c` + value-temp, 4 bytes
(1 instruction: `ldrh`'s destination register), CONTAINED.

## Lessons for the next wave

1. **The false-branch-first ternary lever (Family 4) is new and
   high-value** — add to the recipe catalogue. When a predicated
   pair (`moveq`/`addne` or similar) comes out in the wrong relative
   order from a ternary, rewrite as `if (falsy) { false-case } else
   { true-case } ` before assuming it's unreachable.
2. **Campaign-prep dossier headers can contain the right diagnosis
   in prose while the draft C gets it wrong** — Family 2's dossier
   literally said "goto end" but its own code used `return`. Read
   the prose comment, not just the code block.
3. **`docs/research/codegen-walls.md` is worth checking BEFORE
   grinding on a near-miss** — Family 3's C-23 entry would have
   saved a build cycle if consulted first instead of discovered via
   `.legacy.c` trial.
4. **Not every near-miss yields to source reshaping** — Families 1
   and 2 each got 4-5 genuinely different structural variants tried
   with no change in the specific wrong bytes, a strong signal for
   "mwcc backend heuristic, not C-source-controllable" rather than
   "haven't found the right shape yet."
5. **Per-object disassembly (extract `.text` from the freshly
   compiled `.o`, disasm with capstone, diff mnemonics against the
   extracted-ROM bytes at the same address) is dramatically faster
   than a full `ninja rom` cycle for near-miss iteration** — used
   throughout this wave instead of the `ninja objdiff`/`report`
   pipeline (which also has a known stale-cache bug from brief 560).
   Only fall back to a full ROM build once a per-object diff hits 0.

## Verification

```text
$ python tools/gate3.py --no-tests
...
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

No source changes remain from the 3 parked families — each was
`git checkout`-reverted immediately after its containment/diff check,
confirmed via `git status --short` before moving to the next family.
