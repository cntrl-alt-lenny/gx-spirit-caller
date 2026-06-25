/* CAMPAIGN-PREP candidate for func_0203e254 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     small switch (cmp;beq) to Fill32/calls, store-order strb, ldrb return
 *   risk:       3-case switch must stay cmp;beq not jump table; store order (0xd10 before 0xd0f in case1) must hold; final ldrb => base typed char*; Fill32 arg order.
 *   confidence: med
 */
/* func_0203e254: mode dispatch (0/1/2) over base=func_0203c900(0x10),
 * then return base[0xd10] (ldrb). 3 cases -> cmp;beq chain.
 */
extern char *func_0203c900(int sel);
extern void Fill32(int value, void *dst, int n);
extern int  func_0203deac(void *base);
extern int  func_0203def0(void);
extern int  func_0203e0a0(void *base);
extern int  func_0203e198(void *base);

int func_0203e254(int mode)
{
    char *base = func_0203c900(0x10);
    switch (mode) {
    case 0:
        Fill32(0, base + 0x300, 0x144);
        base[0xd10] = func_0203e198(base);
        break;
    case 1:
        base[0xd10] = func_0203def0();
        base[0xd0f] = func_0203deac(base);
        break;
    case 2:
        Fill32(0, base + 0x300, 0x144);
        base[0xd0f] = 0;
        base[0xd10] = func_0203e0a0(base);
        break;
    }
    return (unsigned char)base[0xd10];
}
