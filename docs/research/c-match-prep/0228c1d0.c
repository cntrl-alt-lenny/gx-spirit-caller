/* CAMPAIGN-PREP candidate for func_0228c1d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store arg.k before loop (store-order); for-loops match counted ldrh tables; final ptr step +8
 *   risk:       struct-guessed: CmdArg layout {v@0,k@4} and the two _LIT2/_LIT4 constants are inferred from str sp/sp+4 — confirm the real values; store-order of arg.v/arg.k must match.
 *   confidence: low
 */
// func_ov002_0228c1d0 — ov002 class D: two table-driven counted loops, store-then-call, store-order
#include <stddef.h>

typedef struct { int v; int k; } CmdArg;

extern unsigned int data_ov002_022c8610;
extern unsigned short data_ov002_022c863e[];   // table A (0x3d entries)
extern CmdArg data_ov002_022c89a0[];           // final-loop base (stride 8)
extern int data_ov002_022cd524;                // constant stored at sp+4 (case A)
extern unsigned short data_ov002_022ce288[];   // table B (0x17 entries)

extern unsigned char data_ov002_022cf1ac_blk[]; // _LIT1 base: byte[0x5d4]/[0x5dc]
extern int func_ov002_0228bcd0(unsigned int a0, CmdArg *p, int a2);

int func_ov002_0228c1d0(unsigned int a0, int a2)
{
    int i;
    CmdArg arg;
    unsigned char *base = data_ov002_022cf1ac_blk;

    data_ov002_022c8610 = a0;
    if (*(int *)(base + 0x5d4) != 0) {
        unsigned char sel = base[0x5dc];
        if (sel == 0x12 || sel == 0x13) {
            arg.k = data_ov002_022cd524;
            for (i = 0; i < 0x3d; i++) {
                arg.v = data_ov002_022c863e[i];
                if (func_ov002_0228bcd0(a0, &arg, a2)) return 1;
            }
        } else if (sel == 0x14) {
            arg.k = (int)(size_t)&data_ov002_022cd524; /* second constant (_LIT4) */
            for (i = 0; i < 0x17; i++) {
                arg.v = data_ov002_022ce288[i];
                if (func_ov002_0228bcd0(a0, &arg, a2)) return 1;
            }
        }
    }
    {
        CmdArg *p = data_ov002_022c89a0;
        for (i = 0; i < 0xca; i++, p++) {
            if (func_ov002_0228bcd0(a0, p, a2)) return 1;
        }
    }
    return 0;
}
