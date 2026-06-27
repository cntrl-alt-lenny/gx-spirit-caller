/* CAMPAIGN-PREP candidate for func_0221c538 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: 0223de94 split lo/(>>8 asr)&ff; smulbb idx*0x14; mla cf1a4 base; two stacked consts 2,0x2bc via [sp],[sp+4]
 *   risk:       reshape-able: orig uses smulbb r0,((val>>8)&0xff),#0x14 (16x16) for the index — a plain int* mul may emit mul not smulbb unless both operands are u16/int-truncated; and the [sp]=2,[sp+4]=0x2bc store order must hold. Bind ip vs reload of 0223de94 result.
 *   confidence: low
 */
/* func_ov002_0221c538 (ov002, class D, MED) — UNVERIFIED build-free draft.
 * 0223df38 gate; 0223de94 -> lo(bit0), hi((>>8 signed)&0xff); index cf1a4 by
 * hi*0x14 (smulbb); if u16 there nonzero, 021d5a08(self, lo, hi, f0, [sp]=2,
 * [sp+4]=0x2bc).
 */
typedef unsigned short u16;

struct CmdEvt { u16 f0; };

extern unsigned char data_ov002_022cf1a4[];   /* +(lo&1)*0x868 + hi*0x14 u16 */
extern int func_ov002_021d5a08(int self, int lo, int hi, int f0, int s0, int s1);
extern int func_ov002_0223de94(void *self, int k);
extern int func_ov002_0223df38(void *self, int b, int c);

int func_ov002_0221c538(struct CmdEvt *self)
{
    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;
    {
        int ip = func_ov002_0223de94(self, 0);
        int lo = ip & 0xff;
        int hi = ((int)((u16)ip) >> 8) & 0xff;
        u16 *p = (u16 *)(data_ov002_022cf1a4 + (lo & 1) * 0x868 + hi * 0x14);
        if (*p == 0)
            return 0;
        func_ov002_021d5a08(self, lo, hi, self->f0, 2, 0x2bc);
    }
    return 0;
}
