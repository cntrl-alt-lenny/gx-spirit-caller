/* CAMPAIGN-PREP candidate for func_02244e8c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: sparse switch {0,1,10,11} -> cmp-tree (cmp#10/bgt/bge then 0..1 range); case 0/1 shared body; (u8) byte-pack; bind c/sum
 *   risk:       permuter-class: the orig cmp-tree pivots high-first (cmp#0xa before the 0/1 range); mwcc's switch-tree pivot/branch order may differ — a range-opt/cmp-tree coin-flip resistant to C reshape.
 *   confidence: low
 */
/* func_ov002_02244e8c — sparse-state handler {0,1,10,11} (state @ ce288+0x5b8). */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self02244e8c { u16 f0; u16 b0 : 1; };

extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_021d8770(int a, int b);
extern void func_ov002_0223dad0(void *self, int packed);
extern void func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_0223f5b4(void *self);
extern int  func_ov002_02244e24(void);

int func_ov002_02244e8c(struct Self02244e8c *self) {
    int a, b, c, sum;
    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
    case 1:
        if (func_ov002_0223f5b4(self) != 0)
            *(int *)(data_ov002_022ce288 + 0x5b8) = 0xa;
        return 0;
    case 10:
        func_ov002_021ae400(self->b0, 0x145);
        func_ov002_0225935c(self->b0, self->f0, (int)&func_ov002_02244e24);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 11:
        if (func_ov002_022593f4() == 0) {
            *(int *)(data_ov002_022ce288 + 0x5b8) -= 1;
            return 0;
        }
        a   = *(int *)(data_ov002_022d016c + 0xd74);
        b   = *(int *)(data_ov002_022d016c + 0xd78);
        c   = *(int *)(data_ov002_022d016c + 0xd70);
        sum = a + b;
        func_ov002_021d8770(c, sum);
        func_ov002_0223dad0(self, (u16)((u8)c | ((u8)sum << 8)));
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    default:
        return 0;
    }
}
