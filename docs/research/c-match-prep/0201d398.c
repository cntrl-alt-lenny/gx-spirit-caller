/* CAMPAIGN-PREP candidate for func_0201d398 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Global set + reuse-address-as-arg + linear call sequence (fn-ptr args)
 *   risk:       func_02020814 taking &data_020c5db0 (r0 reuse) is inferred; if it takes the value, emits an ldr instead.
 *   confidence: med
 */
/* func_0201d398: straight-line init sequence.
 *   data_020c5db0 = 1; func_02020814(&data_020c5db0); (r0 reused as ptr)
 *   func_0209e8d0(func_0201c9b0);
 *   func_02020b24(func_0201cf54);
 *   func_0200583c(func_0201ce94);
 *   func_0202042c(0x306);
 *   func_02092844(data_0218fedc);
 *   func_02092844(data_0218fef4);
 *   func_0201d07c();
 */

extern int data_020c5db0;
extern char data_0218fedc[];
extern char data_0218fef4[];
extern void func_0201c9b0(void);
extern void func_0201cf54(void);
extern void func_0201ce94(void);
extern void func_0201d07c(void);
extern void func_0200583c(void *fp);
extern void func_02020814(int *p);
extern void func_02020b24(void *fp);
extern void func_0202042c(int x);
extern void func_02092844(void *p);
extern void func_0209e8d0(void *fp);

void func_0201d398(void) {
    data_020c5db0 = 1;
    func_02020814(&data_020c5db0);
    func_0209e8d0(func_0201c9b0);
    func_02020b24(func_0201cf54);
    func_0200583c(func_0201ce94);
    func_0202042c(0x306);
    func_02092844(data_0218fedc);
    func_02092844(data_0218fef4);
    func_0201d07c();
}
