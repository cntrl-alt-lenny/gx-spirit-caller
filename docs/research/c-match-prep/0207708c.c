/* CAMPAIGN-PREP candidate for func_0207708c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bare epilogue stub (not standalone-C)
 *   risk:       not a real C function; epilogue-only fragment — cannot byte-match in isolation
 *   confidence: low
 */
/* Bare epilogue stub: ldmia sp!,{r4, r5, r6, lr} ; bx lr.
   Epilogue-only fragment of a split routine whose frame saved r4-r6.
   Not a standalone C function; the real source is its parent. */
extern void func_0207708c(void);
