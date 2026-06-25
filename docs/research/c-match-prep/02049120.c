/* CAMPAIGN-PREP candidate for func_02049120 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + find-loop + bound-global reload + accessor f14
 *   risk:       g->f14 reload placement / r5-vs-r6 reg-alloc on i,arg may flip
 *   confidence: med
 */
/* func_02049120: if global or arg null -> -1; scan i in [0,g->f14):
 * if arg == func_0204918c(i) return i; else -1. Global base held in a reg
 * and reloaded ([r4]) each use; count g->f14 reloaded inside the loop. */

typedef struct {
    char _pad[0x14];
    int  count; /* +0x14 */
} State02049120;

extern State02049120 *data_0219dc80;
extern int func_0204918c(int idx);

int func_02049120(int key) {
    int i;
    if (data_0219dc80 == 0) return -1;
    if (key == 0) return -1;
    if (data_0219dc80->count <= 0) return -1;
    i = 0;
    do {
        if (key == func_0204918c(i)) return i;
        i++;
    } while (i < data_0219dc80->count);
    return -1;
}
