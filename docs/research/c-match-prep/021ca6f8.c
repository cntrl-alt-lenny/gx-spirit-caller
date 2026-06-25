/* CAMPAIGN-PREP candidate for func_021ca6f8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain returning bool; nested if early-returns; bool != 0
 *   risk:       asm pool truncated: symbol->LIT mapping + d016c/cd744/cd968 offsets guessed; redundant cmpeq-r2 artifact + branch order may diverge
 *   confidence: low
 */
/* func_ov002_021ca6f8: nested cmp guard chain returning bool.
 * NOTE: the source asm pool (_LIT0.._LIT4) was TRUNCATED; symbol->pool
 * assignment and several field offsets are inferred from the header
 * (ce950 has +0x808/+0x80c; d016c has +0xcec). cd73c/cd744/cd968 ids
 * for the table[arg0] / .f4 / .f300 slots are best-effort guesses. */

typedef struct { char _a[0x808]; unsigned int f_808; unsigned int f_80c; } StateCe950;
typedef struct { char _a[0xcec]; int f_cec; char _b[0x24]; int f_d14; char _c[4]; int f_d1c; char _d[0x28]; int f_d48; } StateD016c;
typedef struct { char _a[4]; int f_4; } StateCd744;
typedef struct { char _a[0x300]; unsigned int f_300; } StateCd968;

extern StateCe950 data_ov002_022ce950;
extern StateD016c data_ov002_022d016c;
extern int        data_ov002_022cd73c[];
extern StateCd744 data_ov002_022cd744;
extern StateCd968 data_ov002_022cd968;
extern int func_ov002_021b1cf0(void);
extern int func_ov002_0229c7f8(int a);

int func_ov002_021ca6f8(int arg0) {
    if (data_ov002_022ce950.f_80c != 0 || data_ov002_022ce950.f_808 != 0)
        return 0;
    if (data_ov002_022cd73c[arg0] == 1) {
        if (data_ov002_022d016c.f_cec != arg0) return 0;
        if (data_ov002_022d016c.f_d14 == 0) return 0;
        if (data_ov002_022d016c.f_d1c == 3) return 1;
        return 0;
    }
    if (arg0 == data_ov002_022cd744.f_4) {
        if (data_ov002_022d016c.f_d48 != 0) return 1;
        if (func_ov002_0229c7f8(0x31) != 0) return 1;
        if (func_ov002_0229c7f8(0x32) != 0) return 1;
        return 0;
    }
    if (data_ov002_022cd968.f_300 & 1) return 0;
    return func_ov002_021b1cf0() != 0;
}
