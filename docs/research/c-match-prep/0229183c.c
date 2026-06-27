/* CAMPAIGN-PREP candidate for func_0229183c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload f2 :1 each call; row+=0x14 accumulator; parity*0x868+row base; bit22/23 &1 add
 *   risk:       reshape-able: mla r1,parity,0x868,base with add r2,r1,row (row=r6 accumulator) — keep parity*0x868 bound, row added separately; don't fold row into the mla. Loop reg-alloc could go permuter-class.
 *   confidence: low
 */
// func_ov002_0229183c — ov002 class D: bitfield lsl/lsr + mla, single guard loop
#include <stddef.h>

struct Hdr { unsigned short f0; unsigned short f2; }; // :1 field at +2

extern unsigned char data_ov002_022cf16c[]; // 2D base, parity stride 0x868
extern int func_0203058c(unsigned int key);
extern int func_ov002_021ca2b8(int parity);
extern int func_ov002_022575c8(struct Hdr *h, int parity, int sel);

int func_ov002_0229183c(struct Hdr *h)
{
    int sel;
    int row;
    if (func_ov002_021ca2b8((h->f2 << 0x1f) >> 0x1f) == 0) return 0;
    for (sel = 0, row = 0; sel <= 4; sel++, row += 0x14) {
        if (func_ov002_022575c8(h, (h->f2 << 0x1f) >> 0x1f, sel) == 0) continue;
        {
            int parity = ((h->f2 << 0x1f) >> 0x1f) & 1;
            unsigned char *e = data_ov002_022cf16c + parity * 0x868 + row;
            unsigned int w40 = *(unsigned int *)(e + 0x40);
            int b22 = (w40 >> 0x16) & 1;
            int b23 = (w40 >> 0x17) & 1;
            if (b22 + b23 == 0) continue;
            {
                unsigned int key = (*(unsigned int *)(e + 0x30) << 0x13) >> 0x13; // :13
                if (func_0203058c(key) == 0) return 1;
            }
        }
    }
    return 0;
}
