/* CAMPAIGN-PREP candidate for func_0204965c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + dual SETTER (f44,f48) + bound-global reload, return 0/1
 *   risk:       field offsets guessed; arg-store order f44 then f48 must match
 *   confidence: high
 */
/* func_0204965c: if global null return 0; else g->f44 = a0; g->f48 = a1;
 * return 1. Global reloaded between the two stores (ldrne r2,[r2]). */

typedef struct {
    char _pad[0x44];
    int  f44; /* +0x44 */
    int  f48; /* +0x48 */
} State0204965c;

extern State0204965c *data_0219dc80;

int func_0204965c(int a0, int a1) {
    if (data_0219dc80 == 0) return 0;
    data_0219dc80->f44 = a0;
    data_0219dc80->f48 = a1;
    return 1;
}
