/* ov017_core.h — STARTER SKETCH of the ov017 per-overlay vocabulary
 * (brief 332 wave 1, the clean-C drain opened after ov020 wave 2; ov020's
 * tail is reserved for the Mac permuter). ov017 is a two-pane scene/menu
 * controller: a script-step dispatcher, touch hit-testing, and a text-window
 * builder family.
 *
 * GOOD overlay for clean C — call-wrapper / predicate / cell-builder
 * dominated (like ov011), NOT scheduling-walled (like ov020). The §VERIFIED
 * block is byte-proven (brief 332 wave 1, 10 picks, EUR objdiff 100% + sha1).
 */
#ifndef OV017_CORE_H
#define OV017_CORE_H

/* --- dominant data bases ------------------------------------------------ */
extern char data_ov017_021b8570[];   /* scene-A controller struct           */
extern char data_ov017_021b8894[];   /* scene-B controller struct           */
extern char data_ov017_021b8520[];   /* script state: [+0]=step idx, [+4]=t  */
extern char data_ov017_021b8020[];   /* step-handler fn-ptr table [idx<<2]   */
extern char data_ov017_021b8228[];   /* sub-scene event table                */
extern char data_ov017_021b877c[];   /* render-job handle array [0/4/8]      */

/* controller sub-state lives at controller+0x100 (a SubState struct):
 *   +0xd0 (u16) row count   +0xd8/+0xda (u16) event-flag words
 * text-window fields per pane: +0xb8/+0x114/+0x170 (group base, 3 words each)
 * + the pending-transfer guard at +0x10c/+0x168/+0x1c4; palette bytes at
 * +0x1ce (pane A) / +0x1cf (pane B).                                        */

/* --- shared sinks (already named in the tree) --------------------------
 *   func_02006110(&x,&y)/func_02006148(&x,&y)   read touch / alt-input point
 *   func_020061ac()/func_0200617c()             pen-down? (paired w/ above)
 *   func_02091554(str, font, pal)               render a text cell
 *   func_0201ef3c(handle, &dst, &flag)          flush a pending VRAM transfer
 *   func_0201ef90(&a,&b,&c, charBase, prio, 1, tbl, 1, -1, &flag)
 *                                               submit a window render job (10-arg)
 *   func_0201ede4(&out, key) -> job             register the job; store to 877c[]
 *   func_02005c60/5e20/5ca0(bg)                 BG enable/disable
 */

