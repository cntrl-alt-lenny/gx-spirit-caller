/* CAMPAIGN-PREP candidate for func_021b23b4 (ov016, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scan loop (dead result) + tail call to sorter
 *   risk:       the loop's count result is unused in asm -> hard to keep mwcc from optimizing it away; tail-call arg is a data symbol, scan side-effect-free
 *   confidence: low
 */
/* func_ov016_021b23b4: count occupied rows, then (re)sort the table.
 *   for (i = 0; i < 0x3c; i++) if (!recs[i].f8c) break;   // first empty
 *   return func_ov016_021b22d8(data_ov016_021b9784, ...);  // tail call
 * The asm computes the scan count (r1) but DISCARDS it at the tail bx,
 * passing data_ov016_021b9784 in r0. Reproduced faithfully; the dead
 * scan is fragile under -O4 (may be elided). */

extern char data_ov016_021b9740[];   /* record array, stride 0x54, +0x8c field */
extern char data_ov016_021b9784[];   /* sort base arg */
extern int  func_ov016_021b22d8(char *base);

int func_ov016_021b23b4(void) {
    char *r = data_ov016_021b9740;
    int   i = 0;
    while (*(int *)(r + 0x8c) != 0) {
        i++;
        if (i >= 0x3c) break;
        r += 0x54;
    }
    return func_ov016_021b22d8(data_ov016_021b9784);
}
