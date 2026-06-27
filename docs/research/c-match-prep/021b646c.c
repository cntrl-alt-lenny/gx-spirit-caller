/* CAMPAIGN-PREP candidate for func_021b646c (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table on s->w_04; per-case literal reload (do NOT hoist IN/OUT); ptr-chase guarded stores
 *   risk:       struct-guessed: cases 0-2 are byte-exact in disasm; the open risk is the RECONSTRUCTED case 3 (.L_13c) — its field offset (+0xd2?) and flag (0x20?) are unverifiable from the truncated asm.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b646c (ov017, class C, MED) — batch p_0138.
 * DISASM-VERIFIED: cases 0/1/2 match the target byte-for-byte AFTER removing the
 * hoisted IN/OUT locals (target RELOADS the literal per case). NOTE: batch asm
 * TRUNCATED after .L_e0 (case 2) — case 3 (.L_13c) and the .L_194 epilogue are
 * RECONSTRUCTED; case-3 field +0xd2 / flag 0x20 are GUESSED. */

extern int  func_02037208(int a, int b, int c, int d);
extern void func_ov017_021b61dc(void *s);

extern char data_ov017_021b8894[];   /* IN: bytes +0x1ce / +0x1cf (_LIT0) */
extern char data_ov017_021b8994[];   /* OUT: halfword +0xd0, flag halfword +0xd8 (_LIT1) */

void func_ov017_021b646c(char *s) {
    int cur;

    switch (*(int *)(s + 4)) {
    case 0:
        cur = *(unsigned char *)(s + *(int *)(s + 0xc) + *(int *)(s + 0x10) + 0x20);
        if (*(unsigned char *)(data_ov017_021b8894 + 0x1ce) != cur) {
            *(unsigned char *)(data_ov017_021b8894 + 0x1ce) = (unsigned char)cur;
            *(short *)(data_ov017_021b8994 + 0xd8) = 4;
            *(int *)(s + 0x1c) = *(int *)(s + 0xc) + *(int *)(s + 0x10);
            func_02037208(0x38, 0x38 - 0x39, 0, 1);
        }
        break;
    case 1:
        cur = *(unsigned char *)(s + *(int *)(s + 0xc) + *(int *)(s + 0x10) + 0x20);
        if (*(unsigned char *)(data_ov017_021b8894 + 0x1cf) != cur) {
            *(unsigned char *)(data_ov017_021b8894 + 0x1cf) = (unsigned char)cur;
            *(short *)(data_ov017_021b8994 + 0xd8) = 8;
            *(int *)(s + 0x1c) = *(int *)(s + 0xc) + *(int *)(s + 0x10);
            func_02037208(0x38, 0x38 - 0x39, 0, 1);
        }
        break;
    case 2:
        cur = *(unsigned char *)(s + *(int *)(s + 0xc) + *(int *)(s + 0x10) + 0x20);
        if (*(unsigned short *)(data_ov017_021b8994 + 0xd0) != cur) {
            *(short *)(data_ov017_021b8994 + 0xd0) = (short)cur;
            *(short *)(data_ov017_021b8994 + 0xd8) = 0x10;
            func_ov017_021b61dc(s);
            *(int *)(s + 0x1c) = *(int *)(s + 0xc) + *(int *)(s + 0x10);
            func_02037208(0x38, 0x38 - 0x39, 0, 1);
        }
        break;
    case 3:   /* RECONSTRUCTED (truncated): field +0xd2 / flag 0x20 GUESSED */
        cur = *(unsigned char *)(s + *(int *)(s + 0xc) + *(int *)(s + 0x10) + 0x20);
        if (*(unsigned short *)(data_ov017_021b8994 + 0xd2) != cur) {
            *(short *)(data_ov017_021b8994 + 0xd2) = (short)cur;
            *(short *)(data_ov017_021b8994 + 0xd8) = 0x20;
            *(int *)(s + 0x1c) = *(int *)(s + 0xc) + *(int *)(s + 0x10);
            func_02037208(0x38, 0x38 - 0x39, 0, 1);
        }
        break;
    default:
        break;
    }
}
