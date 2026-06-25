/* CAMPAIGN-PREP candidate for func_0220cff8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global reload (base bound once) + :1 compare + ==3 predicate
 *   risk:       data_ word-index 0xcec/0xcf8 type guessed; cmp operand order global vs field
 *   confidence: med
 */
/* func_ov002_0220cff8 — global-field compare predicate */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern int data_ov002_022d016c[];

int func_ov002_0220cff8(Entity *p)
{
    if (data_ov002_022d016c[0xcec / 4] == (int)p->a)
        return 0;
    if (data_ov002_022d016c[0xcf8 / 4] == 3)
        return 1;
    return 0;
}
