/* CAMPAIGN-PREP candidate for func_0204f724 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two guard+free blocks (RELOAD global) + byte clears, store-order
 *   risk:       struct field offsets for the 3 globals guessed; func_0204543c arg shape (4,?,0) assumed; sp3 routing
 *   confidence: med
 */
/* func_0204f724 -> src/main/func_0204f724.legacy_sp3.c (mwcc 1.2/sp3: push{lr}+sub sp,#4+pop{pc}) */
extern int  data_0219dba4;
extern unsigned char data_0219dbac;   /* 2 bytes cleared at +0,+1 */
extern int  data_0219dbb0;
extern void func_0204988c(int);
extern void func_0204543c(int, int, int);
extern void func_0204b2fc(void);

void func_0204f724(void) {
    func_0204988c(0);
    if (data_0219dbb0 != 0) {
        func_0204543c(4, /*r1 leftover*/ data_0219dbb0, 0);
        data_0219dbb0 = 0;
    }
    func_0204b2fc();
    if (data_0219dba4 != 0) {
        func_0204543c(4, data_0219dba4, 0);
        data_0219dba4 = 0;
    }
    (&data_0219dbac)[0] = 0;
    (&data_0219dbac)[1] = 0;
}
