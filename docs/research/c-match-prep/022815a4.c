/* CAMPAIGN-PREP candidate for func_022815a4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-bucket switch (ret-1 / ret-arg1==0) + default call-chain; arg1==0 via ternary
 *   risk:       two-outcome switch-tree: mwcc must split the 20 cases into the same ret1/retArg1 leaves AND match the cmp ladder; orig is hand .s. Tree-shape divergence is permuter-class
 *   confidence: low
 */
/* func_ov002_022815a4 (ov002, cls C) — three-way sparse dispatch.
 * switch(arg0): 16 ids -> return 1; 4 ids -> return arg1==0?1:0; default ->
 * if (022813f8(arg0)) return 1; return 022814f0(arg0)!=0. Orig is a balanced
 * signed compare-tree (ships as .s). r4=arg0 held across; r1=arg1 used only
 * by the .L_160 (==0) arm. */
extern int func_ov002_022813f8(int a);
extern int func_ov002_022814f0(int a);

int func_ov002_022815a4(int arg0, int arg1) {
    switch (arg0) {
    case 0x10f4: case 0x1256: case 0x1302: case 0x130c: case 0x1322:
    case 0x134a: case 0x140e: case 0x1468: case 0x150a: case 0x150b:
    case 0x15ee: case 0x1636: case 0x166c: case 0x17a6: case 0x1992:
    case 0x1a7e:
        return 1;
    case 0x1466: case 0x1522: case 0x1645: case 0x185c:
        return (arg1 == 0) ? 1 : 0;
    default:
        break;
    }
    if (func_ov002_022813f8(arg0) != 0)
        return 1;
    return (func_ov002_022814f0(arg0) != 0) ? 1 : 0;
}
