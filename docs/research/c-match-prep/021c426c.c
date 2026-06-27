/* CAMPAIGN-PREP candidate for func_021c426c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit pairwise copy loop, store-order kept, stride-8 s16 records, tail field copies
 *   risk:       permuter-class: two reinterpreting copy loops (u16-pair then s16-quad over same 40B buf) — mwcc's reg-alloc/scheduling of the load/store interleave (ldrsh r1/r0 order, lr counter reuse) is a coin-flip; also struct-guessed offsets.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021c426c (ov006, class D) — brief 494.
 * UNVERIFIED build-free draft. struct-copy loops, store-order, halfword strh.
 * row = self + 0x9c + idx*0x10 (stride16). guard bit0 of row->fc; if set:
 *  loop1: copy 10 u16-pairs from data_021cb7b8 into 40-byte stack buf (strh [n]
 *         then [n+2], in that order);
 *  call func_ov005_021aa4b0(data_021b1d4c); *(int*)data_021b1d4c = 0;
 *  loop2: 5 iters, each 4 signed-halfword copies from buf[i*4..] into
 *         data_021b1d4c at +0x34/+0x36/+0x38/+0x3a (stride 8), source order;
 *  tail field copies from row.
 * recipe: store-order preserved, strh halfwords, stride-8 inner records.
 */
typedef unsigned short u16;
typedef short s16;
extern void func_ov005_021aa4b0(void *p);

struct Dst426c {
    int   f0;
    int   f4;            /* +0x4  */
    int   f8;            /* +0x8  */
    int   fc;            /* +0xc  */
    int   f10;           /* +0x10 */
    char  _14[0x20];     /* up to +0x34 */
    s16   rec[5][4];     /* +0x34, stride 8 = 5 records of 4 halfwords */
};
extern struct Dst426c data_ov000_021b1d4c;
extern u16 data_ov006_021cb7b8[20];   /* 10 pairs */

struct Row426c { int f0; int f4; int f8; int fc; };  /* stride 0x10 */

int func_ov006_021c426c(char *self, int idx) {
    struct Row426c *row = (struct Row426c *)(self + 0x9c + idx * 0x10);
    if (row->fc & 1) {
        u16 buf[20];
        u16 *src = data_ov006_021cb7b8;
        u16 *d = buf;
        int n = 10;
        do {
            u16 a = src[0];
            u16 b = src[1];
            src += 2;
            d[0] = a;
            d[1] = b;
            d += 2;
        } while (--n);
        func_ov005_021aa4b0(&data_ov000_021b1d4c);
        data_ov000_021b1d4c.f0 = 0;
        {
            s16 *sb = (s16 *)buf;
            int i;
            for (i = 0; i < 5; i++) {
                data_ov000_021b1d4c.rec[i][0] = sb[i * 4 + 0];
                data_ov000_021b1d4c.rec[i][1] = sb[i * 4 + 1];
                data_ov000_021b1d4c.rec[i][2] = sb[i * 4 + 2];
                data_ov000_021b1d4c.rec[i][3] = sb[i * 4 + 3];
            }
        }
        data_ov000_021b1d4c.f4 = row->f4;
        data_ov000_021b1d4c.f8 = row->f8 - 6;
        data_ov000_021b1d4c.fc = 6;
        data_ov000_021b1d4c.f10 = row->f0;
    }
    return 1;
}
