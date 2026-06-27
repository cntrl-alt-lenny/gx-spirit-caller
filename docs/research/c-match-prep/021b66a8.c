/* CAMPAIGN-PREP candidate for func_021b66a8 (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     loop1 unsigned-ldrh pointer countdown; loop2 ldrsh stride-8 off same base +0x34; trailing stores
 *   risk:       reshape-able: loop1 now emits ldrh+countdown but mwcc split `--i` into sub+cmp where target has a single `subs r2,#1` -> the loop-end compare may differ by 1 instr; re-try as `for(i=0x28;i;i-=4)` byte-walk if it persists.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b66a8 (ov017, class C, MED) — batch p_0138.
 * DISASM-CHECKED: both loops now match the target shape after reshaping —
 * loop 1 to an UNSIGNED-halfword pointer-walk countdown (ldrh/strh, not ldrsh),
 * and loop 2 to index off the SAME data base with +0x34 in the store offset
 * (strh [base,#0x34], not a pre-folded pointer). */

typedef short s16;

extern short data_ov017_021b7ed0[];   /* source table, 20 shorts (_LIT1) */
extern char  data_ov000_021b1d4c[];   /* D: dest struct (_LIT0) */
extern void  func_ov005_021aa4b0(void *d);

struct Quad { s16 a, b, c, d; };

int func_ov017_021b66a8(char *s) {
    s16 buf[20];
    int i;

    {
        unsigned short *src = (unsigned short *)data_ov017_021b7ed0;
        unsigned short *dp  = (unsigned short *)buf;
        i = 10;
        do {
            dp[0] = src[0];
            dp[1] = src[1];
            src += 2;
            dp  += 2;
        } while (--i);
    }

    if (*(int *)(s + 0x14) > 5) {
        struct Quad *qb = (struct Quad *)buf;
        func_ov005_021aa4b0(data_ov000_021b1d4c);
        *(int *)(data_ov000_021b1d4c + 0) = 0;
        for (i = 0; i < 5; i++) {
            *(s16 *)(data_ov000_021b1d4c + i * 8 + 0x34) = qb[i].a;
            *(s16 *)(data_ov000_021b1d4c + i * 8 + 0x36) = qb[i].b;
            *(s16 *)(data_ov000_021b1d4c + i * 8 + 0x38) = qb[i].c;
            *(s16 *)(data_ov000_021b1d4c + i * 8 + 0x3a) = qb[i].d;
        }
        *(int *)(data_ov000_021b1d4c + 4) = *(int *)(s + 0xc);
        *(int *)(data_ov000_021b1d4c + 8) = *(int *)(s + 0x14) - 5;
        *(int *)(data_ov000_021b1d4c + 0xc) = 5;
        *(int *)(data_ov000_021b1d4c + 0x10) = 0;
    }
    return 1;
}
