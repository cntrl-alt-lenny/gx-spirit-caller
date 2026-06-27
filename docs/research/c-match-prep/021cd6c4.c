/* CAMPAIGN-PREP candidate for func_021cd6c4 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: signed divmod as plain /C (smull magic), *0x30 index, masked-field store; preserve store order.
 *   risk:       struct-guessed: literal pool is TRUNCATED so the divide magics give unknown divisors (C1/C2/n2 are guesses) and the function tail past [base+0x204] is missing -- recover full asm before building.
 *   confidence: low
 */
/* func_ov004_021cd6c4 (ov004, class D): a 5-iteration setup loop using a signed
 * divide-by-constant (smull magic), then a second derived index via *0x30 and a
 * second signed divide, two Fill-style calls, and a masked field store.
 *
 * NOTE: source asm is TRUNCATED (608 bytes; ends at `ldr r0,[r4,#0x204]; mov
 * r1,#1`) AND its literal pool is cut, so the two divide-by-constant *magic
 * words are not available*. The signed divides are written as plain `/ C` per
 * the class-D recipe, but C1 (loop) and C2 (second block) are GUESSES
 * (C1=0x28, C2=0x40) -- they MUST be recovered from the full literal pool
 * (_LIT1 = magic for the loop smull; the second sequence's reciprocal is inline
 * shifts). _LIT2 (the rsb/and mask) taken as 0xff for the (g8c) negate-and-mask;
 * _LIT3 is the destination MMIO/global word. The tail after the store is a stub.
 *
 *   base = data_ov004_0220b500;
 *   for (i=0;i<5;i++) func_ov004_021cced8( (base[0xa4]-8)/C1 + i );
 *   q  = (base[0xa4]-8)/C1 + 5;
 *   n1 = (q*0x30)/C2;
 *   func_02094504(0, func_0208e0a0() + n1*0x40, 0x40);
 *   n2 = (n1+1)/...;  // second index, reciprocal inline (see note)
 *   func_02094504(0, func_0208e0a0() + n2*0x40, 0x40);
 *   func_ov004_021cd3b4();
 *   *(u32*)_LIT3 = ( (-base[0x8c]) & 0xff )
 *                | ( ((((base[0xa4]-0x20)<<24)>>8) & (0xff<<16)) );
 *   if (base[0x8c] <= 0x100 && base[0x98] >= 4)
 *       func_ov004_021ca0a4(base+0xf90+0x5000, 2, 0xe4, 0x22, 1, 8);  // 6 args
 *   ... TRUNCATED ... */
extern int  func_0208e0a0(void);
extern void func_02094504(int a, int dst, int size);
extern void func_ov004_021cced8(int v);
extern void func_ov004_021cd3b4(void);
extern void func_ov004_021ca0a4(void *p, int a, int b, int c, int d, int e);
extern unsigned char data_ov004_0220b500[];
extern unsigned char data_ov004_021cd6c4_lit3[];   /* placeholder: _LIT3 dest word */

void func_ov004_021cd6c4(void) {
    unsigned char *base = data_ov004_0220b500;
    int i;
    int q;
    int n1;
    int n2;
    unsigned int dst;
    int v;

    for (i = 0; i < 5; i++)
        func_ov004_021cced8((*(int *)(base + 0xa4) - 8) / 0x28 + i);

    q  = (*(int *)(base + 0xa4) - 8) / 0x28 + 5;
    n1 = (q * 0x30) / 0x40;
    func_02094504(0, func_0208e0a0() + n1 * 0x40, 0x40);

    n2 = (n1 + 1) / 0x8;          /* second reciprocal (inline shifts) -- GUESS */
    func_02094504(0, func_0208e0a0() + n2 * 0x40, 0x40);

    func_ov004_021cd3b4();

    v = ((*(int *)(base + 0xa4) - 0x20) << 24);
    dst = ((unsigned int)(-*(int *)(base + 0x8c)) & 0xff)
        | (((unsigned int)v >> 8) & (0xffu << 16));
    *(unsigned int *)data_ov004_021cd6c4_lit3 = dst;

    if (*(int *)(base + 0x8c) <= 0x100 && *(int *)(base + 0x98) >= 4) {
        func_ov004_021ca0a4(base + 0xf90 + 0x5000, 2, 0xe4, 0x22, 1, 8);
        /* ... source asm TRUNCATED here (reads [base+0x204], r1=1, ...) ... */
    }
}
