/* CAMPAIGN-PREP candidate for func_020285bc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dual symbol/raw-literal alias for same global; bind MMIO base, +0x1000 via io[0x400]
 *   risk:       struct-guessed AND reshape-able: orig keeps the symbol ptr (r4) and literal ptr (r0=0x0219a92c) in SEPARATE regs; if mwcc CSEs the two aliases to one base, the [r4]/[r0] split (ldr count vs store) collapses.
 *   confidence: low
 */
/* func_020285bc (main, class D): Fill32-zero a global, conditionally alloc a
 * Task buffer, then MMIO RMW + config calls. KEY idiom: the global at
 * 0x0219a92c is touched via TWO aliases - an extern SYMBOL (Fill32 dst, count
 * read, handle store) and a RAW LITERAL pointer (count store, handle gate) -
 * matching the .s comment 'bypasses patcher trim'. MMIO base 0x04000000 is
 * bound once; 0x04001000 reached as base+0x1000 (io[0x400]).
 * struct-guessed: handle@+0, count@+4. */
extern void Fill32(int value, void *dst, int words);
extern int  Task_PostLocked(int size, int a, int b);
extern int  func_02005bfc(int a);
extern int  func_0201d5c0(int a, int b);
extern int  func_0201e7e0(void);
extern int  func_020211a4(int a);

struct S0219a92c { int handle; int count; };
extern struct S0219a92c data_0219a92c;

int func_020285bc(int a0) {
    struct S0219a92c *lit = (struct S0219a92c *)0x0219a92c;  /* raw-literal alias */
    volatile unsigned *io;

    Fill32(0, &data_0219a92c, 8);
    lit->count = a0;
    if (lit->handle == 0) {
        int n = data_0219a92c.count * 0x19c;
        data_0219a92c.handle = Task_PostLocked(n, 4, 0);
        Fill32(0, (void *)data_0219a92c.handle, n);
    }
    if (func_020211a4(0)) {
        io = (volatile unsigned *)0x04000000;
        io[0]     = (io[0]     & 0xFFCFFFEFu) | 0x10 | 0x200000;
        io[0x400] = (io[0x400] & 0xFFCFFFEFu) | 0x10 | 0x200000;
        func_0201d5c0(4, 2);
        func_0201d5c0(9, 2);
        func_0201e7e0();
        func_02005bfc(1);
        func_02005bfc(2);
    }
    return 1;
}
