/* CAMPAIGN-PREP candidate for func_0206c7c0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order; s16 flag |= (ldrsh/orr/strh); kind if-or; if-assign tail
 *   risk:       Orig prologue 'sub sp,#4' reserves an unused frame slot; mwcc may omit it (no spilled local), shifting the whole epilogue. reshape-able (force a spilled temp) else permuter-class.
 *   confidence: med
 */
/* func_0206c7c0 (main, class D) — store-order guard. */
typedef unsigned short u16;
typedef unsigned long  u32;
typedef signed short   s16;

extern void func_020927b8(void *hwBlock);
extern int  func_02070f78(u16 a, u16 b, u32 c);
extern int  func_02070d34(void);
extern void func_02092748(void *hwBlock);

int func_0206c7c0(void *cmd)
{
    char *p   = (char *)cmd;
    char *dev = *(char **)(p + 0x4);
    int   r5  = 0;
    char *hw  = *(char **)(dev + 0x64);
    signed char kind;

    func_020927b8(hw + 0xe0);
    func_02070f78(*(u16 *)(p + 0x10), *(u16 *)(p + 0x12), *(u32 *)(p + 0x14));
    *(u32 *)(hw + 0xf8) = (u32)r5;

    kind = *(signed char *)(p + 0xc);
    if (kind == 0 || kind == 4) {
        r5 = func_02070d34();
    }
    func_02092748(hw + 0xe0);

    if (r5 != 0) {
        *(s16 *)(dev + 0x70) |= 0x40;
        return -0x4c;
    }
    *(s16 *)(dev + 0x70) |= 0x4;
    return 0;
}
