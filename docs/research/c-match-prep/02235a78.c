/* CAMPAIGN-PREP candidate for func_02235a78 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     col==6 guard; record base+0x868*b0+0x30+col*20; reload b0/col per call (orig re-reads [r4+2])
 *   risk:       struct-guessed/reshape-able: orig RELOADS [r4+2] before each helper (don't bind b0/col once) — bind/reload flip is the lever; coord/col field widths inferred from shift pairs.
 *   confidence: low
 */
/* func_ov002_02235a78 (ov002, class D): if packed col (offset2 bits[6:2]) == 6,
 * validate the coord against the cf16c 0x868 record then run a 3-step chain;
 * else tail func_02216424. record = base+0x868*b0+0x30+col*20 (JPN 021b8fc8). */
typedef unsigned short u16;

struct Self02235a78 {
    u16 f0;            /* +0 */
    u16 packed2;       /* +2: bit0, col5=bits[6:2], coordhdr bits[11:6] (<<0x14>>0x1a) */
    u16 packed4;       /* +4: coord bits via <<0x11>>0x17 */
};

extern char data_ov002_022cf16c[];
extern int  func_ov002_021c1a2c(int b0, int col);
extern void func_ov002_021d59cc(int a0, int a1, u16 f0, int five, int packedNeg);
extern void func_ov002_0226b11c(int b0, int col);
extern void func_ov002_02216424(void);

int func_ov002_02235a78(struct Self02235a78 *self) {
    int colHdr = (self->packed2 << 20) >> 26;   /* r3 = bits, ==6 check */
    if (colHdr != 6) { func_ov002_02216424(); return 0; }
    {
        int b0 = (self->packed2 << 31) >> 31 & 1;          /* r0 then &1 */
        int col = (unsigned int)(self->packed2 << 26) >> 27; /* ip>>0x1b = r1 */
        char *recBase = data_ov002_022cf16c + (b0 & 1) * 0x868 + 0x30;
        int w = *(int *)(recBase + col * 20);
        int qcoord = (unsigned int)(self->packed4 << 17) >> 23;
        int cellY = ((unsigned int)(w << 2) >> 24 << 1) + ((unsigned int)(w << 18) >> 31);
        if (qcoord != cellY) return 0;
        func_ov002_021d59cc(b0, col, self->f0, 5, (1 - b0) << 16 >> 16);
        b0 = (self->packed2 << 31) >> 31;
        col = (unsigned int)(self->packed2 << 26) >> 27;
        if (func_ov002_021c1a2c(b0, col) == 0) return 0;
        b0 = (self->packed2 << 31) >> 31;
        col = (unsigned int)(self->packed2 << 26) >> 27;
        func_ov002_0226b11c(b0, col);
        return 0;
    }
}
