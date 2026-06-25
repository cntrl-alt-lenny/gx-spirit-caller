/* CAMPAIGN-PREP candidate for func_0220db18 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :1 + :5 extract, two-arg call, 0xffff guard, tail call
 *   risk:       reg-alloc of the two bitfield temps may flip; cmp ==0xffff via literal pool
 *   confidence: med
 */
/* func_ov002_0220db18 — bitfield extract, guarded tail call */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern int func_ov002_021b3958(int a, int b);
extern int func_ov002_02208bfc(Entity *p, int arg);

int func_ov002_0220db18(Entity *p, int arg)
{
    if (func_ov002_021b3958(p->a, p->b) == 0xffff)
        return 0;
    return func_ov002_02208bfc(p, arg);
}
