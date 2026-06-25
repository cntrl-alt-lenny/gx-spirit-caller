/* CAMPAIGN-PREP candidate for func_0203ec1c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C store-order: emit args[0]=byte then args[1..3]=0 in order (str [sp],[sp+4],[sp+8],[sp+c]); reuse mov r0,#0 as both zero-store and e254(0) arg
 *   risk:       asm reuses the r0=#0 (set for the zero stores) as the func_0203e254 argument, so only one mov r0,#0 exists. If mwcc materialises a fresh 0 for the call an extra mov appears -- reshape-able (keep args zero-init immediately before the e254(0) call so the constant is shared). r>=4 vs <4 sign: r is signed (blt).
 *   confidence: med
 */
/* func_0203ec1c - main - class C (stack struct build + store-order)
 * builds a 4-word local (word0 = base[0xd0a] byte, words1-3 = 0), calls
 * func_0203e254(0), then func_0207bfd4(&local, func_0203d524) and maps its
 * result to 0x11 / 0x2 / fallthrough. x=func_0207b5f8 in r4 gates the whole body.
 */
extern int  func_0207b5f8(void);
extern unsigned char *func_0203c900(int sel);  /* returns base; [+0xd0a] read */
extern void func_0203e254(int sel);
extern int  func_0207bfd4(void *buf, void *cb);
extern void func_0203c85c(int);
extern void func_0203d524(void);              /* _LIT0 callback */

int func_0203ec1c(void)
{
    int args[4];
    int x;
    unsigned char *base;
    int r;

    x = func_0207b5f8();
    base = func_0203c900(0x10);
    if (x != 1)
        return 1;

    args[0] = base[0xd0a];
    args[1] = 0;
    args[2] = 0;
    args[3] = 0;
    func_0203e254(0);

    r = func_0207bfd4(args, (void *)func_0203d524);
    if (r == 1 || r >= 4) {
        func_0203c85c(1);
        return 0x11;
    }
    return 2;
}
