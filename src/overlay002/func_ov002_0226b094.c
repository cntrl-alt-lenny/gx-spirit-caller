/* CAMPAIGN-PREP candidate for func_0226b094 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single u16-zext tail-call, value->arg c, sel=0x12
 *   risk:       Very low; identical structure to shipped b204.c, only selector differs.
 *   confidence: high
 */
/* func_ov002_0226b094: single u16-zext tail-call shim, selector 0x12.
 *   mov r1,r1,lsl#16 ; mov r2,r1,lsr#16 ; mov r1,#0x12 ; mov r3,#0 ; bx ip
 * One value arg into callee arg c (r2); arg d (r3)=0. Structural twin of
 * shipped func_ov002_0226b204.c (and the existing func_ov002_0226b094.s).
 * func_ov002_0226acf8(arg0, 0x12, (u16)arg1, 0). */

typedef unsigned short u16;

extern void func_ov002_0226acf8(int a, int sel, u16 c, u16 d);

void func_ov002_0226b094(int arg0, int arg1) {
    func_ov002_0226acf8(arg0, 0x12, (u16)arg1, 0);
}
