[//]: # (markdownlint-disable MD013 MD041)

# Brief 405 — RE-giant swarm pilot: parallel-hypothesis fan-out is a real lane for the *understanding*-bound wall, theatre for the *codegen*-bound one

**Brief:** 405 (decomper). Method experiment: on the understanding-bound wall
tier (RE giants / detailed builders — the tier routing 403 can't touch), prep an
evidence pack per target, fan out 3 ANALYSIS-ONLY subagents each arguing a
different structural hypothesis, reconcile, compile the winner, gate on sha1.
**Deliverable = ships AND the method verdict** (cost-per-ship vs the ~5-8/wave
patient-builder baseline; is fan-out a lane or theatre?). Targets: the ov004
Thumb RE giants, with the alignment/ship-path check first.

## Headline

**1 ship (the 0x210 serializer `021dd374`, first-compile byte-exact, 3-region
`ninja sha1` OK), 1 structural-exact near-miss (the 0x158 builder `021dc664`,
143/143 instructions but reg-numbering-walled, unshippable on Thumb). The method
verdict is the real deliverable: hypothesis fan-out reliably converts a
500-byte "I can't read this" RE giant into a STRUCTURALLY-EXACT C draft — but
whether that draft SHIPS is decided by whether the function ALSO carries a
codegen (reg-alloc) wall, which fan-out does nothing for.** It is a lane for the
genuinely understanding-bound members of the tier; it is theatre for the
codegen-bound ones.

## Ship-path verification (done before any fan-out, per the brief)

Both preferred giants are 4-aligned (`021dd374` mod4=0, `021dd648` mod4=0) → both
have the `.thumb.c` ship path. **I swapped the second target**: `021dd648` is a
0xaec (2796-byte) recursive orchestrator that calls itself AND `021dd374` and ~30
distinct sinks — not shippable in half a wave, and a confounded method test
(its size, not the fan-out, would dominate). Per the brief's fallback pool I took
the named "high-cost ov004 data-shaping builder" class instead: **`021dc664`
(0x158)** — comparable-tractability, same understanding-bound class, a cleaner
second data point.

## Target 1 — `021dd374` (0x210 flag-gated record serializer): SHIPPED

A serializer that writes a record at `arg0+0x117` by `memcpy`-ing fields from 4
descriptor structs, gated by 4 flag bits, with ASCII-validation and a shared
fail path. The 3 hypotheses (struct-array vs separate-globals vs types/CFG)
**converged decisively**:

- **All three independently rejected the array reading** (H1 was *assigned* to
  argue it and falsified its own hypothesis): the 4 descriptors are reached by
  separate `ldr =sym` loads with zero index arithmetic → 4 separate externs, not
  `Desc[]`. The 0x130 struct *shape* (len@4, name@8, blocks@0x30/70/B0/F0) was
  right; the array *indexing* was wrong.
- **H3 (types) found the load-bearing detail the others missed**: the header
  `*arg0 = h->a & h->b` loads the base ONCE (CSE) → must be a struct pointer, not
  two array expressions; and `strlen` is RE-CALLED (8 `bl` total, grep-verified),
  not cached.
- **H2 (CFG) pinned the control flow**: `r5==0` is an early `return -1` (no
  cleanup); the 6 validation failures are a shared `goto fail` that calls
  `021dbe5c(r5,0,340)`; A/B validate-after-copy, C/D validate-block-first.

Reconciled draft = **byte-exact on the first compile** (dcheck 216/216, ov004
`cmp` IDENTICAL, 3-region sha1 OK).

**The pool gotcha bit exactly as warned — and lead-prep caught it, not the
agents.** m2c_feed AND m2c both mis-resolved the `021dbe5c` 3rd-arg load as
`&data_02291630`; the real pool word is the literal `0x154` (340), no
relocation. Trusting the symbol passes dcheck and fails sha1. I resolved all
four literal pool constants (279/340/307/278) from `objdump -s` + the reloc
table during evidence prep, before fanning out. **Implication for the method:
the fan-out reasons about C-level structure; it does NOT protect against the
pool-constant trap — that stays a lead-side mechanical step.**

## Target 2 — `021dc664` (0x158 builder): STRUCTURAL MATCH, codegen-walled, NO ship

A multi-stage builder: alloc a 528-byte record, fill it via the
`dc418`/`dc3b8`/`dc350` builder chain, 3 shared-cleanup error exits. The 3
hypotheses (stack-struct/buffer typing vs error-path CFG vs signature/arg-forms)
again converged, and **H_C surfaced the decisive evidence by grep**: a
*byte-matched sibling* `021dc500` (same builder family) that pins the extern
types + the `*(char**)data_02291618` handle idiom, plus the carved caller
`021dc7bc` that passes 3 args → settles the signature `int f(int a0_dead, void
*a1, int a2)`.

The reconciled draft compiled to **143/143 instructions — every sink, type, the
`{signed char f0; short f2; short f4}` stack struct, the payload at
`(char*)&f4+2`, the 4 exits, and all pool literals (1500/528/4096) correct.** It
**does not ship**: the residual is

1. an **a1 ↔ (r5+24) callee-register mirror** (orig parks `a1` in r7 and `r5+24`
   in r6; mwcc flips them), which cascades into ~6 downstream register renames;
2. a **T1-vs-T2 `adds #2` encoding** on the (4-unaligned) sp+22 payload address.

Both are pure **register-numbering / instruction-selection** — the exact wall
class briefs 401/403 established as **not reliably C-steerable**. I tried inline
vs explicit-local, declaration reorder, and the twin's separate-buffer idiom
(that one changed the frame layout, worse). On ARM this routes to a
whole-function `.s` escape; **Thumb gap objects have NO `asm_escape` route**
(brief 397 gap; brief 406 targets the fix). So a *structurally solved* function
**cannot ship** this round. Draft preserved off-tree; banked as **P-405** in
`ov004_core.h`; **un-park when brief 406's Thumb `.s` fix lands.**

## The method verdict (the deliverable)

| | Target 1 `021dd374` | Target 2 `021dc664` |
|---|---|---|
| class | understanding-bound serializer | understanding + reg-alloc residue |
| fan-out result | structural-exact, 1st compile | structural-exact, 143/143 |
| ships? | **YES** (byte-exact, 3-region) | **NO** (reg-mirror, no Thumb `.s`) |
| subagent tokens | ~152k (3 agents) | ~165k (3 agents) |
| lead prep | heavy (pool/sinks/strides) | heavy (pool/sinks/sigs) |

**Is hypothesis fan-out a lane for the builder tier? Qualified yes — for the
genuinely understanding-bound members.** Three honest observations:

1. **Fan-out reliably solves UNDERSTANDING, not CODEGEN.** On both giants the 3
   agents converged on a structurally-exact reading fast (parallel readings
   cross-check; disagreements — array-vs-separate, inline-vs-goto — were settled
   empirically by one compile). But T2 proves the ceiling: when the function
   *also* has a reg-alloc wall, fan-out gets you to 143/143 and stops, because
   the last mile isn't an understanding problem. Fan-out's value is gated by
   *which kind* of wall the giant is.

2. **The agents largely CONFIRMED + detailed the lead's reading; they did not
   out-reason it.** The heavy lifting — resolving the literal pool (the gotcha),
   the sink semantics, the struct strides — was lead evidence-prep that the
   agents consumed, not produced. Their genuine additions were *details* (H3's
   strlen-recall count and header-CSE; H_C's twin-`021dc500` grep that settled
   the signature) — valuable, but each was a thing a thorough single context
   would also find. The parallelism bought *speed and cross-checking on the
   reading*, not a capability the lead lacked.

3. **As a raw ship-RATE lane it loses to the patient baseline; as a
   de-risking/comprehension lane it can win.** ~1 ship / ~300k+ subagent tokens
   + heavy lead prep is far costlier per ship than the ~5-8/wave patient-builder
   baseline. **Recommendation: do NOT use the swarm as a volume lane.** Use it
   selectively on the few giants where the *blocker is genuinely comprehension*
   (large, multi-struct, non-obvious control flow — the `021dd374` profile), and
   where a quick triage says there's no reg-alloc wall lurking. For those, the
   first-compile-byte-exact outcome is a real win the patient approach would
   reach much more slowly. For builders with a codegen residual (`021dc664`),
   the fan-out is theatre until the Thumb `.s` escape exists — route them to
   brief 406's harness instead.

A leaner protocol that captures most of the value: **lead does the full evidence
prep + a first-draft reading, then fans out a SINGLE adversarial "falsify this
draft + find the sibling/caller" agent** rather than 3 parallel from-scratch
readings. The 3-way divergence paid off mainly as confirmation; one good
skeptic + the lead's draft would likely have reached the same place cheaper.

## Verification

| Gate | Status |
|---|:---:|
| 021dd374 dcheck (Thumb, cmp_thumb.py) | OK (216/216) |
| 021dd374 ov004 `cmp` (pool-gotcha gate) EUR/USA/JPN | IDENTICAL ×3 |
| EUR / USA / JPN `ninja sha1` | OK ×3 |
| carve-size audit (end == symbols.txt size) | OK (0x210) |
| ov004 interval-overlap scan | 0 / 134 |
| delinks sorted | OK |
| 021dc664 | P-405 near-miss (143/143, uncarved, off-tree) |

## Model note (per brief)

No classifier fallback / refusal / degradation observed across the RE-heavy
turns — both giants were reverse-engineered and the subagents reasoned about
binary structure without interruption. Worked at full capability throughout.

## Cross-references

- `docs/research/brief-403-route-w1.md` — the routing wave whose untouched
  understanding-bound tier this pilot targets; the reg-numbering wall class.
- `src/overlay004/ov004_core.h` §brief-405 — the 021dd374 recipe + P-405 park.
- `src/overlay004/func_ov004_021dc500.thumb.c` — the byte-matched sibling that
  pins 021dc664's signature + extern types.
