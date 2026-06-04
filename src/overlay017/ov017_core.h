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

#endif /* OV017_CORE_H */
