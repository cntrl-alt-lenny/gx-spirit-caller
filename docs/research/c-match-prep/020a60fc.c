/* CAMPAIGN-PREP candidate for func_020a60fc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     CpuSet fill from stack-zero, then store call result as halfword
 *   risk:       stack-local zero materialization vs &local addr; data_021a9938 +0x2 halfword offset guessed
 *   confidence: med
 */
/* func_020a60fc: CpuSet-fill data_021a9938 with one zero word, then store
 * func_02090868() into data_021a9938->f2 (halfword). sp2p3 (.legacy.c).
 *
 *   int z = 0;
 *   CpuSet(&z, data_021a9938, 0x05000001);   ; fill, 32-bit, count 1
 *   data_021a9938->f2 = (u16)func_02090868();
 */

extern void CpuSet(const void *src, void *dst, unsigned int lenMode);
extern int  func_02090868(void);

typedef struct {
    unsigned short f0;   /* +0x0 */
    unsigned short f2;   /* +0x2 */
} data_021a9938_t;
extern data_021a9938_t data_021a9938;

void func_020a60fc(void) {
    int z = 0;
    CpuSet(&z, &data_021a9938, 0x05000001);
    data_021a9938.f2 = (unsigned short)func_02090868();
}
