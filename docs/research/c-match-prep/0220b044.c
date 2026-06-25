/* CAMPAIGN-PREP candidate for func_0220b044 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :1 + rsb(1-a) operand-order + guarded calls
 *   risk:       reg-alloc of (1-a) temp may flip; merge of two return-1 paths could split
 *   confidence: med
 */
/* func_ov002_0220b044 — two guarded calls, rsb(1-a) */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern int func_ov002_021ca698(int x, int y);
extern int func_ov002_021bd364(int x, int y);

int func_ov002_0220b044(Entity *p)
{
    if (func_ov002_021ca698(p->a, 1 - p->a)) {
        if (func_ov002_021bd364(1 - p->a, 7))
            return 2;
    }
    return 1;
}
