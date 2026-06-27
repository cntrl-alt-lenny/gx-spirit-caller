/* CAMPAIGN-PREP candidate for func_0221e548 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on ce288+0x5a8 state; bit0 via :1 bitfield; ternary for movne/moveq pair
 *   risk:       Jump-table shape: mwcc may emit cmp-chain not the sub#0x7d;addls-pc table if cases not seen as dense 0x7d-0x80. reshape-able via case ordering / contiguity.
 *   confidence: med
 */
/* func_ov002_0221e548: ov002 global-state dispatch (cls D). State word at
 * data_ov002_022ce288+0x5a8 selects one of 5 handlers (0x64,0x7d-0x80) via the
 * sub#0x7d;cmp#3;addls pc jump-table + a leading cmp#0x64. self in r0->r4. */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_021af9d0(int a, int b, int c, int d);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021de408(int self, int a);
extern int  func_ov002_021e276c(int a, int b, int c, int d);
extern int  func_ov002_021ff400(void);
extern int  func_ov002_02257704(void);
extern int  func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0221e548(struct Self *self) {
    int r;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        r = func_ov002_02257704();
        return func_ov002_021de408((int)self, r) ? 0x7f : 0x64;
    case 0x7f:
        if (func_ov002_021ff400() == 0)
            return 0x64;
        func_ov002_021ae400(self->b0, 0x5e);
        return 0x7e;
    case 0x7e:
        func_ov002_021af9d0(self->b0, 6, self->f0, 0);
        return 0x7d;
    case 0x7d:
        r = func_ov002_021afb74();
        func_ov002_0227adb8(self->b0, r, 1, 0);
        return 0x64;
    case 0x64:
        func_ov002_021e276c(self->b0, self->f0, 1, 0);
        return 0;
    }
    return 0;
}
