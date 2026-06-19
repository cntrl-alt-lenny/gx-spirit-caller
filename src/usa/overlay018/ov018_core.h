/* ov018_core.h — per-overlay vocabulary for the ov018 clean-C drain
 * (brief 336 wave 1, the fresh overlay opened after ov017 wave 2). ov018 is a
 * gauge/menu UI controller: a cell-run draw family (func_0207f934 / 0207ec28),
 * D-pad + confirm handlers over an OAM shadow block, and a screen-fade
 * countdown. Picked over ov019 / ov003 for the richest CLONE FAMILIES — the
 * cell-config draw, the bind-base OAM-flag op, and the BG-config builder each
 * recur, and the ov017/ov020 recipes transfer wholesale.
 *
 * This header is a knowledge sketch, NOT a compiled dependency — the matched
 * .c files keep their own inline externs (same convention as ov017_core.h).
 * The §VERIFIED block is byte-proven (brief 336, 12 picks, EUR objdiff 100% +
 * ninja sha1 OK).
 */
#ifndef OV018_CORE_H
#define OV018_CORE_H

/* Shared OAM control half-word at oam+0x9b4. bit0 is the per-row ready /
 * highlight latch read across the tick + input + dispatch handlers; the orig
 * extracts it with lsl#31;lsr#31, so a real 1-bit u16 bitfield (NOT `& 1`,
 * which folds to `and`) is required to reproduce the shift. bit1 / bit2 are
 * set with a plain `*(u16*)(oam+0x9b4) |= n`. */
typedef struct {
    unsigned short b0 : 1;
} OamCtl;

/* --- dominant data bases ------------------------------------------------ */
extern char data_ov018_021ad7c8[]; /* menu/OAM state block (see field map)   */
extern char data_ov018_021ad780[]; /* sound/scroll register block            */
extern char data_021040ac[];       /* global arm9 main state                 */
extern char data_02104bac[];       /* input block: +0x54/+0x56 key words     */
extern char data_ov018_021ad658[]; /* cell-archive id table [mode<<5 + n*4]  */

/* data_ov018_021ad7c8 (the menu/OAM state block) field map:
 *   +0x000 (int) kind/script id (switch discriminant: 0xc/0xe/0xf)
 *   +0x004 (int) count field (D-pad up/down target, floor 0)
 *   +0x008 (int) fade step    +0x00c (int) fade level
 *   +0x8e0 [idx<<2] glyph-handle table (idx = mode 0/1)
 *   +0x964 OAM cell region (built as +0x164 then +0x800; func_020944a4 dst)
 *   +0x966 cell-attr slot (forwarder target, ad8a8+0x66+0x900)
 *   +0x984 (int) repeat/redraw latch (zeroed on every input edge)
 *   +0x9b4 (u16) OamCtl word (bit0 ready, bit1, bit2 redraw)
 * data_ov018_021ad780: +0x50/+0x54 scroll/fade-timer, +0x8f8 attr word,
 *   +0x9cc packed fixed-point field (>>12 for the angle math).
 * data_021040ac: +0x34 mode, +0x3c confirm-state, +0xb6c step counter. */

