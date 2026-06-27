/* CAMPAIGN-PREP candidate for func_0226aff0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     raw r1 passthrough + single u16-zext (arg c=int), sel=9
 *   risk:       arg c declared int to suppress zext; if mwcc still narrows, mov r2,r1 becomes a shift pair. arg2->r3 pre-move ordering as af38.
 *   confidence: high
 */
/* func_ov002_0226af00: mixed shim, selector 9.
 *   mov r3,r2,lsl#16 ; mov r2,r1 ; mov r3,r3,lsr#16 ; mov r1,#9 ; bx ip
 * arg1 is passed THROUGH raw (plain `mov r2,r1`, no zext) into callee arg c,
 * and arg2 is u16-zext'd into arg d. So arg c must be typed int here (a u16
 * param would add an unwanted zext on arg1). func_ov002_0226ac08(arg0, 9,
 * arg1, (u16)arg2). Per-TU extern types arg c as int; the callee really
 * strh's r2, but this caller intentionally forwards the full int. */

typedef unsigned short u16;

extern void func_ov002_0226ac08(int a, int sel, int c, u16 d);

void func_ov002_0226af00(int arg0, int arg1, int arg2) {
    func_ov002_0226ac08(arg0, 9, arg1, (u16)arg2);
}
