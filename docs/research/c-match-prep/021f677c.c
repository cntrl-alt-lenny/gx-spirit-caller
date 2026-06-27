/* CAMPAIGN-PREP candidate for func_021f677c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (bit0&1)*0x868 index keeps redundant and, unsigned load for blo, fc store
 *   risk:       struct-guessed: verified BYTE-EXACT at ov002 cflags (unsigned >= gives bcc==blo; &1 reproduces the and;mul; strh [r4,#12]=fc). Only cf17c stride + fc@+0xc offset to confirm.
 *   confidence: high
 */
/* func_ov002_021f677c: guarded per-player table read; if u32 >= 3 fire a helper
 * and set self->fc. cls D (bitfield + mul-index 0x868, unsigned cmp).
 *   if (*(unsigned*)(cf17c + (f2.bit0 & 1)*0x868) >= 3) {   // unsigned => blo/bcc
 *       021e1404(f2.bit0, 3, 0); self->fc = 1;
 *   }
 *   return 1;
 * (bit0 & 1) keeps orig's redundant `and r3,r0,#1`; load MUST be unsigned. */
typedef unsigned short u16;

extern char data_ov002_022cf17c[];   /* per-player count table, 0x868/player */
extern int  func_ov002_021e1404(int bit0, int a, int b);

struct F021f677c_F2 {
    u16 bit0 : 1;
    u16 rest : 15;
};
struct F021f677c {
    u16 pad0;
    struct F021f677c_F2 f2;
    u16 pad4;
    u16 pad6;
    u16 pad8;
    u16 pada;
    u16 fc;
};

int func_ov002_021f677c(struct F021f677c *self) {
    if (*(unsigned int *)(data_ov002_022cf17c + (self->f2.bit0 & 1) * 0x868) >= 3) {
        func_ov002_021e1404(self->f2.bit0, 3, 0);
        self->fc = 1;
    }
    return 1;
}
