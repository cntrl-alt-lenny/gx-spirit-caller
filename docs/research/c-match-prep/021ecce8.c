/* CAMPAIGN-PREP candidate for func_021ecce8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global struct reloaded (not bound); :1 b0 guard; stack 5th arg = 0
 *   risk:       orig RELOADS the cd3f4 base twice (separate ldr literal per use-site); if mwcc CSEs it into one register the second `ldr =cd3f4` vanishes and a reg differs. reshape-able only via the global-vs-local access pattern; otherwise struct-guessed (f4/f1c/f20 offsets).
 *   confidence: med
 */
/* func_ov002_021ecce8 (ov002, class C). args r0=self, r1=a, r2=row.
 * No cf16c table here. Uses a global struct data_ov002_022cd3f4 (fields f0/f4/f1c/f20).
 * The base address is RELOADED (two `ldr =cd3f4`): once for the f4/f20 check, once for the
 * final call. A 5th call arg (0) is stored to [sp]. self->b0 is the :1 at +2. */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct g_t { int f0; int f4; char _pad8[0x14]; int f1c; int f20; };

extern struct g_t data_ov002_022cd3f4;
extern int func_ov002_021bf294(int a0, int a1, int a, int row, int z);
extern int func_ov002_021c1ef0(struct self_t *self, int a, int row);

int func_ov002_021ecce8(struct self_t *self, int a, int row) {
    if (row >= 5)
        return 0;
    if (self->b0 != a)
        return 0;
    if (func_ov002_021c1ef0(self, a, row) == 0)
        return 0;
    if (data_ov002_022cd3f4.f4 == a && data_ov002_022cd3f4.f20 == row)
        return 0;
    return func_ov002_021bf294(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c, a, row, 0);
}
