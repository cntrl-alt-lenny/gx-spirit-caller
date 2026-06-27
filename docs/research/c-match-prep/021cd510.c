/* CAMPAIGN-PREP candidate for func_021cd510 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order = first-load; ternary sign-flag; inline i*S/i*20; parity*0x868 base, no shared-base CSE
 *   risk:       struct-guessed: LIT1 mask (0x7fff?) + LIT2/LIT3/LIT4 table bases/stride are reconstructed from a truncated pool; wrong literals -> wrong ldr targets. Also reg-alloc across 3 fields (permuter-class).
 *   confidence: low
 */
/* func_ov002_021cd510: parity/sign 3-way table dispatch. Reads ce950 flag@0
 * + halfwords @2,@4,@6, splits each into byte/magnitude fields, then routes
 * to one of three slot helpers by (h4&0x8000), (hi byte of h6), (hi byte of
 * h2 >= 6); posts a 0x24 event and clears +0x80c.
 * NOTE: the source .s literal pool was truncated in triage. LIT1 mask and the
 * LIT2/LIT3/LIT4 table bases/stride are RECONSTRUCTED — confirm against orig. */

extern char data_ov002_022ce950[];
extern char data_ov002_022cf1a6[];   /* one branch's lookup table (LIT2 guess) */
extern char data_ov002_022d0252[];   /* parity-selected slot base (LIT4 guess) */

extern int func_ov002_021b20cc(int tbl, int mag, int lo6);
extern int func_ov002_021b212c(int tbl, int mag, int lo6);
extern int func_ov002_021b218c(int tbl, int mag);
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021cd510(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short h2 = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short h4 = *(unsigned short *)(data_ov002_022ce950 + 4);
    unsigned short h6 = *(unsigned short *)(data_ov002_022ce950 + 6);
    int lo2 = h2 & 0xff;                 /* r1 */
    int hi2 = (h2 >> 8) & 0xff;          /* r2 */
    int lo6 = h6 & 0xff;                 /* r3 */
    int hi6 = (h6 >> 8) & 0xff;          /* r4 */
    int mag = h4 & 0x7fff;               /* LIT1 mask guess */
    int tbl;

    if (h4 & 0x8000) {
        int idx = (flag + (lo2 << 1)) << 2;
        tbl = *(unsigned short *)(data_ov002_022cf1a6 + idx);
        func_ov002_021b212c(tbl, mag, lo6);
    } else if (hi6 != 0) {
        tbl = *(unsigned short *)(lo2 * 20 + (flag * 0x868 + (int)data_ov002_022d0252));
        func_ov002_021b218c(tbl, mag);
    } else if (hi2 >= 6) {
        tbl = *(unsigned short *)(lo2 * 20 + (flag * 0x868 + (int)data_ov002_022d0252));
        func_ov002_021b20cc(tbl, mag, lo6);
    } else {
        tbl = *(unsigned short *)(lo2 * 20 + (flag * 0x868 + (int)data_ov002_022d0252));
        func_ov002_021b212c(tbl, mag, lo6);
    }
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
