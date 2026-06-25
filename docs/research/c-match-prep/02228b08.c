/* CAMPAIGN-PREP candidate for func_02228b08 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload ce288/b0 each use (not bound); if-test idx<0; mla parity base then +offset+idx*4
 *   risk:       orig does add#0x18 then add#0x400 then add idx<<2 (3 adds); mwcc folds 0x18+0x400=0x418 (not a valid imm) -> 2 adds, possibly reversed order. reshape-able (offset-split order), 1-2 insn near-miss.
 *   confidence: med
 */
/* func_ov002_02228b08: state switch (ce288+0x5a8), mla parity base + offset.
 * state 0x7f -> arg-pack via 021e276c; state 0x80 -> guard then 021d7d0c with
 * cf16c+(b0&1)*0x868+0x18+0x400+idx*4; else return 0. ce288 RELOADED (orig
 * re-ldr's _LIT0). self->b0 read 3x (021b99b4 arg, mla parity, 021d7d0c arg) to
 * match the 3 ldrh reloads — do NOT bind it. */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_0223def4(struct S *self, int idx);
extern int  func_ov002_021b99b4(int player, int x);
extern void func_ov002_021d7d0c(struct S *self, int player, int *ptr);
extern void func_ov002_021e276c(int player, u16 f0, int k, int x);

int func_ov002_02228b08(struct S *self) {
    int r;
    int idx;
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x7f) {
        func_ov002_021e276c(self->b0, self->f0, 1,
                            (u16)func_ov002_0223def4(self, 0));
        return 0;
    }
    if (*(int *)(data_ov002_022ce288 + 0x5a8) != 0x80) return 0;
    r = func_ov002_0223def4(self, 0);
    idx = func_ov002_021b99b4(self->b0, r);
    if (idx < 0) return 0;
    func_ov002_021d7d0c(self, self->b0,
        (int *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x18 + 0x400 + idx * 4));
    return 0x7f;
}
