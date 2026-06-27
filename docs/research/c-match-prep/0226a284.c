/* CAMPAIGN-PREP candidate for func_0226a284 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D switch->bisection; range cmp tree; store-order tail
 *   risk:       struct-guessed: exact case constants (_LIT2.._LIT5) absent from dump, so the bisection tree values are placeholders; also which data sym is _LIT0/_LIT1 unconfirmed.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed int s32;

/* data_ov002_022cd744: int[] indexed by arg0 (ldr [r3, r0, lsl #2]) */
extern s32 data_ov002_022cd744[];
/* data_ov002_022d016c: global struct G (field +0xd44, +0xd9c) */
extern u8 data_ov002_022d016c[];
/* data_ov002_022d0e6c: MMIO-ish, u16 at +0xb0 */
extern u8 data_ov002_022d0e6c[];

extern s32 func_0202b100(s32 a);
extern void func_ov002_021ae430(s32 a, s32 b);
extern s32 func_ov002_021f4260(s32 a, s32 b);

/* NOTE: exact case constants unknown (literal pool _LIT2.._LIT5 not in dump).
   mwcc materialised one base value and derived neighbours via add/sub.
   Relative deltas observed: BASE, BASE-0x76, BASE-0x4e, BASE-0x4b,
   BASE+0xbf, BASE+0xf5, BASE+0x4a0, plus two standalone LIT3 / LIT4. */
#define CASE_BASE      0x10000 /* PLACEHOLDER: real value from _LIT2 */
#define CASE_LIT3      0x10001 /* PLACEHOLDER: _LIT3 */
#define CASE_LIT4      0x10002 /* PLACEHOLDER: _LIT4 */

s32 func_ov002_0226a284(s32 arg0, s32 arg1, s32 arg2) {
    s32 r;

    if (data_ov002_022cd744[arg0] == 1)
        return 1;

    if (*(s32 *)(data_ov002_022d016c + 0xd9c) != 0) {
        *(u16 *)(data_ov002_022d0e6c + 0xb0) =
            (u16)(*(s32 *)(data_ov002_022d016c + 0xd44));
        return 1;
    }

    switch (arg1) {
    case CASE_BASE - 0x76:
    case CASE_BASE - 0x4e:
    case CASE_BASE - 0x4b:
    case CASE_BASE:
    case CASE_BASE + 0xbf:
    case CASE_BASE + 0xf5:
    case CASE_BASE + 0x4a0:
    case CASE_LIT3:
    case CASE_LIT4:
        r = func_0202b100(arg2);
        break;
    default:
        r = func_ov002_021f4260(arg1, arg2);
        break;
    }
    func_ov002_021ae430(arg0, r);

    *(s32 *)(data_ov002_022d016c + 0xd9c) += 1;
    return 0;
}
