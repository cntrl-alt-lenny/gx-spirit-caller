/* CAMPAIGN-PREP candidate for func_02067a4c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order field init + count-up index / count-down value loop
 *   risk:       loop may strength-reduce or fuse the v-- into 0xff-i; descending-value temp could move to a different reg
 *   confidence: med
 */
/* func_02067a4c — init 5 prime-ish bytes then descending fill.
 * Five immediate byte stores at +0x100..+0x104 (1,3,5,7,0xb), then a
 * loop i in [0,0x100): p[i] = 0xff - i  (r1 starts 0xff, decremented
 * each iteration, stored at p+i). Store the five fields in asm order;
 * the fill is a count-up index with a count-down value.
 */
void func_02067a4c(unsigned char *p) {
    int i;
    unsigned char v;

    p[0x100] = 1;
    p[0x101] = 3;
    p[0x102] = 5;
    p[0x103] = 7;
    p[0x104] = 0xb;

    v = 0xff;
    for (i = 0; i < 0x100; i++) {
        p[i] = v;
        v--;
    }
}
