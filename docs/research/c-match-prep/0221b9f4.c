/* CAMPAIGN-PREP candidate for func_0221b9f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: globals cd3f4 drive base/idx; record +0x30 word slices; rsb 1-bit*0x38 into cd42c; store guard then dispatch
 *   risk:       struct-guessed + reshape-able: cd3f4 layout (+4 owner word, +0 ?, +0x20 idx) inferred from ldr offsets; if real struct differs the three loads renumber. Same composed +0x30 word compare ((w>>6&0xff)<<1)|(w>>13&1) reorder risk as 0221b730.
 *   confidence: low
 */
/* func_ov002_0221b9f4 (ov002, class D, MED) — UNVERIFIED build-free draft.
 * cd3f4 globals select owner(+4) and record idx(+0x20); compare record +0x30
 * word slice vs cd42c[(1-owner)*0x38]; if cf1a4 u16 guard set, dispatch.
 * 021d59cc(*(cd3f4+4), *(cd3f4+0x20), self->f0, 2, 0).
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CmdEvt { u16 f0; u16 _r2; u16 f4; };

struct G {            /* data_ov002_022cd3f4 */
    int f0;           /* +0x0  */
    int f4;           /* +0x4  owner word */
    int _pad[6];
    int f20;          /* +0x20 record idx */
};

extern struct G data_ov002_022cd3f4;
extern unsigned char data_ov002_022cf16c[];
extern int data_ov002_022cd42c[];     /* +(1-owner)*0x38 int */
extern u16 data_ov002_022cf1a4[];     /* +owner*0x868 u16    */
extern int func_ov002_021d59cc(int a, int b, int c, int d, u16 e);

int func_ov002_0221b9f4(struct CmdEvt *self)
{
    int ownerw = data_ov002_022cd3f4.f4;
    int owner  = ownerw & 1;
    int base   = owner * 0x868;
    int idx    = data_ov002_022cd3f4.f20 * 0x14;
    u32 w = *(u32 *)((char *)data_ov002_022cf16c + base + idx + 0x30);
    int rhs = (int)(((w << 2) >> 0x18) << 1) + (int)((w << 0x12) >> 0x1f);
    int lhs = data_ov002_022cd42c[(1 - owner) * 0x38 / 4];
    if (lhs != rhs)
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + base + idx) == 0)
        return 0;
    func_ov002_021d59cc(ownerw, data_ov002_022cd3f4.f20, self->f0, 2, 0);
    return 0;
}
