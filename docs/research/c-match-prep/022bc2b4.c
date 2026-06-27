/* CAMPAIGN-PREP candidate for func_022bc2b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: faithful sparse switch returning constants; let mwcc rebuild its compare-tree+inner jump-table.
 *   risk:       permuter-class: mwcc's switch-tree pivot choice / where it emits the addpl-pc jump-table for the 0x10f1..0x10f6 run must match exactly. Tree shape is compiler-driven and very order/heuristic-sensitive across 28 cases.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022bc2b4 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Pure sparse switch(x) returning small constants
 * 0x9c..0xaa, default 0 — NO calls. mwcc built a balanced compare-tree + one inner
 * jump-table for the contiguous run 0x10f1..0x10f6. 28 cases decoded from the .s
 * (full asm read from src/overlay002/func_ov002_022bc2b4.s; the batch was clipped). */
int func_ov002_022bc2b4(int x) {
    switch (x) {
    case 0x10f1: return 0x9c;
    case 0x10f2: return 0x9d;
    case 0x10f3: return 0x9e;
    case 0x10f4: return 0x9f;
    case 0x10f5: return 0xa0;
    case 0x10f6: return 0xa1;
    case 0x1323: return 0xa4;
    case 0x1344: return 0x9c;
    case 0x1345: return 0xa0;
    case 0x1346: return 0xa2;
    case 0x1347: return 0x9e;
    case 0x1348: return 0xa8;
    case 0x1349: return 0xa1;
    case 0x149c: return 0xa3;
    case 0x14d1: return 0xa9;
    case 0x150b: return 0xa0;
    case 0x159d: return 0xa5;
    case 0x169f: return 0xa1;
    case 0x175e: return 0xa6;
    case 0x183f: return 0x9e;
    case 0x187f: return 0xa3;
    case 0x18ff: return 0xaa;
    case 0x19f2: return 0x9d;
    case 0x1a0c: return 0xa7;
    case 0x1a66: return 0xaa;
    case 0x1a67: return 0xa5;
    case 0x1a77: return 0xa3;
    case 0x1aa7: return 0x9c;
    default: return 0;
    }
}
