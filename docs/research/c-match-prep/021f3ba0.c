/* CAMPAIGN-PREP candidate for func_021f3ba0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: source-ascending switch; 74 cases+returns recovered by full ARM sim of the .s; correct C oracle
 *   risk:       cmp-tree SHAPE diverges (336 vs 341 insns): orig builds the binary search off one held base with sub-#imm comparands, mwcc balances differently and loads extra literals. permuter-class (ship-as-.s; already GLOBAL_ASM).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f3ba0 (ov002, class D) — MED tier.
 * 1364B pure cmp-tree classifier (card-id -> small enum), NO calls. Reads u16 at
 * [arg0+0]; returns 1 (most ids), 2 (3 ids), 5 (1 id), else 0. Case list +
 * return values RECOVERED by full ARM simulation of the on-disk .s (sim.py),
 * verified conflict-free (74 ids). Case order is source-ASCENDING so mwcc's
 * binary-search pivots/immediate-folds have a chance to line up.
 * BUILD-CHECKED (mwcc 2.0/sp1p5 -O4,p): semantics + all 74 cases correct, but the
 * cmp-tree SHAPE differs (mine 336 insns vs orig 341): orig derives comparands as
 * `sub r0,base,#500` off ONE held literal; mwcc loads more separate literals and
 * balances the binary search differently. Permuter-class / ship-as-.s — confirmed
 * (it already ships as GLOBAL_ASM). The case list is still a correct C oracle. */
typedef unsigned short u16;

int func_ov002_021f3ba0(u16 *card) {
    switch (*card) {
    case 0x1321:
        return 5;
    case 0x1326: case 0x1638: case 0x16a6:
        return 2;
    case 0xfe0: case 0x114f: case 0x12f8: case 0x12fe: case 0x13f5: case 0x1421:
    case 0x1446: case 0x1461: case 0x1470: case 0x147f: case 0x14a7: case 0x14d7:
    case 0x14dc: case 0x14de: case 0x1594: case 0x15a6: case 0x15a8: case 0x15ad:
    case 0x15b1: case 0x15b4: case 0x15c7: case 0x15e9: case 0x15f9: case 0x15fa:
    case 0x15fc: case 0x15fd: case 0x161c: case 0x16b2: case 0x16dd: case 0x1727:
    case 0x1754: case 0x1758: case 0x1764: case 0x1769: case 0x179c: case 0x179e:
    case 0x1805: case 0x183e: case 0x1844: case 0x1845: case 0x1848: case 0x1849:
    case 0x1851: case 0x187a: case 0x1887: case 0x188e: case 0x1895: case 0x18c6:
    case 0x18c9: case 0x18cb: case 0x1900: case 0x190e: case 0x191e: case 0x192d:
    case 0x1936: case 0x1953: case 0x19ae: case 0x19b6: case 0x19db: case 0x19f3:
    case 0x1a09: case 0x1a42: case 0x1a60: case 0x1a6e: case 0x1a70: case 0x1a9b:
    case 0x1adf: case 0x1b41: case 0x1b42: case 0x1b43:
        return 1;
    }
    return 0;
}
