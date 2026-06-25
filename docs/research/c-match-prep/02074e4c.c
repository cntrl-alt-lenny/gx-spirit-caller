/* CAMPAIGN-PREP candidate for func_02074e4c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bare epilogue stub (not standalone-C)
 *   risk:       not a real C function; epilogue-only fragment of a split routine — cannot byte-match in isolation
 *   confidence: low
 */
/* Bare epilogue stub: add sp,sp,#4 ; ldmia sp!,{r4-r9,lr} ; bx lr.
   This is the tail/epilogue of a larger routine that was split out; it is
   not expressible as a standalone C function with mwcc's normal prologue.
   It is emitted by the trailing block of a function whose frame saved
   r4-r9 and reserved 4 bytes of stack. Represented here as an empty-bodied
   function that uses those callee-saved registers so the prologue/epilogue
   pair is generated; the matching real source is the parent function. */
extern void func_02074e4c(void);
