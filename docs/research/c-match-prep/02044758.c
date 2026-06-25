/* CAMPAIGN-PREP candidate for func_02044758 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     memset(0,base,0x400); strb-0xff loop base[(i<<8)+0xe7]; word-aligned buf[5]=0x14 frame; advance base in 2nd loop
 *   risk:       reshape-able: in loop1 asm advances i (add r2,#1) BEFORE the strb using old i, and holds 0xff in a reg — natural; main risk is the 0x14 stack-buf frame size if mwcc pads buf differently.
 *   confidence: med
 */
extern void *func_02043a78(void *a);
extern void func_02044eec(void *a);
extern void func_0209448c(int val, void *dst, int len);
extern void func_02094688(void *handle, void *buf, int len);

int func_02044758(unsigned char *base)
{
    int buf[5];
    void *h;
    int i;
    int j;

    func_0209448c(0, base, 0x400);
    for (i = 0; i < 3; i++)
        base[(i << 8) + 0xe7] = 0xff;
    func_02044eec(buf);
    h = func_02043a78(buf);
    for (j = 0; j < 2; j++) {
        func_02094688(h, base + 0xf0, 0xe);
        base += 0x100;
    }
    return 0;
}
