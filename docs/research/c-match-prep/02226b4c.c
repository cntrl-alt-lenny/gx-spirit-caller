/* CAMPAIGN-PREP candidate for func_02226b4c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (short) packed decode byte0/byte1; mla base+(sel&1)*STRIDE + idx*0x14; ldrh; stack-arg order
 *   risk:       reshape-able/struct-guessed: func_021d59cc gets a stacked arg (str[sp]=0) plus regs r0..r3=ret? — arg positions guessed; idx*0x14 ldrh offset inferred. Tail '.L_36c' returns the callee value (not 0).
 *   confidence: med
 */
/* func_ov002_02226b4c : bitfield extract + mla table-base + mul index, store-order (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; u16 f4; u16 f6; u16 f8; u16 fa; u16 fc; u16 fe; };

extern u8  data_ov002_022cf1a4[]; /* table base (LIT1) */
#define STRIDE 0x868              /* LIT0 */

extern short func_ov002_021b947c(u16);
extern int   func_ov002_021d59cc(int, int, int, int);
extern int   func_ov002_02226268(void *);

int func_ov002_02226b4c(struct Entity *e)
{
    if (e->fc == 2) {
        short ret = func_ov002_021b947c(e->fe);
        u32 idx  = ((u32)((u16)ret) >> 8) & 0xff;   /* byte1 */
        u32 sel  = ret & 0xff;                       /* byte0 */
        if (idx <= 4) {
            u8 *base = data_ov002_022cf1a4 + (sel & 1) * STRIDE;
            if (*(u16 *)(base + idx * 0x14) != 0) {
                /* stack arg [sp]=0 pushed first, then call */
                func_ov002_021d59cc(e->f0, 2, 0 /*,[sp]=0*/, 0);
            }
        }
        return 0;
    }
    return func_ov002_02226268(e);                   /* .L_36c tail call */
}
