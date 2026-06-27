/* CAMPAIGN-PREP candidate for func_020124f4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order = source order; reuse confirmed struct from func_02012560.c; bind globals to one base
 *   risk:       store-order/const-reuse: orig holds 0(r1/r2) and base(r3->r1) in regs and reorders zero-stores; if mwcc re-batches the four pre-call stores or reloads base, a few str/ldr shift. reshape-able (line order already matches asm).
 *   confidence: med
 */
/* func_020124f4(a,b): multi-field init of the data_021040ac singleton, then
 * a helper return is stored. Field offsets confirmed against the matched
 * sibling src/main/func_02012560.c (same global, same layout). Emit the
 * field stores in the exact asm order. */
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

void func_020124f4(int a, int b)
{
    data_021040ac.f_ba0 = 0;
    data_021040ac.f_bbc = 0;
    data_021040ac.f_bc0 = a;
    data_021040ac.f_bc4 = 0;
    data_021040ac.f_bc8 = func_02011aec();
    data_021040ac.f_bb0 = 0;
    data_021040ac.f_bb4 = -1;
    data_021040ac.f_c3c = 0;
    data_021040ac.f_c48 = 2;
    data_021040ac.f_c40 = 0;
    data_021040ac.f_c44 = 1;
    data_021040ac.f_c38 = 0;
    data_021040ac.f_b88 = b;
    data_021040ac.f_b84 = a;
}
