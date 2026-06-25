/* CAMPAIGN-PREP candidate for func_0207391c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ bracket + reload-each-use counter accumulate (counter-first) + unsigned wrap (.legacy.c)
 *   risk:       Reload-vs-bind of data_0219eefc (orig loads it 3x) may CSE; byte-offset halfword index vs scaled may differ; signed/unsigned of the >= compare; sp2p3.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0207391c (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_0207391c.legacy.c
 * (mwcc 1.2/sp2p3): stmdb{lr}+sub sp,#4 + 2-step (ldmia{lr}; bx lr)
 * epilogue => Style A .legacy.c.
 *   recipe:     IRQ-bracketed counter accumulate (counter-first add) +
 *               unsigned >= wrap-to-0; RELOAD each global use (no bind)
 */
/* func_0207391c: old = OS_DisableIrq();
 *   data_0219eefc += *(u16*)((char*)data_0219ef24 + data_0219eefc);
 *   if (data_0219eefc >= data_0219ef28) data_0219eefc = 0;
 *   OS_RestoreIrq(old).
 * data_0219ef24 holds a pointer to a u16 table; index is a BYTE offset. */

typedef int OSIntrMode;

extern int             data_0219eefc;   /* counter (reloaded each use) */
extern unsigned short *data_0219ef24;   /* -> u16 table, byte-indexed */
extern int             data_0219ef28;   /* wrap limit */
extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode old);

void func_0207391c(void) {
    OSIntrMode old = OS_DisableIrq();
    data_0219eefc = data_0219eefc +
        *(unsigned short *)((char *)data_0219ef24 + data_0219eefc);
    if ((unsigned)data_0219eefc >= (unsigned)data_0219ef28)
        data_0219eefc = 0;
    OS_RestoreIrq(old);
}
