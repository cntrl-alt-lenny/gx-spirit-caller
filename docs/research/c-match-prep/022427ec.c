/* CAMPAIGN-PREP candidate for func_022427ec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     jump-table switch; char buf[0x100]; case0->case2 fall-through; signed <2 guard
 *   risk:       the case0->case2 fall-through layout: mwcc may not place blocks so case0 falls into case2 without a branch (inline-vs-branch class); reshape-able only via case order, else permuter. Shipped .s.
 *   confidence: low
 */
/* func_ov002_022427ec: ov002 4-entry step machine (state at
 * data_ov002_022ce288+0x5b8) with a 0x100 stack scratch buffer.
 * case 0 FALLS THROUGH into case 2 (.L_270 -> .L_2a8). */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern int  func_ov002_022577dc(void);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_0229cf10(void *buf, int a, int b);
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_022593a8(int a, int b, int c);
extern int  func_ov002_0223dcc0(void *self, int a, int b, int c);
extern int  func_ov002_0223fd74(void *arg0, int arg1, int arg2);

int func_ov002_022427ec(struct Ov002Self *self) {
    char buf[0x100];

    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
        if (func_ov002_022577dc() < 2)
            return 1;
        func_ov002_0229cf10(buf, 0xa1, 2);
        func_ov002_021ae400(self->b0, (int)buf);
        /* fallthrough */
    case 2:
        func_ov002_022593a8(self->b0, self->f0, (int)func_ov002_0223fd74);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 1:
    case 3:
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
