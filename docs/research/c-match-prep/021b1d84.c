/* CAMPAIGN-PREP candidate for func_021b1d84 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-in-place RMW; newid as int re-narrowed at each store; nested parity loop
 *   risk:       orig holds newid in r4 and recomputes (u16) cast (lsl#16;lsr#16) per loop-section, plus inner j-counter aliases the held 0 (ip=lr); register rotation across 4 loops is permuter-class. Also struct-guessed offsets.
 *   confidence: low
 */
/* func_ov002_021b1d84 : remap old-id -> new-id across 4 parallel tables (class C) */
/* struct-guessed: all field offsets/strides inferred from the asm. */

extern unsigned short data_ov002_022cd3f4[];
extern unsigned short data_ov002_022cf16c[];
extern unsigned short data_ov002_022d0650[];
extern unsigned short data_ov002_022d0656[];
extern void func_ov002_0229cd5c(void *p, int n);

void func_ov002_021b1d84(int id)
{
    int newid;
    int i, j;
    unsigned char *p;
    unsigned char *q;

    newid = data_ov002_022d0656[id * 4];               /* ldrh [022d0656 + id*8] */
    func_ov002_0229cd5c(&data_ov002_022d0650[id * 4], 8);

    q = (unsigned char *)data_ov002_022cd3f4;
    for (i = 0; i < 2; i++) {
        p = (unsigned char *)data_ov002_022cf16c + (i & 1) * 0x868;
        for (j = 0; j < 12; j++) {
            if (*(unsigned short *)(p + 0x3a) == id)
                *(unsigned short *)(p + 0x3a) = (unsigned short)newid;
            p += 0x14;
        }
        if (*(unsigned short *)(q + 0xce) == id)
            *(unsigned short *)(q + 0xce) = (unsigned short)newid;
        q += 0x14;
    }

    for (i = 1; i < 0x100; i++) {
        p = (unsigned char *)data_ov002_022cf16c + i * 4 + 0x1000;
        if (*(unsigned short *)(p + 0xe6) == id)
            *(unsigned short *)(p + 0xe6) = (unsigned short)newid;
    }
    for (i = 1; i < 0x100; i++) {
        p = (unsigned char *)data_ov002_022cf16c + i * 8 + 0x1400;
        if (*(unsigned short *)(p + 0xea) == id)
            *(unsigned short *)(p + 0xea) = (unsigned short)newid;
    }
}