/* ======================================================================= *
 * §VERIFIED — brief 336 wave 1 (12 picks, EUR objdiff 100% + sha1 OK)
 * ----------------------------------------------------------------------- *
 * batch 1 (6):
 *   021aa920  2-call metrics accessor (mode getter + 2 cell-config reads)
 *   021aa818  mode getter (u16 bitfield + switch on data_021040ac+0x34)
 *   021aad64  OAM redraw-flag set — bind-base, 1 guard (+0x900/+0xb4 split)
 *   021aad90  OAM redraw-flag set — bind-base, 2 input guards
 *   021aa794  BG-config builder (ov020 recipe; (u16)a1 cast forces lsl/lsr)
 *   021ab48c  MMIO scroll reset + 2 func_ov018_021aa51c cell re-seeds
 * batch 2 (6):
 *   021acda0  confirm-state tick — bind-base + OamCtl.b0 (==1) + state switch
 *   021accc8  fade countdown — func_020b3870 divmod + direct-MMIO + const-reuse
 *   021ab054  D-pad count handler — bind-base flag ops, const-reuse -1, op-order
 *   021aaa88  cell-run draw (func_0207f934) — RETURNS the drawn count
 *   021aace4  gauge cell draw (func_0207f934 sibling) — RETURNS the count
 *   021aaaf0  gauge-row dispatcher — OamCtl guard + ternary + switch; calls
 *             021aaa88 / 021aa9b8 / 021aaa3c
 *
 * §VERIFIED — brief 338 wave 2 (5 picks, EUR objdiff 100% + sha1 OK). The
 *  medium clone-sibling tier; the easy clones were drained in wave 1.
 *   021aabd8  gauge-row dispatcher sibling of 021aaaf0 + per-cell OAM mask loop
 *             + bit0 early-out (decl-order: st first -> r4)
 *   021ad118  two-loop RGB555 min-reduce + rescale over 021ace68/021acf80
 *   021aa880  2-layer label draw (mode-getter + [mode][a0] table + alloc/draw/free)
 *   021ad1f4  brighten twin of 021ad118 (min vs 0x200; clamp to 0x1ff)
 *   021ab13c  shoulder-button handler, sibling of 021ab054 (bits 0x8/0x2 -> |2/|4)
 *
 * §RECIPE INSIGHTS harvested this wave (added to docs/research):
 *  - RETURN-VALUE-NOT-VOID: a tail `*p += f() << k` where the orig keeps r0
 *    (f's return) live through ldmia means the fn RETURNS that count; a void
 *    decl lets mwcc clobber r0 with the accumulate (021aaa88/aace4 92%->100%).
 *  - OPERATION-ORDER controls allocation: writing the flag `|= n` BEFORE the
 *    sibling zero-store (mwcc still reorders the stores) makes the zero land
 *    in the reg reused for the orr result (021ab054 91%->100%).
 *  - DIRECT-ADDRESS > bound-local for an MMIO base+offset pair: a bound
 *    `int *io = 0x4000000` costs an extra callee-saved reg; inlining the two
 *    constant addresses gives the orig allocation (021accc8 78%->100%).
 *  - UN-BIND a base that's DEAD across the call-heavy middle: binding it keeps
 *    it callee-saved (extra reg); inline it so mwcc re-loads at the tail like
 *    the orig (021accc8 35%->78%).
 *  - SWITCH for out-of-line case bodies: `if(s==A||s==B){}else if(s==C){}`
 *    lays the first body inline; a `switch` with `case A: case B:` gives the
 *    orig forward-branch-to-body layout (021aaaf0 84%->100%).
 *  - [wave 2] DECLARATION-ORDER controls callee-saved register numbering: the
 *    order locals are declared steers which callee-saved reg each receives.
 *    Swapping two pointer decls fixed an r4/r5 swap (021aabd8 80->100); a
 *    three-way reorder (i, min, count) fixed a 4-register permutation
 *    (021ad118 76->100). The general form of the wave-1 reg-choice levers.
 *  - [wave 2] REGISTER-CLAMP-TEMP: clamping an address-taken variable in place
 *    (`if (v>hi) v=hi;`) emits a conditional STORE then a reload; compute into a
 *    register temp, clamp the temp, assign once (021ad1f4 85->100).
 *  - [wave 2] UNSIGNED for lsr-not-asr: `(u16)(x>>16)` on a signed int shifts
 *    with asr; make the source `unsigned` so the high-half extract is lsr
 *    (021ad118). Declare the address-taken locals FIRST to fix their stack slots.
 *
 * §DEFERRED — Mac/permuter + hard tier (reshape levers TRIED where noted; do
 *  NOT grind these on Windows). The tractable clone tier is now DRAINED:
 *   021ace14 (77%) fn-ptr step dispatcher: mwcc pools data_021040ac+0xb6c
 *     into one literal ([r,#0]); orig keeps [base,#0xb6c]. 3 source forms
 *     (RMW / char* local / read-temp-write) all pool. Codegen-choice.
 *   021aaa3c (63%) cell-attr forwarder: the +0x66 / +0x900 address adds are
 *     split & interleaved by scheduling, and the (u16) flag lands in r2 vs r0.
 *     bind-base lifted 52->63 but the rest is scheduling-class.
 *   021aa9b8 (not attempted) angle->cell tail-call: magic-multiply signed div
 *     (/60 then /17) + the same +0x66/+0x900 split. Magic-constant repro is
 *     permuter-class.
 *   021ace68 (0x118) RGB555->HSV decompose: heavy min/max-chain branching + 3x
 *     func_020b3870 divmod + 3-way hue dispatch. Reconstructable but very
 *     fiddly; near-permuter.
 *   021acf80 (0x198) HSV->RGB recombine: magic-multiply divisions (0xb60b60b7,
 *     0x80808081, 0x88888889) + 6-way sextant switch. Permuter-class.
 *   021aaddc (0x278, 153 insns) touch sprite-position builder: long repetitive
 *     block-per-case, high mismatch risk. Long-tail, not a clean win.
 *   021ab4f4 (0x1a0, 99 insns) MMIO screen/blend setup: long straight-line.
 *   021aa4a0 (0x15c) RGB555-pack to scattered MMIO: 8x unrolled, uncertain
 *     shift codegen.  021ab694 (0x1634) huge controller.
 * ======================================================================= */

#endif /* OV018_CORE_H */
