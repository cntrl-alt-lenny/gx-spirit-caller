/* CAMPAIGN-PREP candidate for func_0220b5e0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :1 + signed guard + 3-arg call (call-then-loads)
 *   risk:       arg eval order: bf6c4 call vs the two ldrh may reschedule; ?:2/0 movne/moveq pair
 *   confidence: med
 */
/* func_ov002_0220b5e0 — three-call sequence, ?2:0 tail */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern int func_ov002_021bd030(int a);
extern int func_ov002_0223f6c4(Entity *p);
extern int func_ov002_022536e8(int a, int f0, int x);

int func_ov002_0220b5e0(Entity *p)
{
    if (func_ov002_021bd030(p->a) < 0)
        return 0;
    return func_ov002_022536e8(p->a, p->field0, func_ov002_0223f6c4(p)) != 0 ? 2 : 0;
}
