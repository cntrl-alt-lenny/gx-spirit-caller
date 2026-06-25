/* CAMPAIGN-PREP candidate for func_0220b178 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :1 + (idx*0x868) table index + bool-invert tail
 *   risk:       redundant and#1 after :1 extract may or may not emit; data_ stride/type guessed
 *   confidence: med
 */
/* func_ov002_0220b178 — guard then 0x868-stride table lookup */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern unsigned char data_ov002_022cf178[];
extern int func_ov002_021bd364(int x, int y);

int func_ov002_0220b178(Entity *p)
{
    if (func_ov002_021bd364(p->a, 0x16) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf178 + (p->a & 1) * 0x868) == 0)
        return 1;
    return 0;
}
