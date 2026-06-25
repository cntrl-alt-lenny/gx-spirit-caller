/* CAMPAIGN-PREP candidate for func_0220cf0c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     param guard + :6 bitfield + (==31||==32) predicate
 *   risk:       cmp;cmpne chain order for ||; 6-bit field c offset/width confirmed by shifts
 *   confidence: high
 */
/* func_ov002_0220cf0c — bitfield range predicate, no calls */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

int func_ov002_0220cf0c(Entity *p, int sel)
{
    int c;
    if (sel != 0)
        return 0;
    c = p->c;
    if (c == 0x1f || c == 0x20)
        return 1;
    return 0;
}
