/* CAMPAIGN-PREP candidate for func_0208c98c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind MMIO read once; clear global; store shifted field; write-back
 *   risk:       store scheduling of the two strh and the bic write-back may reorder; mwcc may reload DISPCNT instead of holding it
 *   confidence: low
 */
/* func_0208c98c: read DISPCNT once, clear data_02102498, store the
 * extracted DISPMODE field to data_021a6300, then write DISPCNT back
 * with that field cleared.
 *
 *     v = *(u32*)0x04000000;
 *     *(u16*)data_02102498 = 0;
 *     *(u16*)data_021a6300 = (v & 0x30000) >> 16;
 *     *(u32*)0x04000000 = v & ~0x30000;
 */

extern unsigned short data_02102498;
extern unsigned short data_021a6300;

void func_0208c98c(void) {
    volatile unsigned int *dispcnt = (volatile unsigned int *)0x04000000;
    unsigned int v = *dispcnt;

    data_02102498 = 0;
    data_021a6300 = (unsigned short)((v & 0x30000) >> 16);
    *dispcnt = v & ~0x30000;
}
