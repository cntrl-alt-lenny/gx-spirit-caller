/* CAMPAIGN-PREP candidate for func_021d7b44 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     address-taken bitfield struct, fields assigned in store-order; *arg1 reloaded for field2
 *   risk:       struct-guessed + store-order: the bitfield bit-positions/holder-width are inferred from bic masks (0x200/0x400/0x800/0xf000); mwcc's RMW grouping (orig batches f0_8..f10 in one str then per-field ldr/bic/orr/str) is unlikely to match field-for-field.
 *   confidence: low
 */
/* func_ov002_021d7b44 (ov002, cls D): assemble a packed u16 into an
 * address-taken stack struct (bitfield inserts -> ldr/bic/orr/str RMW), then
 * arg-pack kind 0x33 into 021d479c and post the struct word via 02244fe4.
 * *arg1 first word yields bit13 + (bits22..29<<1) twice (reloaded). The stack
 * round-trip (str;ldr) is why &s must be taken. */
#include "ov002_core.h"

extern void func_ov002_021d479c(int packed, int a, int b, int c);
extern void func_ov002_02244fe4(int a, int b);

struct Pack7 {
    unsigned short f0_8 : 9;   /* (bits22..29 of *arg1 << 1) + bit13, & 0x1ff */
    unsigned short f9   : 1;   /* arg0 & 1 */
    unsigned short f10  : 1;   /* always 0 */
    unsigned short f11  : 1;   /* (arg0 ^ ((arg2&1) ? 1 : 0)) & 1 */
    unsigned short f12  : 4;   /* always 0xf */
};

void func_ov002_021d7b44(int arg0, int arg1, int arg2) {
    struct Pack7 s;
    int w0 = *(int *)arg1;
    int field1 = ((unsigned int)(w0 << 2) >> 24) << 1;
    int packflag;
    int field2;
    *(int *)&s = 0;
    s.f0_8 = (field1 + ((unsigned int)(w0 << 18) >> 31)) & 0x1ff;
    s.f9   = arg0 & 1;
    s.f11  = (arg0 ^ (((arg2 & 1) > 0) ? 1 : 0)) & 1;
    s.f12  = 0xf;
    packflag = (arg0 != 0) ? 0x8000 : 0;
    w0 = *(int *)arg1;
    field2 = (((unsigned int)(w0 << 2) >> 24) << 1) + ((unsigned int)(w0 << 18) >> 31);
    func_ov002_021d479c((u16)(packflag | 0x33), 0xb, (u16)arg2, (u16)field2);
    func_ov002_02244fe4(0x1e, *(int *)&s);
}
