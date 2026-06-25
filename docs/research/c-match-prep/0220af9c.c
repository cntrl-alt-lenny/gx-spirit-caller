/* CAMPAIGN-PREP candidate for func_0220af9c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield extract + guard early-returns + tail call
 *   risk:       5th stack-arg slot and bf-load scheduling vs the two ldrh may reorder
 *   confidence: med
 */
/* func_ov002_0220af9c — three-call guard chain, 5th stack arg */

typedef struct Entity {
    unsigned short field0;          /* 0x0 */
    unsigned short a : 1;           /* 0x2 bit0 */
    unsigned short b : 5;           /* 0x2 bits1..5 */
    unsigned short c : 6;           /* 0x2 bits6..11 */
    unsigned short   : 4;
    unsigned short   : 6;           /* 0x4 */
    unsigned short d : 9;           /* 0x4 bits6..14 */
    unsigned short   : 1;
} Entity;

extern int func_ov002_021ff14c(int a, int b, int c, int d, int e);
extern int func_ov002_021ff320(Entity *p, int arg);
extern int func_ov002_021ff400(Entity *p, int arg);

int func_ov002_0220af9c(Entity *p, int arg)
{
    if (func_ov002_021ff14c(p->a, 1, p->d, 0, 1) == 0)
        return 0;
    if (func_ov002_021ff320(p, arg) == 0)
        return 0;
    return func_ov002_021ff400(p, arg);
}
