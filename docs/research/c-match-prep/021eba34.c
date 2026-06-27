/* CAMPAIGN-PREP candidate for func_021eba34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order idx/self/player; :13 slot.id; asymmetric-shift packed-field reconstruct, no-fold
 *   risk:       Orig reads slot.id (lsl#19;lsr#19) AND the full word from same +0x30 addr; mwcc will likely reload/CSE differently and the S-first vs recon-first cmp operand order may flip. permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021eba34 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft. Currently SHIPS-AS-.s (brief-302 reg-alloc-walled
 * endgame). This is a fresh C retry for a permuter/reshape pass.
 *   recipe: decl-order idx,self,player; (player&1)*0x868 + idx*0x14 base; :13 slot.id bitfield; packed-field reconstruct via asymmetric shifts.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct CardEnt30 { u32 _pad[12]; u32 id : 13; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b8fcc(int player, int idx);

int func_ov002_021eba34(struct { u16 f0; u16 f2; u16 f4; } *self, int player, int idx)
{
    u32 word;
    u16 self4;
    int recon;
    int s;

    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }

    word = ((struct CardEnt30 *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14))->id;
    /* NB: id read as 13-bit field; reuse the same 32-bit word below by reloading
     * the full word — see risk. */
    word = *(u32 *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14 + 0x30);
    if ((word << 19) >> 19 == 0) /* placeholder: bitfield handled above */
        return 0;

    self4 = self->f4;
    recon = (((u32)(word << 2) >> 24) << 1) + ((u32)(word << 18) >> 31);
    s     = (u32)((u32)self4 << 17) >> 23;
    return s != recon ? 1 : 0;
}
