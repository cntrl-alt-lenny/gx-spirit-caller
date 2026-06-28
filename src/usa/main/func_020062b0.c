/* CAMPAIGN-PREP candidate for func_020062b0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line init calls + volatile u16 read-discard then store (IME)
 *   risk:       Dead volatile ldrh at 0x4000208 may not emit unless typed volatile; arg order.
 *   confidence: med
 */
/* func_020062b0: init sequence. func_020906cc(1, func_02006508) installs a
 * callback, then two func_0209053c calls, func_0208c8ec(1), then a volatile
 * read of IME (0x4000208, result discarded) followed by writing 1, then
 * func_020936a8().
 */
extern void func_02006508(void);
extern void func_0208c8ec(int a);
extern void func_0209053c(int a);
extern void func_020906cc(int a, void *cb);
extern void func_020936a8(void);

void func_020062b0(void) {
    volatile unsigned short *ime = (volatile unsigned short *)0x4000208;

    func_020906cc(1, func_02006508);
    func_0209053c(0x40000);
    func_0209053c(1);
    func_0208c8ec(1);

    *ime;
    *ime = 1;
    func_020936a8();
}
