/* CAMPAIGN-PREP candidate for func_021b3e6c (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp-chain dispatch; volatile-unsigned FLG read (2 loads+lsr); reuse live r3=1 on final call
 *   risk:       struct-guessed: only the _LIT0/2/3 -> data_02104f4c/_021b8894 symbol identities are inferred; codegen matched in disasm, so any diff is a relocation/literal-pool name fix.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b3e6c (ov017, class C, MED) — batch p_0138.
 * DISASM-VERIFIED against target (arm-none-eabi-objdump on the mwcc 2.0/sp1p5 -O4,p .o):
 * the full dispatch chain, both func_02094504 calls, and the final func_02037208(0x3a)
 * (which REUSES the live r3=1 from `s->w_04=1`, emitting no `mov r3`) match byte-for-byte,
 * and the .L_a48 bit-pack now matches exactly (two loads + lsr) via the volatile-unsigned read. */

extern int  func_02037208(int a, int b, int c, int d);
extern int  func_0208e1ac(void);
extern int  func_0208e0a0(void);
extern void func_02094504(int val, void *dst, int len);
extern void func_ov017_021b4570(void *a, int b);

extern char data_02104f4c[];          /* G: large global, +0xa64 / +0xa74 (_LIT0) */
extern char data_ov017_021b8610[];    /* data_in: byte +0x1ce (_LIT1) */
extern char data_ov017_021b8894[];    /* FLG word (_LIT2) + halfword target (_LIT3/_LIT4) */

int func_ov017_021b3e6c(char *s) {
    int m;
    char *g;
    int w;
    unsigned int field;

    m = *(int *)(s + 0xc);
    if (m == 4) {
        func_02037208(0x42, 0x42 - 0x43, 0, 1);
        return 1;
    }
    if (m == 2) {
        g = data_02104f4c;
        if (((*(int *)(g + 0xa64) & 0x1f00000) >> 0x14) == 0
                && *(int *)(g + 0xa74) == 0) {
            func_02037208(0x43, 0x43 - 0x44, 0, 1);
            return 0;
        }
    } else if (m == 1) {
        int b = *(unsigned char *)(data_ov017_021b8610 + 0x1ce);
        if (b == 6 || b == 0xb) {
            func_02037208(0x43, 0x43 - 0x44, 0, 1);
            return 0;
        }
    }

    /* .L_a48 : target reads FLG TWICE (not CSE'd) and shifts the field LOGICALLY.
     * volatile-unsigned read reproduces both (two ldr + lsr); store stays plain str. */
    field = (((volatile unsigned int *)(data_ov017_021b8894 + 0))[0] & 0x1f00) >> 8;
    w     = ((volatile unsigned int *)(data_ov017_021b8894 + 0))[0];
    ((volatile unsigned int *)(data_ov017_021b8894 + 0))[0] =
        (w & ~0x1f00) | ((field & ~6) << 8);

    func_02094504(0, (void *)func_0208e1ac(), 0x800);
    func_02094504(0, (void *)func_0208e0a0(), 0x800);
    *(short *)(data_ov017_021b8894 + 0x10) = 0;
    func_ov017_021b4570((void *)(data_ov017_021b8894 + 0x20), *(int *)(s + 0xc));
    *(int *)(s + 4) = 1;
    func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
    return 0;
}
