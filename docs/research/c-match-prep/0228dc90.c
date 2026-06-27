/* CAMPAIGN-PREP candidate for func_0228dc90 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r = [base+0x48c]-0x18; :1 and :8 field extracts; pack-unpack lo/hi; reload f6 each iter
 *   risk:       struct-guessed: Rec offsets f2@2/f6@6 and func_0223de94 return packing inferred; orig RELOADS ldrh [r4,#6] inside loop — keep f6 reload (don't hoist) or the loop-bound ldrh diverges.
 *   confidence: low
 */
// func_ov002_0228dc90 — ov002 class D: bitfield lsl/lsr loop, single call, scan
#include <stddef.h>

struct Rec {
    char pad0[2];
    unsigned short f2;   // :1 field at +2
    char pad4[2];
    unsigned short f6;   // :8 count at +6
};

extern unsigned char data_ov002_022ce288[]; // base; [+0x48c] holds list ptr
extern unsigned int func_ov002_0223de94(struct Rec *r, int i); // packed: lo byte / (>>8 hw)

int func_ov002_0228dc90(unsigned int a0, unsigned int a1)
{
    struct Rec *r = (struct Rec *)(*(char **)(data_ov002_022ce288 + 0x48c) - 0x18);
    int i;
    if (r == (struct Rec *)-0x18) return 0;            // subs r4,r0,#0x18; beq
    if ((unsigned int)((r->f2 << 0x1f) >> 0x1f) == a0) return 0; // :1 field == a0
    if ((int)((unsigned short)((r->f6 << 0x18) >> 0x18)) <= 0) return 0;
    for (i = 0; i < (int)((unsigned short)((r->f6 << 0x18) >> 0x18)); i++) {
        unsigned int p = func_ov002_0223de94(r, i);
        unsigned int hw = (p << 0x10) >> 0x10;
        if ((p & 0xff) == a0 && ((hw >> 8) & 0xff) == a1) return 1;
    }
    return 0;
}
