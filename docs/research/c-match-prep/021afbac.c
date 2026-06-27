/* CAMPAIGN-PREP candidate for func_021afbac (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard branch; row=base+(x+y)*10, read row[sel-1] as ldrh[-2]; v held in r4 across call
 *   risk:       orig forms the pointer with separate adds (+row, +ip*2, ldrh[#-2]); mwcc may fold sel*2-2 into one scaled addr or pick a different base reg. reshape-able (index expr / (row)[sel-1] form)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov008_021afbac (ov008, class C, MED) — built-free.
 * UNVERIFIED + ITERATION-EXPECTED. Branch + index arith + call sequencing.
 *
 * data_021b2de4: u16@+4 = a selector count; if 0 -> default path. Else index a
 * 10-byte-stride row table (ptr@+0xc0) by (u16@+0 + u16@+2), step 2 bytes per
 * unit, and read row[sel-1] (the ldrh [r1,#-2] after adding ip*2). Both arms
 * then commit via 021b2200 with the cleared handle word @+0xbc.
 */
extern void func_ov008_021b22e4(int a0);
extern void func_ov008_021b2268(int a0, int a1);
extern void func_ov008_021b2200(int a0);

extern char data_ov008_021b2de4[];

void func_ov008_021afbac(void) {
    int sel = *(unsigned short *)(data_ov008_021b2de4 + 0x4);

    if (sel == 0) {
        func_ov008_021b22e4(0);
        *(int *)(data_ov008_021b2de4 + 0xbc) = 0;
    } else {
        char *row = *(char **)(data_ov008_021b2de4 + 0xc0) +
                    (*(unsigned short *)(data_ov008_021b2de4) +
                     *(unsigned short *)(data_ov008_021b2de4 + 2)) * 5 * 2;
        int v = *(unsigned short *)(row + sel * 2 - 2);
        func_ov008_021b22e4(1);
        func_ov008_021b2268(v, 0);
    }

    func_ov008_021b2200(*(int *)(data_ov008_021b2de4 + 0xbc));
    *(int *)(data_ov008_021b2de4 + 0xbc) = 0;
}