/* =======================================================================
 * §VERIFIED — brief 332 wave 1 (10 picks, EUR objdiff fuzzy 100% + sha1 OK).
 * Per-pick table in docs/research/brief-332-ov017-clean-c-wave1.md.
 *
 *  - scene enter/poll wrappers:  021b2c48, 021b2bdc  (call the two controllers)
 *  - touch hit-test [sibling]:   021b2ce4, 021b2d5c  (Rect{u16 x,y; u8 w,h})
 *  - box-offset forwarder:       021b4090  (stack struct + pass-through args)
 *  - scene tick + MMIO clear:    021b30d4
 *  - guarded event dispatch:     021b7330
 *  - CELL-CONFIG window builder [3 siblings]: 021b73a8 (A), 021b7490 (B),
 *    021b7578 (C, +count guard) — the func_0201ef90 10-arg recipe (ov011
 *    021cd048 lineage): pass &field-group args + the 6 stack ints/ptrs.
 *
 * RESHAPE SPOT-CHECK (per brief — ov017 reshape-ability, vs ov020=0/N):
 *  ov017 IS mostly reshape-able — control-flow / structure / signature fixes
 *  flip cleanly:
 *   - SHARED return-0 epilogue: chained `if(c) return 0;` early-fails PREDICATE
 *     inline; collapse to one `if (A && B && …) return 1; return 0;` so the
 *     `&&` short-circuits branch to a shared epilogue (021b2ce4: 58%->100%).
 *   - DROP an unnecessary local pointer: `volatile int *r=…; r[0]&=…; r[0x400]&=…`
 *     forced a reg; the inline `*(volatile int*)0x040…` derived the address and
 *     matched (021b30d4: 68%->100%).
 *   - FIX the callee signature: a handler is `f(self, tbl)` (tbl in r1, self
 *     kept in r0 from the param) — mis-declaring it `f(tbl)` mis-allocs the base
 *     AND the arg (021b7330: 80%->100%).
 *
 * §WALL (deferred — register-CHOICE rotation that resists the levers; route to
 *  Mac/permuter):
 *  - 021b2c8c script-step dispatcher: clean 3-register rotation in the post-blx
 *    idx++ block ({base,zero,idx} = orig r0,r1,r2 vs r2,r0,r1). 3 levers
 *    (inline / cached-ptr / pre-inc) = 72/68/72%. Same "load-dest reg-numbering"
 *    class ov011 deferred. (NOT a signature/layout issue — genuinely allocator.)
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 334 wave 2 (3 picks, EUR objdiff 100% + sha1 OK). The
 * easy/clean tier is DRAINED; wave 2 hit the tier transition (cf. ov015 w2).
 * Per-pick table in docs/research/brief-334-ov017-clean-c-wave2.md.
 *
 *  - cell-config sink (func_0201e964 10-arg, ov011 021cc8bc lineage): 021b3fa4
 *    (box-render sink for the matched 021b4090). func_0201e964(2, h->2c, &cfg,
 *    0, …8 stack ints); cfg = 2-int {x<<12, y<<12} local.
 *  - rect-scan loop: 021b63ec (min(arg->n,5) rows; LEVER: assign the rect
 *    consts in orig order — `int y;` declared but assigned AFTER x/w so 0x10
 *    materialises last; a y=0x10 init flips the mov order, 90%->100%).
 *  - single MMIO bitfield RMW: 021b4db0 (0x04001000 field bit-clear; two
 *    `volatile` reads reproduce the orig's read-twice; & 0x1f00 encodable).
 *
 * §TIER-TRANSITION (the rest of the ov017 gap is allocator/scheduling/fold
 *  near-misses — reshape levers TRIED, all resisted; these are permuter/Mac
 *  candidates, NOT Windows-reshapeable. Do NOT grind a wave 3 on these):
 *  - 021b33dc state-machine: switch-discriminant r0-vs-r1 (3 forms = 93%).
 *  - 021b61dc text-render: load-dest r0/r1 cascade on a 2-field address (91%).
 *  - 021b768c title-centre: orig keeps a `pos+x` add that mwcc folds (pos==0);
 *    explicit-temp did not unfold it (95%).
 *  - 021b6610 param-apply jump table: per-case base-reg reuse + const-hoist (60%).
 *  - 021b6774 job-teardown loop: switch-with-held-consts in a loop (40%).
 *  RECOMMENDATION: pivot the next clean-C wave to a fresh overlay; reserve the
 *  above + 021b2c8c for the Mac permuter.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 403 route-w1 (diagnose-and-route; 3-region sha1 OK).
 *  - 021b2280 SWAR popcount: MATCHED as C via the COMMUTATIVE-OPERAND-ORDER
 *    lever — write the HIGH-mask term FIRST in each `+`:
 *        x = ((x & 0xaaaaaaaa) >> 1) + (x & 0x55555555);  (etc.)
 *    mwcc pool-loads the constant of the FIRST-evaluated operand and
 *    derives the other via the barrel shifter in operand-2 (`and rD, rX,
 *    rM, lsr #1`); low-mask-first C made it load 0x5555… (the brief-401
 *    "mask low-vs-high derive" miss). Last step stays shift-extract:
 *    ((x << 16) >> 16) — 0xffff is not ARM-encodable, no and-reduce.
 *    One recompile; no permuter needed. SAME C ships the instruction-
 *    identical ov008 twin 021aa4a0.
 *  - 021b33dc state-machine (switch-val r0<->r1) + 021b768c title-centre
 *    (unfoldable pos+x add): shipped whole-function .s (kind:data-clean).
 * PARKED (kind:data(any) ref blocks .s; C walled):
 *  - 021b66a8 struct-init (extra r6/r7 spills + sub;cmp vs subs — reg-
 *    pressure class; refs data_ov017_021b7ed0 kind:data).
 * DEFERRED (permuter-resistant, no .s fallback — kind:data table ref):
 *  - 021b2c8c fn-ptr step dispatcher (= ov016 021b2824, instruction-
 *    identical twin): dispatch-order inversion + `volatile int *state`
 *    (pins store order: idx then zero) reduce the diff to a PURE 3-reg
 *    rotation {base,zero,idx} = orig {r0,r1,r2} vs mwcc {r2,r0,r1}.
 *    Permuter 900s/8k iters plateaued at 250 (reg-numbering class, cf.
 *    brief 358). Explicit z/t temps copy-propagate away; not C-steerable.
 * ======================================================================= */

#endif /* OV017_CORE_H */
