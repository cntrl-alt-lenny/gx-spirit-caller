/* CAMPAIGN-PREP candidate for func_021d8648 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: emit reg RMW + struct fields in exact asm order; volatile u16 MMIO
 *   risk:       literal pool cut: which data_ sym is _LIT0(reg base)/_LIT2/4(ids)/_LIT5/6 and the (LIT1-0x200) OR constant are guessed; descriptor field offsets inferred. struct-guessed.
 *   confidence: low
 */
/* func_ov004_021d8648: reconfigure two adjacent 16-bit control regs (RMW), then
 * build a stack descriptor twice (handle from func_02006c0c, ptr data_020b4728,
 * size 0x40, flag word RMW'd to 6 then 9) and hand it to func_0201e5b8, releasing
 * the handle via func_02006e1c each pass; finally func_02094550(dst,src,0x20) and
 * clear self+0x18. cls D: MMIO bitfield RMW store-order + stack-struct fills.
 * ** literal pool truncated in source .s: _LIT* symbol assignment is INFERRED
 *    from the .extern list — confirm against the real relocs. **
 */
#include "ov004_core.h"
extern char data_020b4728[];
extern char data_ov004_0220a110[];
extern char data_ov004_0220a12c[];
extern int  func_02006c0c(int a, int b, int c);
extern void func_02006e1c(int h);
extern void func_0201d47c(void *p);
extern void func_0201e5b8(void *p);
extern void func_02094550(void *dst, void *src, int n);

/* stack descriptor consumed by func_0201e5b8 (fields by asm store offset) */
struct desc {
    int   handle;          /* +0x00 */
    int   _pad04;          /* +0x04 */
    int   size_minus;      /* +0x08 */
    void *ptr;             /* +0x0c */
    short v10;             /* +0x10 */
    short _pad12;          /* +0x12 */
    unsigned short flags;  /* +0x14 */
};

int func_ov004_021d8648(char *self) {
    struct desc d;
    volatile unsigned short *reg = (volatile unsigned short *)data_ov004_0220a110;
    unsigned short t;

    /* reg[0] RMW: keep bits 0x43, set 0x218|0x8000 */
    reg[0] = (reg[0] & 0x43) | 0x218 | 0x8000;
    /* reg[0] RMW: clear low 2 bits, set bit0 */
    reg[0] = (reg[0] & ~3) | 1;
    /* reg[-1] RMW: keep 0x43, OR in (LIT1-0x200) [pool cut -> 0 placeholder] */
    reg[-1] = (reg[-1] & 0x43) | 0;
    reg[-1] = reg[-1] & ~3;

    func_0201d47c(&d);

    /* pass 1 */
    d.handle = func_02006c0c((int)data_ov004_0220a12c, 4, 0);
    d.ptr = data_020b4728;
    t = d.flags;
    d.flags = (t & ~0xf) | 6;
    d.flags = d.flags & ~0x10;
    d.v10 = 0x40;
    d.size_minus = 0x40 - 0x41;            /* = -1 */
    func_0201e5b8(&d);
    func_02006e1c(d.handle);

    /* pass 2 */
    func_0201d47c(&d);
    d.handle = func_02006c0c((int)data_ov004_0220a12c, 4, 0);
    d.ptr = (void *)0;
    d.v10 = 0;
    t = d.flags;
    d.flags = (t & ~0xf) | 9;
    d.flags = d.flags & ~0x10;
    func_0201e5b8(&d);
    func_02006e1c(d.handle);

    func_02094550(data_ov004_0220a110, data_ov004_0220a12c, 0x20);
    *(int *)(self + 0x18) = 0;
    return 1;
}
