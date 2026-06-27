/* CAMPAIGN-PREP candidate for func_0222d39c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl lo,hi (r4,r5) from 021b947c interleaved unpack; mla bit0*0x868 base; ptr add chain
 *   risk:       021b947c return is unpacked with interleaved lsl/lsr/asr across r1,r2,r3,r5; the exact lo/mid/hi temp decl-order drives r4/r5 allocation, easy to mis-order. permuter-class (interleaved field-extract scheduling) / struct-guessed offsets.
 *   confidence: low
 */
/* func_ov002_0222d39c: gate on 021ff3bc(); decode self->unk14 low-23 via
 * 021b947c into (lo, midkind, hi); if midkind==0xe and 021c33e4(bit0,lo,hi)
 * holds, build a cf16c-row pointer (bit0*0x868 +0x18 +0x400 + hi*4) and call
 * 0227ac64(bit0, lo, ptr, 1, 1, 0). */
typedef unsigned short u16;
struct F0222d39c_F2 { u16 bit0:1; u16 rest:15; };
struct F0222d39c_Self { u16 f0; struct F0222d39c_F2 f2; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021ff3bc(void);
extern int  func_ov002_021b947c(int rec);
extern int  func_ov002_021c33e4(int bit0, int lo, int hi);
extern void func_ov002_0227ac64(int bit0, int lo, void *ptr, int one, int one2, int zero);

int func_ov002_0222d39c(struct F0222d39c_Self *self) {
    if (func_ov002_021ff3bc() == 0)
        return 0;
    {
        int rec = func_ov002_021b947c((int)((unsigned)(*(int *)((char *)self + 0x14)) << 23 >> 23));
        int lo  = rec & 0xff;
        int mid = (int)(((u16)rec >> 8) & 0xff);
        int hi  = (int)((u16)(rec >> 16));
        if (mid == 0xe) {
            if (func_ov002_021c33e4(self->f2.bit0, lo, hi) != 0) {
                char *p = data_ov002_022cf16c + (lo & 1) * 0x868 + 0x18 + 0x400 + hi * 4;
                func_ov002_0227ac64(self->f2.bit0, lo, p, 1, 1, 0);
            }
        }
    }
    return 0;
}
