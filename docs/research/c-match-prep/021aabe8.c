/* CAMPAIGN-PREP candidate for func_021aabe8 (ov022, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     MMIO bic/orr store-order verbatim; halfword strh ordering 0x8..0xe then data_02104f4c[0..3]; movmi guard
 *   risk:       struct-guessed + truncated: the literal-pool base->global mapping (_LIT0..5 to which data_* base) and field offsets (0x54/0xc/0x8) are inferred from usage; asm cut off after the bne .L_668 second-0208c884 block. MMIO strh order is reshape-able if it slips. Confirm pools.
 *   confidence: low
 */
/* func_ov022_021aabe8: program both 2D engine BG control + priority regs, kick
 * a fade (0208c940), bump a fade counter, scroll via 020b3870, push offset to
 * two channels (0208c884). MMIO read-modify-write block = strict store-order.
 * asm truncated after the first 0208c884 pair / the bne .L_668 branch. */
extern unsigned char data_02104f4c[];
extern unsigned char data_ov022_021ab8a8[];
extern unsigned char data_ov022_021ab8e4[];
extern unsigned char data_ov022_021ab8fe[];
extern unsigned char data_ov022_021abaa0[];
extern unsigned char data_ov022_021abae8[];
extern void func_0208c884(int chan, int val);
extern void func_0208c940(void);
extern int  func_020b3870(int a, int b);

void func_ov022_021aabe8(void) {
    volatile unsigned int *eng = (volatile unsigned int *)0x4000000;
    volatile unsigned int *eng2 = (volatile unsigned int *)0x4001000;
    volatile unsigned short *p = (volatile unsigned short *)data_02104f4c;
    int s;
    eng[0] = (eng[0] & ~0x1f00) | 0x100;
    eng2[0] = (eng2[0] & ~0x1f00) | 0x100;
    ((volatile unsigned short *)eng)[4] = (((volatile unsigned short *)eng)[4] & ~3) | 3;
    ((volatile unsigned short *)eng)[5] &= ~3;
    ((volatile unsigned short *)eng)[6] = (((volatile unsigned short *)eng)[6] & ~3) | 1;
    ((volatile unsigned short *)eng)[7] = (((volatile unsigned short *)eng)[7] & ~3) | 2;
    p[0] &= ~3;
    p[1] = (p[1] & ~3) | 1;
    p[2] = (p[2] & ~3) | 2;
    p[3] = (p[3] & ~3) | 3;
    func_0208c940();
    *(int *)data_ov022_021ab8a8 |= 0x10000;
    *(int *)(data_ov022_021ab8e4 + 0x54) -= 0x1000;
    if (*(int *)(data_ov022_021ab8e4 + 0x54) < 0)
        *(int *)(data_ov022_021ab8fe + 0xc) = 0;
    s = func_020b3870(-(*(int *)(data_ov022_021ab8fe + 0xc) << 4),
                       *(int *)(data_ov022_021ab8fe + 0x8));
    func_0208c884((int)data_ov022_021abaa0, s);
    func_0208c884((int)data_ov022_021abae8, s);
    if (*(int *)(data_ov022_021ab8fe + 0xc) == 0) {
        func_0208c884((int)data_ov022_021abaa0, 0);
        func_0208c884((int)data_ov022_021abae8, 0);
        /* truncated tail after `ldr r1, _LIT3` */
    }
}
