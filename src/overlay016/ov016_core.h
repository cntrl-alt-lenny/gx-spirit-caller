/* ov016_core.h — STARTER SKETCH of the ov016 per-overlay vocabulary
 * (brief 324 wave 1, the clean-C pivot off the wall-dominated ov010 tail).
 * ov016 is an ARM overlay over BSS state structs (021b9xxx-021bbxxx) with
 * per-record structs passed by pointer and several main-image sinks.
 *
 * STYLE like ov010/ov004: most files `extern` the sink + data base locally and
 * write the body. cached-base is MANDATORY for every global (load the base once
 * into a local, index off it; never re-load the symbol per access). Offsets are
 * DECIMAL. m2c_feed mislabels main-image 0x0210xxxx syms with the ov016 prefix
 * — use the bare name. GATE = 3-region ninja sha1 (NOT ninja check).
 *
 * DIVMOD — func_020b3870 is the runtime signed divmod (q in r0, rem in r1).
 *   *** Do NOT use the C `/` or `%` operators *** — mwcc emits `bl _s32_div_f`,
 *   UNDEFINED in this link. It passes dcheck (bl target masked) but FAILS
 *   `ninja sha1` at LINK. Always call the helper explicitly:
 *     QUOTIENT:  extern int       func_020b3870(int a, int b);  ->  r0
 *     REMAINDER: extern long long func_020b3870(int a, int b);
 *                rem = (int)(func_020b3870(a, b) >> 32);          ->  r1 (high word)
 */
#ifndef OV016_CORE_H
#define OV016_CORE_H

/* --- dominant data bases (extern char foo[]; base+off is the address) ----- */
extern char data_ov016_021b9184[];   /* record array, stride 10               */
extern char data_ov016_021b8f80[];   /* fn-ptr dispatch table (indexed by 9740) */
extern char data_ov016_021b9740[];   /* record array, stride 84 (+140 field)  */
extern char data_ov016_021bab44[];   /* subsystem A state                     */
extern char data_ov016_021bb2c4[];   /* subsystem B state                     */
extern char data_ov016_021bb1a4[];   /* per-row built-object handles (+12 stride) */
extern char data_ov016_021b939c[];   /* number-format glyph table (OS_SPrintf) */
extern char data_ov016_021b96d8[];   /* row-group-5 cell configs (stride 24) */
extern char data_ov016_021b96f0[];
extern char data_ov016_021b9708[];
extern char data_ov016_021b9720[];

