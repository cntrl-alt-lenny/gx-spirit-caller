/* CAMPAIGN-PREP candidate for func_0222ffc0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     player bit0 bitfield re-read per call (ldrh+lsl31;lsr31); ce288.f5a8 state, f5ac counter dec-store
 *   risk:       orig saves self in r4 (stmdb {r4,lr}) and RE-LOADS [r4,#2] before each 021e104c call rather than caching player; the f5ac dec is a load;sub;store RMW that must keep the ce288 base bound -> reshape-able (re-read self->player each use, separate statements) but reg coloring of r4 vs the base could still 1-off
 *   confidence: med
 */
typedef unsigned short u16;
struct ce288 { char _a[0x5a8]; int f5a8; int f5ac; };
struct self_t { u16 f0; u16 player : 1; };
extern struct ce288 data_ov002_022ce288;
extern int  func_ov002_021bb950(int player, int a);
extern int  func_ov002_021e104c(int player, int a);
int func_ov002_0222ffc0(struct self_t *self) {
    int state = data_ov002_022ce288.f5a8;
    if (state == 0x7f) {
        if (data_ov002_022ce288.f5ac == 0) return 0;
        func_ov002_021e104c(self->player, 1);
        data_ov002_022ce288.f5ac--;
        return 0x7f;
    }
    if (state != 0x80) return 0;
    func_ov002_021e104c(self->player, 1);
    data_ov002_022ce288.f5ac = func_ov002_021bb950(self->player, 0x181e);
    return 0x7f;
}
