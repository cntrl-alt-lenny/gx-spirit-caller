/* CAMPAIGN-PREP candidate for func_020125ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     const-fold sub (0x26-0x27=-1) kept as expr; store-order=source; reuse confirmed struct
 *   risk:       const materialization: orig derives bc4 as `sub r3,r0,#0x27` from the 0x26 in r0 and reuses r0=1 for c40/c44/b84. If mwcc remats constants instead of reusing, mov/str count diverges. reshape-able (keep 0x26-0x27 form, share the `1`).
 *   confidence: med
 */
/* func_020125ac(): like 020124f4 but all-constant init with fold tells:
 * f_bbc=1, f_bc0=0x26, f_bc4=(0x26-0x27)=-1, f_b84=1. Same data_021040ac
 * layout (confirmed via func_02012560.c). Stores in exact asm order. */
typedef struct {
    char _pad_b84[0xb84];
    int  f_b84;   /* 0xb84 */
    int  f_b88;   /* 0xb88 */
    char _pad_b90[0x14];
    int  f_ba0;   /* 0xba0 */
    char _pad_bb0[0xc];
    int  f_bb0;   /* 0xbb0 */
    int  f_bb4;   /* 0xbb4 */
    char _pad_bbc[0x4];
    int  f_bbc;   /* 0xbbc */
    int  f_bc0;   /* 0xbc0 */
    int  f_bc4;   /* 0xbc4 */
    int  f_bc8;   /* 0xbc8 */
    char _pad_c38[0x6c];
    int  f_c38;   /* 0xc38 */
    int  f_c3c;   /* 0xc3c */
    int  f_c40;   /* 0xc40 */
    int  f_c44;   /* 0xc44 */
    int  f_c48;   /* 0xc48 */
} state_021040ac_t;

extern state_021040ac_t data_021040ac;
extern int func_02011aec(void);

void func_020125ac(void)
{
    data_021040ac.f_ba0 = 0;
    data_021040ac.f_bbc = 1;
    data_021040ac.f_bc0 = 0x26;
    data_021040ac.f_bc4 = 0x26 - 0x27;
    data_021040ac.f_bc8 = func_02011aec();
    data_021040ac.f_bb0 = 0;
    data_021040ac.f_bb4 = -1;
    data_021040ac.f_c38 = 0;
    data_021040ac.f_c3c = 0;
    data_021040ac.f_c48 = 2;
    data_021040ac.f_c40 = 1;
    data_021040ac.f_c44 = 1;
    data_021040ac.f_b88 = 0;
    data_021040ac.f_b84 = 1;
}
