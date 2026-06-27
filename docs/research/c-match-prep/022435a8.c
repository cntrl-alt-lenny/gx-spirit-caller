/* CAMPAIGN-PREP candidate for func_022435a8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     jump-table switch (cases 1/3/5 collapse to one block); self-ptr passed to 02257ab8; signed guards
 *   risk:       jump-table layout: case order 0,2,4,{1,3,5} must reproduce the 7-entry table mapping 1/3/5->one block; mwcc block ordering / case-2-vs-4 inline may diverge. Mostly reshape-able via case order; residual reg-alloc permuter-class. Shipped .s.
 *   confidence: med
 */
/* func_ov002_022435a8: ov002 6-entry step machine (state at
 * data_ov002_022ce288+0x5b8). cmp#5 jump table; cases 1/3/5 share
 * .L_12c (func_022593f4 guard + d016c/dcc0 advance or rewind). */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_0223dcc0(void *self, int a, int b, int c);
extern int  func_ov002_02243508(void);
extern int  func_ov002_02257ab8(void *self, int x);
extern int  func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022593f4(void);

int func_ov002_022435a8(struct Ov002Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
        if (func_ov002_02257ab8(self, 1 - self->b0) < 2)
            return 0;
        if (func_ov002_02257ab8(self, self->b0) < 1)
            return 0;
        func_ov002_021ae400(self->b0, 0x64);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_02243508);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 2:
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_02243508);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 4:
        func_ov002_021ae400(self->b0, 0x7c);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_02243508);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 1:
    case 3:
    case 5:
        if (func_ov002_022593f4() == 0) {
            *(int *)(data_ov002_022ce288 + 0x5b8) -= 1;
            return 0;
        }
        func_ov002_0223dcc0(self,
                            *(int *)(data_ov002_022d016c + 0xd70),
                            *(int *)(data_ov002_022d016c + 0xd74) +
                                *(int *)(data_ov002_022d016c + 0xd78),
                            *(int *)(data_ov002_022d016c + 0xd74));
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    return 1;
}
