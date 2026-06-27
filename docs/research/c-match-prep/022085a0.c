/* CAMPAIGN-PREP candidate for func_022085a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     all bitfields; idx9*4 ushort table; &0x1fff (non-ARM-imm)=>shift-pair; reload after call
 *   risk:       idx9*4 table scale: orig fuses extract+scale into lsl#0x17;lsr#0x15 (2 insns); bitfield read + *2 likely emits 3 shifts. reshape-able (4-byte-stride table type) else permuter-class.
 *   confidence: low
 */
/* func_ov002_022085a0 (ov002, D) — many bitfield equality guards then tail call.
 * card@r5, arg1@r4.  attr=ushort@+2, w14=word@+0x14.
 *   type6=(attr>>6)&0x3f ; if(type6 != 0x16) return 0
 *   if(((w14>>9)&1) != (1-flag0)) return 0          flag0=attr bit0
 *   if(((w14>>19)&0xf) != 0xe) return 0
 *   idx9=(w14)&0x1ff ; v=data_022d0250[idx9] (ushort, byte off idx9*4) & 0x1fff
 *   if(!func_0202e234(v)) return 0
 *   reload attr,w14: if(((w14>>23)&1) != (1-flag0)) return 0
 *   return func_021ff3bc(card, arg1).
 * w14 reloaded after the call (orig re-ldr both attr and w14). idx*4 on ushort
 * table => index [idx9*2]. */
struct Obj {
    unsigned short u0;
    unsigned short flag0 : 1, : 5, type6 : 6, : 4;     /* +0x2 */
    unsigned short u4;                                  /* +0x4 */
    char pad6[0x14 - 0x6];
    unsigned idx9 : 9, f9 : 1, : 9, f19 : 4, f23 : 1, : 8; /* +0x14 */
};

extern unsigned short data_ov002_022d0250[];
extern int func_0202e234(int);
extern int func_ov002_021ff3bc(struct Obj *, void *);

int func_ov002_022085a0(struct Obj *card, void *arg1) {
    if (card->type6 != 0x16) return 0;
    if ((int)card->f9 != 1 - (int)card->flag0) return 0;
    if (card->f19 != 0xe) return 0;
    if (!func_0202e234(data_ov002_022d0250[card->idx9 * 2] & 0x1fff)) return 0;
    if ((int)card->f23 != 1 - (int)card->flag0) return 0;
    return func_ov002_021ff3bc(card, arg1);
}
