/* CAMPAIGN-PREP candidate for func_02253390 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table switch (cases 0xc-0xf, no default => count uninit); (arg0&1)*0x868 byte-offset table; accumulator-first loop call.
 *   risk:       mwcc may build a cmp-chain not the addls jump-table for the sparse 0xc-0xf range, or init count on default; reshape-able (case range / leave count unassigned).
 *   confidence: med
 */
/* func_ov002_02253390: switch(kind=arg2) picks a per-player count from one of
 * four 0x868-stride tables, then loops func_ov002_02253458(arg0, kind, i)
 * count times. arg1 unused; default path falls through with count uninit
 * (matches the orig .L_88 merge that doubles as the >0xf default). */

extern int data_ov002_022cf17c[];
extern int data_ov002_022cf180[];
extern int data_ov002_022cf184[];
extern int data_ov002_022cf188[];
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02253390(int arg0, int arg1, int arg2) {
    int count;
    int i;
    switch (arg2) {
    case 0xc: count = *(int *)((char *)data_ov002_022cf184 + (arg0 & 1) * 0x868); break;
    case 0xd: count = *(int *)((char *)data_ov002_022cf17c + (arg0 & 1) * 0x868); break;
    case 0xe: count = *(int *)((char *)data_ov002_022cf180 + (arg0 & 1) * 0x868); break;
    case 0xf: count = *(int *)((char *)data_ov002_022cf188 + (arg0 & 1) * 0x868); break;
    }
    for (i = 0; i < count; i++) {
        func_ov002_02253458(arg0, arg2, i);
    }
}
