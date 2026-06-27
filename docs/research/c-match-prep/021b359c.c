/* CAMPAIGN-PREP candidate for func_021b359c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     parity mla base; (word<<19)>>19 low-13 test; addne count via if-return
 *   risk:       reshape-able->bitfield: orig uses lsl#19;lsr#19 (movs) for the :13 test; mwcc may fold (x<<19)>>19!=0 to 'and #0x1fff' — if so, replace with an unsigned :13 bitfield member. Secondary: r6/r7 dual pointer-walk vs single base+i*0x14. struct-guessed offsets.
 *   confidence: med
 */
/* func_ov002_021b359c : counted loop (5) over record array, conditional callback count (class C/D) */
/* struct-guessed: parity block 022cf16c+parity*0x868, record stride 0x14, fields +0x30/+0x38. */

extern unsigned short data_ov002_022cf16c[];
extern int func_ov002_021b30ac(int a, int b, int c);

int func_ov002_021b359c(int arg0, int arg1)
{
    unsigned char *base;
    int i;
    int count;

    base = (unsigned char *)data_ov002_022cf16c + (arg0 & 1) * 0x868;
    count = 0;
    for (i = 0; i < 5; i++) {
        if ((((*(unsigned int *)(base + i * 0x14 + 0x30)) << 19) >> 19) != 0
            && *(unsigned short *)(base + i * 0x14 + 0x38) != 0) {
            if (func_ov002_021b30ac(arg0, i, arg1) != 0)
                count++;
        }
    }
    return count;
}
