/* CAMPAIGN-PREP candidate for func_0221c5cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: record +0x30 word slice == f4 slice guard; 0223de94 split lo/hi; 0225764c gate; 021d59cc(lo,hi, owner|(kind<<8),6,0)
 *   risk:       reshape-able then permuter-class: the leading +0x30 word compare ((w>>6&0xff)<<1)|(w>>13&1) vs (f4<<17>>23) is the composed-slice reorder risk; the orr r2,owner,(kind<<8) packed arg must be built shifted-or owner-first to pick the dest reg. Binds f2 via two reloads.
 *   confidence: low
 */
/* func_ov002_0221c5cc (ov002, class D, MED) — UNVERIFIED build-free draft.
 * validate record +0x30 word slice == f4 slice; gate 0223df38/0225764c;
 * 021d59cc(lo, hi, owner|(kind<<8), 6, 0). lo/hi from 0223de94 packed return.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CmdEvt {
    u16 f0;
    u16 owner : 1;        /* bit0           */
    u16 kind  : 5;        /* bits1-5        */
    u16 _r2   : 10;
    u16 f4;
};

extern unsigned char data_ov002_022cf16c[];   /* +base+kind*0x14+0x30 word */
extern int func_ov002_021d59cc(int a, int b, int c, int d, u16 e);
extern int func_ov002_0223de94(void *self, int k);
extern int func_ov002_0223df38(void *self, int b, int c);
extern int func_ov002_0225764c(void *self, int lo, int hi);

int func_ov002_0221c5cc(struct CmdEvt *self)
{
    int owner = self->owner;
    int kind  = self->kind;
    u32 w = *(u32 *)(data_ov002_022cf16c + owner * 0x868 + kind * 0x14 + 0x30);
    int lhs = (int)((self->f4 << 0x11) >> 0x17);
    int rhs = (int)(((w << 2) >> 0x18) << 1) + (int)((w << 0x12) >> 0x1f);
    if (lhs != rhs)
        return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;
    {
        int ip = func_ov002_0223de94(self, 0);
        int lo = ip & 0xff;
        int hi = ((int)((u16)ip) >> 8) & 0xff;
        if (func_ov002_0225764c(self, lo, hi) == 0)
            return 0;
        {
            int pk = self->owner | (self->kind << 8);
            func_ov002_021d59cc(lo, hi, (u16)pk, 6, 0);
        }
    }
    return 0;
}
