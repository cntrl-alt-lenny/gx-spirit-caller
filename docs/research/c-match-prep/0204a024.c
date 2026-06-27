/* CAMPAIGN-PREP candidate for func_0204a024 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload func_020498f0() per case; forward byte/word field to func_020672f4; default range-guard + stride-0xc data scan
 *   risk:       TARGET .s IS TRUNCATED after `beq .L_12c` - the whole default tail (a0 100..0x99+100 data_0219dcb4/dcb5 scan) is missing, so this TU cannot be byte-complete. Also the .L_e0 branch order (signed bgt/bge/blt range tree on 0x32/0xa/0x8) may not match a plain switch. struct-guessed + truncated.
 *   confidence: low
 */
/* func_0204a024 - main - class D (range-dispatch switch forwarding accessor
 * fields to func_020672f4). a1 held in r4; func_020498f0() (GxState*) reloaded
 * per case. NOTE: target .s is TRUNCATED after `beq .L_12c` - the default
 * (a0 in 100..100+0x9a) data_0219dcb4/dcb5 stride-0xc scan tail is incomplete.
 * data_0219dcb4/dcb5 are byte arrays indexed by (a0-100)*0xc. */

typedef unsigned char u8;

extern void func_020672f4(int a0, int a1);
extern u8 data_0219dcb4[];
extern u8 data_0219dcb5[];
extern void *data_0219dcbc;

/* GxState fields touched here */
struct GxState {
    char _pad00[0x14];
    u8   b14;    /* +0x14 */
    u8   b15;    /* +0x15 */
    u8   b16;    /* +0x16 */
    char _pad17[0x9];
    int  w20;    /* +0x20 */
    char _pad24[0x1dc];
    int  w200;   /* +0x200 */
};
extern struct GxState *func_020498f0(void);

void func_0204a024(int a0, int a1) {
    switch (a0) {
    case 0x8:
        func_020672f4(a1, func_020498f0()->b14);
        return;
    case 0xa:
        func_020672f4(a1, func_020498f0()->b16);
        return;
    case 0x32:
        func_020672f4(a1, func_020498f0()->w200);
        return;
    case 0x33:
        func_020672f4(a1, func_020498f0()->b15);
        return;
    case 0x34:
        func_020672f4(a1, func_020498f0()->w20);
        return;
    case 0x35:
        func_020672f4(a1, 3);
        return;
    case 0x36:
        func_020672f4(a1, 1);
        return;
    default:
        {
            int i = a0 - 0x64;
            if (i < 0 || i >= 0x9a) return;
            if (data_0219dcb4[i * 0xc] == 0) return;
            if (data_0219dcb5[i * 0xc] == 0) return;
            /* TRUNCATED: .L_12c body not present in target .s */
        }
        return;
    }
}
