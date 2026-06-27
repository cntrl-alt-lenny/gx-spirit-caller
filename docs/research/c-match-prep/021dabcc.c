/* CAMPAIGN-PREP candidate for func_021dabcc (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     base bound in r4; explicit store-order 0x74/0x7c/0x78; buf[0] reloaded each test
 *   risk:       orig materializes the (0x43,-1)/(0x3a,-1) arg pair as `mov r0,#A; sub r1,r0,#A-B`; mwcc may emit mvn instead. reshape-able (mwcc const-gen, usually matches).
 *   confidence: med
 */
/* func_ov004_021dabcc: query a value via 021dabc0 into a stack buffer, then
 * branch on it. <0xfa0 -> reset four base fields; else if helper>=3 tail-call
 * 02037208(0x43,-1,...) and return; else write two globals + base[0x48]=4.
 * Both fall-throughs tail-return 02037208(0x3a,-1,0,1). */
extern char data_ov004_0220b500[];
extern char data_02104dac[];
extern char data_021040ac[];
extern void func_ov004_021dabc0(void *p, void *out);
extern int  func_0202b9ec(void);
extern int  func_02037208(int, int, int, int);

int func_ov004_021dabcc(void *param) {
    char *base = data_ov004_0220b500;
    int buf[8];
    func_ov004_021dabc0(param, buf);
    if ((unsigned int)buf[0] < 0xfa0) {
        *(int *)(base + 0x88) = (int)param;
        *(int *)(base + 0x74) = 0;
        *(int *)(base + 0x7c) = 0;
        *(int *)(base + 0x78) = 0;
    } else {
        if (func_0202b9ec() >= 3)
            return func_02037208(0x43, -1, 0, 1);
        *(short *)(data_02104dac + 0x60) = (short)buf[0];
        *(int *)(data_021040ac + 0xd54) = 3 - func_0202b9ec();
        *(int *)(base + 0x48) = 4;
    }
    return func_02037208(0x3a, -1, 0, 1);
}
