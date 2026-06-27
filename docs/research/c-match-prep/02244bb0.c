/* CAMPAIGN-PREP candidate for func_02244bb0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls-pc switch w/ case-0 fallthrough; (u8) byte-pack; bind c/sum across call; load a,b,c in order
 *   risk:       reshape-able: switch must emit addls-pc table not cmp-tree; if mwcc reorders case bodies the b .L_xx fallthrough chain diverges (case-order lever).
 *   confidence: med
 */
/* func_ov002_02244bb0 — ov002 state-machine handler (state @ ce288+0x5b8).
 * addls-pc jump table over states 0..5; default returns 1. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self02244bb0 { u16 f0; u16 b0 : 1; };

extern char data_ov002_022ce288[];          /* state block (+0x5b8) */
extern char data_ov002_022d016c[];          /* byte-pack source (+0xd70..) */
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_021d8770(int a, int b);
extern void func_ov002_0223dad0(void *self, int packed);
extern void func_ov002_022593a8(int a, int b, int c);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_02244b08(void);

int func_ov002_02244bb0(struct Self02244bb0 *self) {
    int a, b, c, sum;
    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
        func_ov002_021ae400(self->b0, 0x144);
        /* fall through */
    case 2:
    case 4:
        func_ov002_022593a8(self->b0, self->f0, (int)&func_ov002_02244b08);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 1:
    case 3:
    case 5:
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
        return 1;
    }
}
