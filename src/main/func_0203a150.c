/* CAMPAIGN-PREP candidate for func_0203a150 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null guard; ordered stores; short-circuit ||; stmib pair
 *   risk:       two trailing word stores may emit as 2x str instead of stmib; struct offsets guessed
 *   confidence: med
 */
/* func_0203a150 - clear+flag a record then write two adjacent words via stmib */

typedef struct {
    int           f0;     /* +0x00 */
    int           f4;     /* +0x04 */
    int           f8;     /* +0x08 */
    char          pad0[8];/* +0x0c */
    int           f14;    /* +0x14 */
    char          pad1[0x40]; /* +0x18 */
    unsigned char f58;    /* +0x58 */
} St;

void func_0203a150(St *p, int a, int b)
{
    if (p == 0)
        return;

    p->f0 = 0;
    p->f58 = 2;
    if (p->f14 == 0xffff || (b & 0x8000))
        p->f58 = 1;
    p->f4 = a;
    p->f8 = b;
}
