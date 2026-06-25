/* CAMPAIGN-PREP candidate for func_021fbec8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f2.b0/f4.field9 bitfields; reload b0 after call; mla (b0&1)*0x868+base; +0x418 splits 0x18+0x400; idx*4
 *   risk:       reshape-able: orig RELOADS [r4,#2] for bit0 after the 021b99b4 call (separate ldrh) — written as a 2nd self->f2.b0 read; if mwcc CSEs the first load instead, one ldrh diverges. f4.field9 offset/width struct-guessed.
 *   confidence: med
 */
/* func_ov002_021fbec8 (ov002, class C) — (bit0)&(f4 field9)->021b99b4=idx; then index
 * per-player 0x868 row + 0x418 sub-table + idx*4, dispatch 021d8128(bit0, ptr, 0). leaf. */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern unsigned int func_ov002_021b99b4(unsigned int bit0, unsigned int field9);
extern int  func_ov002_021d8128(unsigned int bit0, void *ptr, int z);

struct F021fbec8_F2 { u16 b0 : 1; u16 rest : 15; };
struct F021fbec8_F4 { u16 pad6 : 6; u16 field9 : 9; u16 top : 1; };
struct F021fbec8_Self {
    u16 pad0;
    struct F021fbec8_F2 f2;
    struct F021fbec8_F4 f4;
};

int func_ov002_021fbec8(struct F021fbec8_Self *self) {
    unsigned int idx = func_ov002_021b99b4(self->f2.b0, self->f4.field9);
    char *p = data_ov002_022cf16c + (self->f2.b0 & 1) * 0x868 + 0x418 + idx * 4;
    func_ov002_021d8128(self->f2.b0, p, 0);
    return 1;
}
