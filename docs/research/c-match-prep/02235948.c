/* CAMPAIGN-PREP candidate for func_02235948 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     packed col/coord decode; record base+0x868*b0+col*20+0x30; cmp-chain state switch; store-order
 *   risk:       struct-guessed: the cf1a4 mask read addressing (ldrh [cf16c_base, cf1a4+parityOff]) is ambiguous in asm and likely mis-modeled; record coord widths inferred. Confirm both tables' bases/offsets.
 *   confidence: low
 */
/* func_ov002_02235948 (ov002, class D): validate packed cell (offset 2 col / offset 4
 * coord) against the 0x868 cf16c record, then a sub-state switch on g+0x5a8
 * (0x7e/0x7f/0x80). Record decode = JPN 021e770c style (base+0x868*parity+0x30+col*20). */
typedef unsigned short u16;

struct Self02235948 {
    u16 f0;            /* +0 (unused here) */
    u16 packed2;       /* +2: bit0, col=bits[6:2] (<<0x1a>>0x1b) */
    u16 packed4;       /* +4: coord=bits via <<0x11>>0x17 (9-bit) */
};

extern char data_ov002_022cd744[];   /* _LIT5 g2: +0xd44 */
extern char data_ov002_022ce288[];   /* _LIT3 g: +0x5a8 */
extern char data_ov002_022cf16c[];   /* _LIT1 record base */
extern char data_ov002_022cf1a4[];   /* _LIT2 mask table */
extern char data_ov002_022d016c[];   /* _LIT4 */
extern char data_ov002_022d0e6c[];   /* _LIT6 */
extern int  func_ov002_021b00d0(int a);
extern void func_ov002_021ae664(int a);
extern void func_ov002_021d93e0(int a, int b);
extern void func_ov002_0226b22c(int a, int b, int c);

int func_ov002_02235948(struct Self02235948 *self) {
    int b0 = self->packed2 << 31 >> 31 & 1;        /* r0 then r3=&1 */
    int col = (self->packed2 << 26) >> 27;          /* r1 col */
    int parityOff = b0 * 0x868;                     /* r2 = mul */
    int coord = (self->packed4 << 17) >> 23;        /* r5 query coord */
    char *recBase = data_ov002_022cf16c + parityOff + col * 20 + 0x30;
    int w = *(int *)recBase;
    int cellY = (((unsigned int)(w << 2) >> 24) << 1) + ((unsigned int)(w << 18) >> 31);
    int g;
    if (coord != cellY) return 0;
    if (*(u16 *)(data_ov002_022cf16c + parityOff + 0/*cf1a4 add r2*/ ) == 0) {
        /* orig: ldrh [r3(cf16c base)+ (cf1a4 + parityOff)] -> mask table read */
    }
    if (*(u16 *)(data_ov002_022cf1a4 + parityOff) == 0) return 0;
    g = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (g == 0x7e) {
        if (*(u16 *)(data_ov002_022d0e6c + 0xb2) == 0)
            func_ov002_021d93e0(0, 0x14 - 0x15); /* ip=0x14; sub r2,ip,#0x15 */
        return 0;
    }
    if (g == 0x7f) {
        func_ov002_0226b22c(b0/*r0?*/, 1, *(int *)(data_ov002_022cd744 + 0xd44));
        return 0x7e;
    }
    if (g == 0x80) {
        if (*(int *)(data_ov002_022d016c + (b0 << 2)) == 1) {
            int r = func_ov002_021b00d0(2);
            *(int *)(data_ov002_022cd744 + 0xd44) = r;
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    }
    return 0;
}
