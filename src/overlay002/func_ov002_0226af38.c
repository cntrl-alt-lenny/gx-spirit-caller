/* CAMPAIGN-PREP candidate for func_0226af38 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-zext tail-call shim (TAIL CALL + (u16) cast), sel=3
 *   risk:       Two-store reg order forced by pressure; if mwcc keeps arg2 in r2 instead of pre-moving to r3 the shift pair could swap.
 *   confidence: high
 */
/* func_ov002_0226af38: u16-zext two-arg tail-call shim, selector 3.
 *   mov r3,r2,lsl#16 ; mov r1,r1,lsl#16 ; mov r2,r1,lsr#16
 *   mov r3,r3,lsr#16 ; mov r1,#3 ; bx ip  (-> func_ov002_0226acf8)
 * Callee sig is ground-truth from func_ov002_0226acf8.s:
 *   str r0,[+0xd94]; str r1,[+0xd98]; strh r2,[+0xa0]; strh r3,[+0xa2]
 * => (int r0, int sel, u16 a, u16 b). Halfword params MUST be u16 (not
 * short) so the caller zext is lsr, not asr (ov002_core.h brief-356 note).
 * Mirrors shipped func_ov002_0226b274.c / b0f0.c. */

typedef unsigned short u16;

extern void func_ov002_0226acf8(int a, int sel, u16 c, u16 d);

void func_ov002_0226af38(int arg0, int arg1, int arg2) {
    func_ov002_0226acf8(arg0, 3, (u16)arg1, (u16)arg2);
}
