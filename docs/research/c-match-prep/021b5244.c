/* CAMPAIGN-PREP candidate for func_021b5244 (ov016, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mla-scan loop, early-return-on-hit; movne bool
 *   risk:       mla base/stride fusion (i+1)*10+base and the r4=stride/r5=base/r6=i register split may differ; record stride 10 guessed
 *   confidence: med
 */
/* func_ov016_021b5244: probe records[1..14], return 1 on first 'active'.
 *   for (i = 0; i < 14; i++)
 *       if (func_ov016_021b28f4(&recs[i + 1])) return 1;   // stride 10
 *   return 0;
 * Loop probes index i+1 (mla (i+1)*10 + base). movne r0,#1 = the bool. */

extern char data_ov016_021b9184[];   /* record array, stride 10 */
extern int  func_ov016_021b28f4(char *rec);

int func_ov016_021b5244(void) {
    int i;
    for (i = 0; i < 14; i++) {
        if (func_ov016_021b28f4(data_ov016_021b9184 + (i + 1) * 10) != 0)
            return 1;
    }
    return 0;
}
