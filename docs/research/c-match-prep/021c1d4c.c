/* CAMPAIGN-PREP candidate for func_021c1d4c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early gates; flags bit6 then (2|1) both clear; 3-way const compare, third = 0x194e+0x75
 *   risk:       third constant is built additively in asm (ldr 0x194e then add #0x75 -> 0x19c3); written 0x194e+0x75 so mwcc reuses the loaded reg via add, not a 2nd pool word. orig holds r3=parity-mul, ip=arg1*20 across the two field reads. reshape-able (shared pidx/row). pidx vs row mul-order may swap (permuter-class).
 *   confidence: med
 */
/* func_ov002_021c1d4c: gate on 021b9ecc, arg1<5, global cf flag (022ce288
 * +0x5c4)==0, slot +0x38 u16 set, slot +0x40 bits6 and (2|1) clear; then the
 * 021b9ecc result must be one of 0x1437 / 0x194e / 0x19c3 -> return 3, else 0. */

extern char         data_ov002_022ce288[];
extern unsigned short data_ov002_022cf1a4[];
extern unsigned int  data_ov002_022cf1ac[];
extern int  func_ov002_021b9ecc(int a, int b);

int func_ov002_021c1d4c(int arg0, int arg1) {
    int k = func_ov002_021b9ecc(arg0, arg1);
    if (k == 0)
        return 0;
    if (arg1 >= 5)
        return 0;
    if (*(int *)((char *)data_ov002_022ce288 + 0x5c4) != 0)
        return 0;
    {
        int pidx = (arg0 & 1) * 0x868;
        int row = arg1 * 20;
        unsigned int f;
        if (*(unsigned short *)((char *)data_ov002_022cf1a4 + pidx + row) == 0)
            return 0;
        f = *(unsigned int *)((char *)data_ov002_022cf1ac + pidx + row);
        if (((f >> 6) & 1) == 0 && ((((f >> 2) | (f >> 1)) & 1)) == 0) {
            if (k == 0x1437 || k == 0x194e || k == 0x194e + 0x75)
                return 3;
        }
    }
    return 0;
}
