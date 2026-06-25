/* CAMPAIGN-PREP candidate for func_0205272c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-buffer init+memcmp, eq-guard returns u16, else 0
 *   risk:       func_02094688 sig (memset vs init); buf size 8 vs frame 0xc and the +4/+6 offsets are reconstructed from the loads.
 *   confidence: med
 */
extern unsigned char data_020ffa98[];
extern void func_02094688(void *dst, int fill, int n);
extern int func_020a7440(const void *a, const void *b, int n);

unsigned short func_0205272c(void) {
    unsigned char buf[8];
    func_02094688(buf, 0, 8);
    if (func_020a7440(buf + 6, data_020ffa98, 2) == 0) {
        return *(unsigned short *)(buf + 4);
    }
    return 0;
}
