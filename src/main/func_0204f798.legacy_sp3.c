/* CAMPAIGN-PREP candidate for func_0204f798 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two guard+free blocks (RELOAD global) + byte clears, store-order
 *   risk:       struct field offsets for the 3 globals guessed; func_0204548c arg shape (4,?,0) assumed; sp3 routing
 *   confidence: med
 */
/* func_0204f798 -> src/main/func_0204f798.legacy_sp3.c (mwcc 1.2/sp3: push{lr}+sub sp,#4+pop{pc}) */
extern int  data_0219dc84;
extern unsigned char data_0219dc8c;   /* 2 bytes cleared at +0,+1 */
extern int  data_0219dc90;
extern void func_02049900(int);
extern void func_0204548c(int, int, int);
extern void func_0204b370(void);

void func_0204f798(void) {
    func_02049900(0);
    if (data_0219dc90 != 0) {
        func_0204548c(4, /*r1 leftover*/ data_0219dc90, 0);
        data_0219dc90 = 0;
    }
    func_0204b370();
    if (data_0219dc84 != 0) {
        func_0204548c(4, data_0219dc84, 0);
        data_0219dc84 = 0;
    }
    (&data_0219dc8c)[0] = 0;
    (&data_0219dc8c)[1] = 0;
}
