/* CAMPAIGN-PREP candidate for func_0222efec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: lsl/lsr field extracts; rsb 1-parity invert; signed (raw<<19)>>19 low13
 *   risk:       reshape-able (operand-order): rsb r1,r1,#1 maps to '1 - parity' (write that exact order, not ~parity&1). table index 'mov r0,r0,lsl#2;ldrh' is a halfword load at byte offset i*4 — addressing-mode match is the open question (struct-guessed stride).
 *   confidence: med
 */
/* func_ov002_0222efec (ov002, D) bitfield field-extracts, linear, rsb-invert arg.
 * Entity *e in r0; e->f0(+0),e->f2(+2),e->f4(+4) halfwords. A 6-bit field of f2
 * (bits[25:20]) compared to 0x23 gates an early call. Then a 1-bit field of f4
 * (bit18) early-returns. Then: 0223def4 result indexes halfword table data_022d0250
 * (<<2 -> word stride? it's ldrh at r0<<2), value decoded (x<<19)>>19 = low 13 bits,
 * passed to 0202b8f0; result + rsb-inverted parity -> 021df818. rsb r1,r1,#1 = 1-parity. */
typedef struct { unsigned short f0; unsigned short f2; unsigned short f4; } Ent;
extern unsigned char data_ov002_022d0250[];
extern int  func_0202b8f0(int x);
extern void func_ov002_021df818(void *e,int inv,int v);
extern int  func_ov002_021e276c(int p,int f0,int b,int c);
extern int  func_ov002_0223def4(void *e,int z);
int func_ov002_0222efec(Ent *e) {
    unsigned short f2 = e->f2;
    unsigned field6 = (f2 << 20) >> 26;
    if (field6 != 0x23) {
        func_ov002_021e276c((int)((f2 << 31) >> 31), (int)e->f0, 1, 0);
    }
    if (((e->f4 << 29) >> 31) != 0) return 0;
    {
        int i = func_ov002_0223def4((void *)e, 0);
        unsigned short raw = *(unsigned short *)(data_ov002_022d0250 + (i << 2));
        int v = func_0202b8f0((int)((raw << 19) >> 19));
        int parity = (e->f2 << 31) >> 31;
        func_ov002_021df818((void *)e, 1 - parity, v);
    }
    return 0;
}
