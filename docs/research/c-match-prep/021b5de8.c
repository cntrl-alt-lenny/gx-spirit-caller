/* CAMPAIGN-PREP candidate for func_021b5de8 (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     state dispatch s->w_68; ptr-chase; signed %8 rotate idiom; stride-8 u16 tables; reload index
 *   risk:       struct-guessed: shown code is byte-exact in disasm, so the only open risk is the RECONSTRUCTED truncated tail (.L_10f8/.L_1118) and the _LIT0/2 -> data_021059c6/ce table-symbol identities.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b5de8 (ov017, class C, MED) — batch p_0138.
 * DISASM-VERIFIED: the ENTIRE shown body matches the target byte-for-byte, including
 * the signed `% 8` rotate idiom (lsr#31; rsb,lsl#29; add,ror#29) and the index reload.
 * NOTE: batch asm TRUNCATED after .L_10f8 — the .L_10f8 SFX(0x42) call and the .L_1118
 * epilogue are RECONSTRUCTED but match the visible .L_10f8 prefix and disasm. */

extern int  func_02037208(int a, int b, int c, int d);
extern int  func_020a991c(void);
extern void func_020a9950(int a);
extern void func_ov017_021b646c(void *s);
extern void func_ov017_021b6610(void *s);

extern char data_021040ac[];     /* G: +0x38 (_LIT1) */
extern short data_021059c6[];    /* table A, stride-8 u16 (_LIT0) */
extern short data_021059ce[];    /* table B, stride-8 u16 (_LIT2) */

int func_ov017_021b5de8(char *s) {
    int sel;
    char *p;
    int cur;
    int prev;

    sel = *(int *)(s + 0x68);
    if (sel == 0) {
        func_ov017_021b646c(s);
        if (*(int *)(s + 4) == 2) {
            p = s + *(int *)(s + 0xc) + *(int *)(s + 0x10);
            prev = *(unsigned char *)(p + 0x20);
            cur = *(int *)(s + 0x60);
            if (cur != prev && cur > 0) {
                if (*(unsigned short *)((char *)data_021059c6 + ((prev - 1) << 3)) == 0) {
                    int r;
                    func_020a9950(*(int *)(data_021040ac + 0x38));
                    r = func_020a991c();
                    *(unsigned short *)((char *)data_021059ce + (*(int *)(s + 0x60) << 3)) =
                        (short)((r % 8) + 0xe);
                } else {
                    func_02037208(0x43, 0x43 - 0x44, 0, 1);
                    return 0;
                }
            }
        }
        *(int *)(s + 0) = 2;
        *(int *)(s + 8) = 0;
        func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
        return 0;
    }
    if (sel == 1) {
        p = s + *(int *)(s + 0xc) + *(int *)(s + 0x10);
        cur = *(int *)(s + 0x60);
        if (cur != *(unsigned char *)(p + 0x20)) {
            func_ov017_021b6610(s);
        }
        *(int *)(s + 0) = 2;
        *(int *)(s + 8) = 0;
        func_02037208(0x42, 0x42 - 0x43, 0, 1);
        return 0;
    }
    return 0;
}
