/* CAMPAIGN-PREP candidate for func_02085864 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT STORE-ORDER (constant stores)
 *   risk:       asm stores 0x1000 at 0x00 then 0x14 before zeros, and zeros 0x10 last; source order here matches but scheduler may reorder the two 0x1000 stores; offsets guessed.
 *   confidence: med
 */
/* func_02085864: struct init, constant stores in asm order. */
struct init_85864 {
    int f00;   /* +0x00 = 0x1000 */
    int f04;   /* +0x04 = 0 */
    char pad08[0x10 - 0x08];
    int f10;   /* +0x10 = 0 */
    int f14;   /* +0x14 = 0x1000 */
    char pad18[0x30 - 0x18];
    int f30;   /* +0x30 = 0 */
    int f34;   /* +0x34 = 0 */
};

void func_02085864(struct init_85864 *p) {
    p->f00 = 0x1000;
    p->f04 = 0;
    p->f10 = 0;
    p->f14 = 0x1000;
    p->f30 = 0;
    p->f34 = 0;
}