/* =======================================================================
 * §VERIFIED — brief 324 wave 1 (15 picks, EUR/USA/JPN ninja sha1 OK). Per-pick
 * table in docs/research/brief-324-ov016-clean-c-wave1.md.
 *
 * Families:
 *  - row-group rebuild PAIR-OF-FOUR: 021b8a30/894c/8b10/8bf4 (N=0..3) — register
 *    4 cell configs (palette p+460+N), guarded-release the old built object,
 *    func_0201ef90 (10-arg) build, func_0201ede4 -> data_021bb1a4+(12+4N). Clean
 *    arithmetic progression: guard field 84+92N, builder consts per-row.
 *  - sprite-cell draw PAIR: 021b3498 (slot+28, layer 2, has unk144 guard),
 *    021b509c (slot+44, layer 1) — the 12-arg object builder func_0201e964 +
 *    coords[2]={x<<12,y<<12}; tail show/flip only when arg2==-1.
 *  - struct-pack-forward: 021b3594 (4 shorts from a src record, +stack offsets)
 *    -> func_ov016_021b3498. (Sibling 021b3560 pre-matched, brief 250.)
 *  - guarded handle-release: 021b4204 (unk56), 021b2cf4 (unk144 + DISPCNT),
 *    021b35dc (3 VRAM fills + unk144 release).
 *  - teardown/seq: 021b6324 (zero scroll regs), 021b27cc (blank BG + shutdown
 *    sequence), 021b2788 (subsystem-A teardown), 021b39e4 (page-label redraw),
 *    021b2280 (84-byte record SWAP through a temp).
 *
 * RECIPES banked (wave 1):
 *  1. MMIO double-RMW base reg: use ABSOLUTE addresses, NOT a shared `char *reg`
 *     local. `*(int*)0x04000000 &= ~7936; *(int*)0x04001000 &= ~7936;` numbers
 *     the base r1 (matching orig); a shared local forces r2 (021b27cc/2cf4).
 *  2. MI_CpuCopy is func_02094688(SRC, DST, n) — src-first. The 3-copy swap
 *     idiom (tmp<-b; b<-a; a<-tmp) confirms the arg order (021b2280).
 *  3. 12-arg object builder func_0201e964(layer, obj.unk44, &coords, 0, 0,0,
 *     cellH, cellW, 0,0,0,0); coords is a 2-int local at the TOP of the frame
 *     (mwcc reserves the 8-word outgoing-arg region below it) (021b3498/509c).
 *  4. 10-arg func_0201ef90(a, a+4, a+8, r3const, sp0const, 1, arg1, 1, -1, guard)
 *     — the -1 is `mov #1; sub #2` (reuse the prior 1) (8a30 family).
 *  5. constant-divisor `/10`/`%10` inline as smull-magic (0x66666667) and MATCH
 *     — only VARIABLE divisors need the explicit func_020b3870 (see DIVMOD).
 *  6. `+1723` auto-splits to `add #187; add #1536` (mwcc, deterministic order).
 *
 * WALLS (deferred; permuter/.s tail):
 *  - hit-test reg-swap (021b287c/28f4): the single-`&&`-return form is byte-exact
 *    EXCEPT a uniform r1<->r2 swap (rect-coord vs screen-coord); flipping the C
 *    operands inverts the branch (bgt<->blt), so unsteerable. 30/30, permuter.
 *  - fn-ptr dispatch (021b2824): inline conditional-return vs branched epilogue +
 *    reg rename. loop/dispatcher class (021b23b4/5244/5390/7694/7718/22d8-recurse).
 *  - bitfield-pack command builders (021b6074/2a8c/5188); fixed-point mul-loops
 *    (021b3a78). (021b398c + 021b5fb0 were listed here but MATCHED in wave 2.)
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 326 wave 2 / consolidate (4 picks, EUR/USA/JPN ninja sha1
 * OK). Per-pick table in docs/research/brief-326-ov016-clean-c-wave2.md.
 *
 * Picks (the remaining clean mid-tier composites):
 *  - 021b398c: list-object rebuild — the SAME 10-arg func_0201ef90 template as the
 *    8a30 family, minus the guarded-release (layer 2, depth 512). The wave-1
 *    "10-arg ambiguous" worry dissolved once the template was understood; the
 *    func_0201e7e0()/func_02093820() prelude are plain void(void) calls.
 *  - 021b5fb0: clamped 2-digit number draw. The `/10`/`%10` are CONSTANT-divisor
 *    -> inline smull-magic (0x66666667) and MATCH; mwcc recomputes `x/10` inside
 *    `x%10` exactly like orig (no problematic CSE). buf[128]+local[8] frame.
 *  - 021b7504: card stat panel — calls 60cc once + 5fb0 x3 at fixed VRAM cells
 *    (((a2*3 + 732/733/734) << 7) + 0x6600000). Two gotchas: the 0..99 clamp is
 *    UNSIGNED (`unsigned c; if (c>99)` -> movhi, not movgt); and `v=a2*3` must be
 *    placed at first-use (after the first byte load) or mwcc hoists it 1 slot.
 *  - 021b8cd8: 5th row-group-rebuild family member — u16 guard `(u16)*(p+464)`,
 *    palette arg = `(u16)*(p+464)+75` (re-read inline each call, NOT cached),
 *    data stride 24, ef90 consts 90112/2048, ede4 -> data_021bb1a4+28.
 *
 * RECIPE refinement: a CONSTANT divisor (/10, %10) inlines as smull-magic and
 * matches via the plain C operators — the _s32_div_f trap is VARIABLE-divisor
 * only. The `(u16 field) + k` palette arg re-reads (ldrh) per use; don't cache.
 *
 * WALL CLASS (endgame/permuter — do NOT force, brief 326):
 *  - reg-swap pair 021b287c/28f4 (uniform r1<->r2; flipping operands inverts the
 *    branch) and 021b6074 (a1+2/a0-13 r1<->ip, 22/22) — pure reg-alloc.
 *  - MMIO-bitfield-shuffle dispatchers 021b6f08/32f0/3174: the
 *    `*reg=(*reg&~0x1F00)|(((*reg&0x1F00)>>8 & ~N)<<8)` field-modify idiom
 *    (double-read + and/lsr/bic/orr) + literal-reuse (`sub r,#129` for -128 off a
 *    live 1) + inline-vs-outlined returns. 021b2824 fn-ptr dispatch; 021b5390
 *    value-map (inline vs branched const returns); 021b82e4 (-160 via `84-244`).
 *  - loops/recursion: 021b22d8 (recursive quicksort), 021b60cc/296c (tile-draw
 *    fixed-point loops), 021b61dc/2b2c (init + nested tile loops), 5284/5424/
 *    7fbc/7694/75c8/23b4/5244/2a8c/3a78/5188/7718/5dd0.
 *
 * THINNING: clean tier is DRAINED (4 this wave vs 15 in wave 1). ov016 should
 * PIVOT next wave; the residue is the wall class above (permuter/.s/loop endgame).
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 403 route-w1 (diagnose-and-route; 3-region sha1 OK).
 * Shipped as whole-function .s (asm_escape, byte-identical + link-proven):
 *  - 021b22d8 recursive quicksort. NOTE: asm_escape's pre-link word-compare
 *    soft-FAILS on the two recursive self-`bl`s (reloc placeholder
 *    0xebfffffe vs orig's resolved displacement) — benign; the link gate
 *    (per-overlay bin cmp / ninja sha1) proves it. Pattern for any
 *    self-calling .s escape.
 *  - 021b5390 value-map; 021b6f08 + 021b32f0 MMIO-bitfield-shuffle
 *    dispatchers (the catalogued inline-vs-outline + literal-reuse wall).
 * PARKED (kind:data(any) refs — .s would Undefined-fail the link):
 *  - 021b3174 (3rd MMIO-shuffle; refs data_ov016_021b9000/900a/9014).
 * DEFERRED (permuter-resistant, no .s fallback — kind:data table ref):
 *  - 021b2824 fn-ptr step dispatcher (twin of ov017 021b2c8c, instruction-
 *    identical): after dispatch-order inversion (`if (fn != 0) {...}
 *    return 1;` branches instead of predicating) and a `volatile` state ptr
 *    (pins idx-store-then-zero-store source order), the residue is a PURE
 *    3-reg rotation {base,zero,idx} orig {r0,r1,r2} vs mwcc {r2,r0,r1} —
 *    the reg-numbering class the permuter measurably can't anneal
 *    (900s/8k iters, score stuck 250; cf. brief 358's 02267f90 plateau).
 * ======================================================================= */

#endif /* OV016_CORE_H */
