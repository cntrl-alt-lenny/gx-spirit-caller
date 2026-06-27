/* CAMPAIGN-PREP candidate for func_02291900 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield at +0x30 (lsl;lsr); +0x40 plain shift+mask; mla index inlined; adds-of-two-bits as +
 *   risk:       The hit-path 'return 1' is a PREDICATED early-out (movle r0,#1; ldmleia) vs branch to shared ret-0 epilogue; mwcc may emit a branch instead. permuter-class. Secondary: held cf16c-base/0x868 reg across loop (reshape-able: keep index inline).
 *   confidence: low
 */
/* func_ov002_02291900 (ov002, class D, MED). Bitfield + mla scan loop.
 * for i in 0..4: flag = self->f2.bit0; if func_022575c8(self,flag,i)==0 continue;
 *   rec = cf16c + (self->f2.bit0 & 1)*0x868 + i*0x14;
 *   if (((rec[0x40]>>22)&1) + ((rec[0x40]>>23)&1)) == 0 continue;   (adds; beq)
 *   v = rec.f30 (:13 at +0x30); if func_0202b8a8(v) <= 4 return 1;
 * return 0. self->f2.bit0 re-read each access; index recomputed inline. */
typedef unsigned short u16;
typedef unsigned int   u32;
struct F2 { u16 bit0 : 1; u16 rest : 15; };
struct Self { u16 pad0; struct F2 f2; };
struct Rec { u32 f30 : 13; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_022575c8(void *self, int flag, int i);
extern int  func_0202b8a8(int v);

int func_ov002_02291900(struct Self *self) {
    int i;
    for (i = 0; i <= 4; i++) {
        u32 w;
        if (func_ov002_022575c8(self, self->f2.bit0, i) == 0)
            continue;
        w = *(u32 *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + i * 0x14 + 0x40);
        if (((w >> 22) & 1) + ((w >> 23) & 1) == 0)
            continue;
        if (func_0202b8a8(((struct Rec *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + i * 0x14 + 0x30))->f30) <= 4)
            return 1;
    }
    return 0;
}
