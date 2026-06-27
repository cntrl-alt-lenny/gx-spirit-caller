/* CAMPAIGN-PREP candidate for func_021beec4 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: two strh RMW in asm order on 0x0400100e; 0x30000 bound to a local materialised before the RMWs; literal call chain
 *   risk:       reshape-able: orig does mov r1,#0x30000 BEFORE the two RMW stores and keeps it in r1 until str [reg+0xe]; if mwcc materialises the const late the instruction order (and a reg) shifts. Otherwise high-confidence linear.
 *   confidence: med
 */
/* func_ov006_021beec4: bring up a 2D display path — reprogram a DISPCNT-class
 * MMIO register (two read-modify-writes plus a 0x30000 control word), then run
 * a fixed init chain (clear two VRAM regions, configure the arg object twice,
 * load a palette). Returns 1. (class D: MMIO store-order.) */
extern char data_020b4728[];
extern void *func_0208df94(void);
extern void *func_0208dd9c(void);
extern int  func_02094504(int a, void *b, int c);
extern void func_02001d0c(void *p, int a, int b);
extern void func_02001e94(void *p, void *a, int b, int c);
extern void func_0208ff84(void *a, int b, int c);

int func_ov006_021beec4(char *obj) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100e;
    int ctrl = 0x30000;
    void *q;

    *reg = (*reg & ~3) | 2;
    *reg = (*reg & 0x43) | 0x218 | 0x400;
    *(volatile int *)((char *)reg + 0xe) = ctrl;

    q = func_0208df94();
    func_02094504(0, q, 0x640);
    func_02001d0c(obj + 4, 0x20, 0x19);
    q = func_0208df94();
    func_02001e94(obj + 4, q, 2, 1);
    q = func_0208dd9c();
    func_02094504(0, (char *)q + 0x40, 0x6400);
    func_0208ff84(data_020b4728, 0x20, 0x20);
    return 1;
}
