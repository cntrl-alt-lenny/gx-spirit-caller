/* CAMPAIGN-PREP candidate for func_02262fd0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist r7pack/r4/ebase before loop; mla idx*0x14; shift bitfield pack; reload 0xd28 per spec
 *   risk:       permuter-class: the arg pack for func_021e30b4 builds arg0 across r3/r2/r0 via orr-chain (orr r3,r7,r2; orr r0,r3,r4 lsr#0x10) with a specific reg sequence; mwcc's CSE of r7pack/mid ordering is a scheduling coin-flip. Also r2(=0) param count guessed (4th arg).
 *   confidence: low
 */
// func_ov002_02262fd0 — counted loop + heavy bitfield/mla reg-alloc pack
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
extern int func_ov002_021baca8(int a, int b, int c);
extern int func_ov002_021e30b4(int a, int b, int c, int d);

#define GD ((unsigned char *)data_ov002_022d016c)

int func_ov002_02262fd0(int a0, int a1)
{
    int idx;
    unsigned char *ebase;   /* r6 = data_cf16c + (a0&1)*0x868 + 0x30 */
    unsigned r7pack;        /* (a0<<31 & 0x80000000) | 0xa200000 */
    unsigned r4;            /* a1<<16 */

    idx = *(int *)(GD + 0xd28);
    if ((unsigned)idx >= 5)
        return 1;

    ebase  = (unsigned char *)data_ov002_022cf16c + (a0 & 1) * 0x868 + 0x30;
    r7pack = (((unsigned)a0 << 0x1f) & 0x80000000u) | 0x0a200000u;
    r4     = (unsigned)a1 << 0x10;

    for (;;) {
        if (func_ov002_021baca8(a0, idx, a1)) {
            int   word = *(int *)(ebase + idx * 0x14);
            unsigned b6_13 = (((unsigned)word << 2) >> 0x18) << 1;
            unsigned topbit = (unsigned)word << 0x12 >> 0x1f;
            unsigned packA  = b6_13 + topbit;            /* r0 */
            unsigned mid    = ((unsigned)idx << 0x10) & 0x1f0000; /* r2 */
            unsigned arg0   = (r7pack | mid) | (r4 >> 0x10);
            unsigned arg1   = ((unsigned)packA << 0x10) >> 0x10;
            if (func_ov002_021e30b4(arg0, arg1, 0, 0 /*r2=0 set in body*/)) {
                int *q = (int *)(GD + 0xd28);
                *q = *q + 1;
                return 0;
            }
        }
        {
            int *q = (int *)(GD + 0xd28);
            idx = *q + 1;
            *q = idx;
        }
        if ((unsigned)idx >= 5)
            break;
    }
    return 1;
}
