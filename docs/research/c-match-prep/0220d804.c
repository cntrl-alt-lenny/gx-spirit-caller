/* CAMPAIGN-PREP candidate for func_0220d804 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global !=cmp guards (base bound) + call(a,lit) >0 tail
 *   risk:       data_ word-index type guessed; r0 keeps p->a into bb950; movgt/movle pair
 *   confidence: med
 */
/* func_ov002_0220d804 — two global guards then guarded call */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern int data_ov002_022d016c[];
extern int func_ov002_021bb950(int a, int x);

int func_ov002_0220d804(Entity *p)
{
    if (data_ov002_022d016c[0xcec / 4] != (int)p->a)
        return 0;
    if (data_ov002_022d016c[0xcf8 / 4] != 5)
        return 0;
    return func_ov002_021bb950(p->a, 0x1aa7) > 0 ? 1 : 0;
}
