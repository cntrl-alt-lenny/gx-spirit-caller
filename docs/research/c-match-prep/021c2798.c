/* CAMPAIGN-PREP candidate for func_021c2798 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1 owner/:5 kind bitfields; signed-char cnt; (a&ff)|((b&ff)<<8) u16 key; mla base then -0x18 step
 *   risk:       reshape-able: orig precomputes rec base via mla r5,#0x18 then decrements r7 by 0x18 each iter (no per-iter mul) and holds key in r8 across calls; if mwcc re-multiplies the index or reloads key, the mla/sub-step and r8 hold diverge.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2798 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected.
 *   reverse loop over a count (cf288+0x484) of 0x18-byte records at cf588.
 *   key = (a&0xff) | ((b&0xff)<<8), truncated to u16. For each record (high->low):
 *   match if rec.owner(bit0 of +2) == c AND rec.kind(:5 at bit5 of +2) == d; then
 *   inner-scan rec count = (signed char) rec[+6], calling 0223de94(rec, j); if its
 *   return == key -> return 1. Exhausted -> 0.
 */
struct Rec {
    unsigned char pad0[2];
    unsigned short owner:1;
    unsigned short :4;
    unsigned short kind:5;
    unsigned short :6;
    unsigned char pad4[2];
    signed char cnt;        /* +6, compared signed (ble) */
    unsigned char pad7[0x11];
};
extern unsigned char data_ov002_022ce288[];
extern struct Rec    data_ov002_022ce588[];
extern int func_ov002_0223de94(struct Rec *rec, int j);

int func_ov002_021c2798(int a, int b, int c, int d)
{
    int n = *(int *)((char *)data_ov002_022ce288 + 0x484);
    int i;
    unsigned short key = (unsigned short)((a & 0xff) | ((b & 0xff) << 8));
    struct Rec *rec = &data_ov002_022ce588[n - 1];
    for (i = n - 1; i >= 0; i--, rec--) {
        if (c == rec->owner && d == rec->kind) {
            int j;
            for (j = 0; j < rec->cnt; j++) {
                if ((int)key == func_ov002_0223de94(rec, j))
                    return 1;
            }
        }
    }
    return 0;
}
