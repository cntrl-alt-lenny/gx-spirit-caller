/* CAMPAIGN-PREP candidate for func_0200592c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight call sequence + MMIO zero-store block (two bases)
 *   risk:       Scheduling of zero-stores vs +0x1000 bridge may reorder; reg for #0 const.
 *   confidence: med
 */
/* func_0200592c: shutdown/reset sequence. 11 subsystem teardown calls,
 * then func_0208c8cc(1,0,0), func_0208c8b0(0), then zero a block of
 * display MMIO. r1 reaches 0x4001010 via +0x1000 from the 0x4000010 base;
 * 0x4001014 is a separate literal (engine B block).
 */
extern void func_0208cf58(void);
extern void func_0208ceac(void);
extern void func_0208cf44(void);
extern void func_0208ce98(void);
extern void func_0208cf20(void);
extern void func_0208cefc(void);
extern void func_0208ce70(void);
extern void func_0208ce48(void);
extern void func_0208cee8(void);
extern void func_0208ced4(void);
extern void func_0208cec0(void);
extern void func_0208c8cc(int a, int b, int c);
extern void func_0208c8b0(int a);

void func_0200592c(void) {
    volatile int *a = (volatile int *)0x4000010;
    volatile int *b = (volatile int *)0x4001014;

    func_0208cf58();
    func_0208ceac();
    func_0208cf44();
    func_0208ce98();
    func_0208cf20();
    func_0208cefc();
    func_0208ce70();
    func_0208ce48();
    func_0208cee8();
    func_0208ced4();
    func_0208cec0();
    func_0208c8cc(1, 0, 0);
    func_0208c8b0(0);

    a[0] = 0;
    a[1] = 0;
    a[2] = 0;
    a[3] = 0;
    *(volatile int *)((char *)a + 0x1000) = 0;
    b[0] = 0;
    b[1] = 0;
    b[2] = 0;
}
