/* CAMPAIGN-PREP candidate for func_0221b730 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1/:5 f2 bitfields; mla base*0x868+kind*0x14; +0x30 word slices; if-assign global==owner
 *   risk:       reshape-able then permuter-class: the +0x30 word compare value ((w>>6&0xff)<<1)|(w>>13&1) is a composed multi-slice expr; if mwcc fuses shifts differently the ldr;lsl;lsr;add chain reorders. Secondary: holds owner in r0 across to the call.
 *   confidence: low
 */
/* func_ov002_0221b730 (ov002, class D, MED) — UNVERIFIED build-free draft.
 * struct-index validate (record +0x30 packed word == f4 slice) then one
 * pack-and-dispatch call. Bases: cf16c per-owner stride 0x868, record
 * stride 0x14 at +0x30. 021d59cc(owner, kind, f0, packed, 0).
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CmdEvt {            /* r0 */
    u16 f0;                /* +0x0  board/cell id            */
    u16 owner : 1;         /* +0x2  bit0  (lsl31;lsr31)      */
    u16 kind  : 5;         /*       bits1-5 (lsl26;lsr27)    */
    u16 _r2   : 10;
    u16 f4;                /* +0x4                           */
};

extern u32 data_ov002_022cf16c[];   /* +base+kind*0x14+0x30 packed word */
extern u16 data_ov002_022cf1a4[];   /* +base+kind*0x14 u16 guard       */
extern int data_ov002_022d016c[];   /* +0xcec int                      */
extern int func_ov002_021d59cc(int a, int b, int c, int d, u16 e);

int func_ov002_0221b730(struct CmdEvt *self)
{
    int owner = self->owner;
    int kind  = self->kind;
    int base  = owner * 0x868;
    u32 w = *(u32 *)((char *)data_ov002_022cf16c + base + kind * 0x14 + 0x30);
    int lhs = (int)((self->f4 << 0x11) >> 0x17);          /* f4 slice */
    int rhs = (int)(((w << 2) >> 0x18) << 1) + (int)((w << 0x12) >> 0x1f);
    if (lhs != rhs)
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + base + kind * 0x14) == 0)
        return 0;
    {
        int pk = (*(int *)((char *)data_ov002_022d016c + 0xcec) == owner) ? 1 : 0;
        pk = (((pk + 1) & 0xff) << 4) | 2;
        func_ov002_021d59cc(owner, kind, self->f0, (u16)pk, 0);
    }
    return 0;
}
