/* CAMPAIGN-PREP candidate for func_021ca03c (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     lsl#21;lsr#30 -> :2 bitfield at bit9; RMW reloads via second GetSystemWork
 *   risk:       struct-guessed bitfield position; BIGGER risk: the two `.word bl` cross-overlay targets have no real symbols — extern names are placeholders, campaign must supply correct linked symbols or the bl encodings won't match. reshape-able once symbols resolved.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov011_021ca03c (ov011, class D) — brief 494.
 * UNVERIFIED build-free draft. bitfield lsl;lsr insert+RMW; cross-overlay calls.
 * if (!func_021b142c()) return; w = GetSystemWork();
 * fld = (w->f900 << 21) >> 30  -> :2 unsigned field at bits 9..10.
 * if (fld & 1) { reload w; clear bit0 of fld (= bit9): write field back via
 *   bic word,#0x600; word |= (fld & ~1) << 9; } else func_021b284c();
 * recipe: lsl#21;lsr#30 pair -> :2 bitfield member; RMW reload (re-call GetSystemWork).
 * NOTE: .word bl 0x021b142c / 0x021b284c are cross-overlay (no symbol) — extern names guessed.
 */
extern int  GetSystemWork(void);
extern int  func_021b142c(void);          /* .word bl 0x021b142c */
extern void func_021b284c(void);          /* .word bl 0x021b284c */

struct SysWork03c { char _0[0x900]; unsigned f900_b9 : 9; unsigned fld : 2; unsigned : 21; };
/* GetSystemWork returns SysWork03c*; f900 field at bits 9..10 */

void func_ov011_021ca03c(void) {
    struct SysWork03c *w;
    if (!func_021b142c())
        return;
    w = (struct SysWork03c *)GetSystemWork();
    if (w->fld & 1) {
        w = (struct SysWork03c *)GetSystemWork();   /* reload (orig re-calls) */
        w->fld &= ~1u;
    } else {
        func_021b284c();
    }
}
