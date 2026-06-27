/* CAMPAIGN-PREP candidate for func_0221b3d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on ce288+0x5a8 (cmp-chain, proven idiom); cd744[bit0]; bitfield b0/row; byte-resplit
 *   risk:       _LIT2/_LIT3 truncated from pool: assigned d016c(+0xd44 counter) / d0e6c(+0xb2 getter) from the extern list — confirm. struct-guessed (the two pool words).
 *   confidence: med
 */
/* func_ov002_0221b3d8 (cls D): dispatch on the int state at ce288+0x5a8.
 * 0x80 = validate (0223df38/0223de94/0225764c) then cd744-gated 021b00d0 vs
 * 021ae664, ret 0x7f; 0x7f = 0226b22c, ret 0x7e; 0x7e = d0e6c+0xb2 gate then
 * tail 0220e74c. _LIT2=d016c, _LIT3=d0e6c inferred (pool truncated). */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 row : 5; u16 _r : 10; };

extern char data_ov002_022cd744[];
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];

extern int  func_ov002_021ae664(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_0220e74c(void);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0223df38(void *self, int idx, int *out);
extern int  func_ov002_0225764c(int self, int a, int b);
extern void func_ov002_0226b22c(int a, int b, int c, int d);

int func_ov002_0221b3d8(struct Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80: {
        int packed, a, b;
        if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
        packed = func_ov002_0223de94(self, 0);
        a = packed & 0xff;
        b = ((u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, a, b) == 0) return 0;
        if (*(int *)(data_ov002_022cd744 + (self->b0 & 1) * 4) == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    }
    case 0x7f:
        func_ov002_0226b22c(self->b0 & 1, self->row, 1, *(int *)(data_ov002_022d016c + 0xd44));
        return 0x7e;
    case 0x7e:
        if (*(u16 *)(data_ov002_022d0e6c + 0xb2) == 0) return 0;
        func_ov002_0220e74c();
        return 0;
    }
    return 0;
}
