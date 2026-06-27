/* CAMPAIGN-PREP candidate for func_02230c18 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-shift decode; separate scaled products (sel*0x38, slot*0x14); store-order
 *   risk:       struct-guessed: the cd420/cd424/cd42c globals and the 0x38 vs 0x830 strides are inferred from disasm offsets; confirm real table bases/strides and sel source.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02230c18 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. Bitfield struct-decode chain: parity=f4.a23 vs
 * global cd424 -> sel(0/1); index parallel parity*0x38/0x830-strided tables;
 * canonical record decode A=(f4hi>>6)&0x1ff == (rec.hi8<<1)|rec.bit13; guard cf1a2.
 */
typedef unsigned short u16;

extern char data_ov002_022cd3f4[];   /* base, +0x38 selector source */
extern char data_ov002_022cd420[];   /* table A, sel-strided */
extern int  data_ov002_022cd424;     /* compare scalar          */
extern char data_ov002_022cd42c[];   /* table B, sel-strided    */
extern char data_ov002_022cf16c[];   /* record table            */
extern char data_ov002_022cf1a2[];   /* guard table             */
extern void func_ov002_021d6808(int a, int b, int c, int sp0);

int func_ov002_02230c18(char *obj) {
    u16 f4 = *(u16 *)(obj + 4);
    int sel = (*(int *)(data_ov002_022cd3f4 + 0x38) == ((f4 << 0x11) >> 0x17)) ? 1 : 0;
    int parity = *(int *)(data_ov002_022cd420 + sel * 0x38) & 1;
    int idx = *(int *)(data_ov002_022cd42c + sel * 0x38) * 0x14;
    int rec = *(int *)(data_ov002_022cf16c + parity * 0x830 + 0x30 + idx);
    int B = ((rec << 2) >> 0x18) * 2 + ((rec << 0x12) >> 0x1f);
    int A = (*(u16 *)(data_ov002_022cd424) << 0x11) >> 0x17;
    if (A == B) {
        if (*(u16 *)(data_ov002_022cf1a2 + parity * 0x830 + idx) == 0)
            func_ov002_021d6808(0, 0, 0, 1);
    }
    return 0;
}
