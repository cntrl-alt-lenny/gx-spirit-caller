/* CAMPAIGN-PREP candidate for func_0207dca8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x4c stack struct &buf passed to 3 calls; result(r4) zero-init; r4 = *(f8+0x64) + f24 between calls
 *   risk:       Struct-guessed: 0x4c frame and offsets f8(+0x8)/f24(+0x24)/inner +0x64 inferred from ldr pattern. The add r4,r2,r1 operand order (f64+f24) is reshape-able; frame size is the gate — confirm against real struct.
 *   confidence: med
 */
extern void func_02098388(void *buf);
extern int  func_02098038(void *buf, int arg);
extern void func_02097ff0(void *buf);

struct Buf_207dca8 {
    char _pad8[8];
    int *f8;     /* +0x8 -> ptr */
    char _pad24[0x24 - 0x8 - 4];
    int  f24;    /* +0x24 */
    char _tail[0x4c - 0x24 - 4];
};

int func_0207dca8(int arg)
{
    struct Buf_207dca8 buf;
    int result;

    result = 0;
    func_02098388(&buf);
    if (func_02098038(&buf, arg) != 0) {
        result = buf.f8[0x64 / 4] + buf.f24;
        func_02097ff0(&buf);
    }
    return result;
}
