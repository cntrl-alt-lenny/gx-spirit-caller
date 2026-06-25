/* CAMPAIGN-PREP candidate for func_021aca14 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign clamp (a0==0/a0==a1 arms); flag=tst?on:off; movhi-style bounds
 *   risk:       ASM IS TRUNCATED at .L_55c (4th call only partly shown, no epilogue) so body past call 4 is reconstructed/incomplete; also _LIT0/_LIT1 symbol order. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov008_021aca14 (ov008, class C, MED) built-free.
 * UNVERIFIED + ITERATION-EXPECTED + TRUNCATED ASM. size=360 but the provided
 * .s is CUT mid-body (last visible op: str r0,[sp,#0x4] inside the 4th call
 * setup at .L_55c). The tail (remaining func_ov008_021ab484 call + epilogue)
 * is MISSING; reconstruct from the full delink before trusting this.
 *
 * func_ov008_021ab484(x,y,0,0, flag,mode,0x400,0) is a 5-stack-arg widget
 * spawner (r0=x-code, r1=0x7e=y, r2=0, r3=0; stack0=flag, stack1=mode,
 * stack2=0x400, stack3=0). data_021b2780 at +0x634 holds toggle bits; a tst
 * picks the on/off glyph (movne/moveq). data_021b2c80 at +0x5a u16 is an
 * early-out guard (less-equal 6 returns; matches ov008_core "021b2c80 u16 at
 * +90"). a0/a1 (r6/r5) feed a clamp via func_020b3870.
 * NOTE: _LIT0/_LIT1 symbol assignment INFERRED from the +90 header fact; if the
 * pool order differs, swap data_021b2780 and data_ov008_021b2c80.
 */
extern void func_ov008_021ab484(int x, int y, int r2, int r3,
                                int flag, int mode, int w, int z);
extern int  func_020b3870(int a, int b);

extern char data_ov008_021b2780[];    /* _LIT0: u32 toggle bits at +0x634 */
extern char data_ov008_021b2c80[];    /* _LIT1: u16 guard at +0x5a (= +90) */

void func_ov008_021aca14(int a0, int a1) {
    int flag;
    int v;

    /* call 1: fixed flag 0x15, mode 2, x=0x1b */
    func_ov008_021ab484(0x1b, 0x7e, 0, 0, 0x15, 2, 0x400, 0);

    /* call 2: flag = (bits & 0x10) ? 0xa : 0x9, x=0x13 */
    flag = (*(int *)(data_ov008_021b2780 + 0x634) & 0x10) ? 0xa : 0x9;
    func_ov008_021ab484(0x13, 0x7e, 0, 0, flag, 2, 0x400, 0);

    /* call 3: flag = (bits & 0x20) ? 0xc : 0xb, x=0xd3 */
    flag = (*(int *)(data_ov008_021b2780 + 0x634) & 0x20) ? 0xc : 0xb;
    func_ov008_021ab484(0xd3, 0x7e, 0, 0, flag, 2, 0x400, 0);

    /* early-out guard */
    if (*(unsigned short *)(data_ov008_021b2c80 + 0x5a) <= 6) return;

    /* clamp: base v in [0x28,0xbe] derived from a0,a1 */
    if (a0 == 0) {
        v = 0x28;
    } else if (a0 == a1) {
        v = 0xbe;
    } else {
        v = 0x28 + func_020b3870(a0 * 0x96, a1);
        if (v < 0x28) v = 0x28;
        else if (v > 0xbe) v = 0xbe;
    }

    /* call 4 (TRUNCATED in source asm): flag = (bits & 0x100) ? 0x12 : 0x11 */
    flag = (*(int *)(data_ov008_021b2780 + 0x634) & 0x100) ? 0x12 : 0x11;
    func_ov008_021ab484(v, 0x7e, 0, 0, flag, 2, 0x400, 0);
}
