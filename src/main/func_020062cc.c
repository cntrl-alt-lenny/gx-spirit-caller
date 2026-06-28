/* CAMPAIGN-PREP candidate for func_020062cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line init calls + volatile u16 read-discard then store (IME)
 *   risk:       Dead volatile ldrh at 0x4000208 may not emit unless typed volatile; arg order.
 *   confidence: med
 */
/* func_020062cc: init sequence. func_020907b4(1, func_02006524) installs a
 * callback, then two func_02090624 calls, func_0208c9d4(1), then a volatile
 * read of IME (0x4000208, result discarded) followed by writing 1, then
 * func_02093790().
 */
extern void func_02006524(void);
extern void func_0208c9d4(int a);
extern void func_02090624(int a);
extern void func_020907b4(int a, void *cb);
extern void func_02093790(void);

void func_020062cc(void) {
    volatile unsigned short *ime = (volatile unsigned short *)0x4000208;

    func_020907b4(1, func_02006524);
    func_02090624(0x40000);
    func_02090624(1);
    func_0208c9d4(1);

    *ime;
    *ime = 1;
    func_02093790();
}
