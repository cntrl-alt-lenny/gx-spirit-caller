/* CAMPAIGN-PREP candidate for func_02005910 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight call sequence + MMIO zero-store block (two bases)
 *   risk:       Scheduling of zero-stores vs +0x1000 bridge may reorder; reg for #0 const.
 *   confidence: med
 */
/* func_02005910: shutdown/reset sequence. 11 subsystem teardown calls,
 * then func_0208c7e4(1,0,0), func_0208c7c8(0), then zero a block of
 * display MMIO. r1 reaches 0x4001010 via +0x1000 from the 0x4000010 base;
 * 0x4001014 is a separate literal (engine B block).
 */
extern void func_0208cd88(void);
extern void func_0208cdc4(void);
extern void func_0208ce5c(void);
extern void func_0208cdb0(void);
extern void func_0208ce38(void);
extern void func_0208ce14(void);
extern void func_0208ce70(void);
extern void func_0208cd60(void);
extern void func_0208ce00(void);
extern void func_0208cdec(void);
extern void func_0208cdd8(void);
extern void func_0208c7e4(int a, int b, int c);
extern void func_0208c7c8(int a);

void func_02005910(void) {
    volatile int *b = (volatile int *)0x4001014;

    func_0208ce70();
    func_0208cdc4();
    func_0208ce5c();
    func_0208cdb0();
    func_0208ce38();
    func_0208ce14();
    func_0208cd88();
    func_0208cd60();
    func_0208ce00();
    func_0208cdec();
    func_0208cdd8();
    func_0208c7e4(1, 0, 0);
    func_0208c7c8(0);

    *(volatile int *)0x4000010 = 0;
    *(volatile int *)0x4000014 = 0;
    *(volatile int *)0x4000018 = 0;
    *(volatile int *)0x400001c = 0;
    *(volatile int *)0x4001010 = 0;
    b[0] = 0;
    b[1] = 0;
    b[2] = 0;
}
