/* CAMPAIGN-PREP candidate for func_022062e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 bitfield gives lsl#31;lsr#31; bit0 RELOADED (read twice) for the 2nd call; global anti-fold struct held in reg.
 *   risk:       struct-guessed: 0xcf8 offset into data_022d016c inferred; if real layout differs the guard ldr offset moves. Shifts/reload otherwise exact.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022062e0 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft.
 * asm: r4=arg; t=field@+2 bit0 (:1). r=021bbf50(1-t); if(!r) return 0.
 *   if(data_022d016c.fcf8 != 2) return 0.  (global held in reg, ldr [.,#0xcf8])
 *   field@+2 bit0 is RELOADED (second ldrh [r4,#2]); return 02259f74(t)!=0.
 * Note: bit0 re-read for the 2nd call (not bound across the global guard). */
typedef unsigned short u16;

struct Ent62e0 { u16 _0; u16 b0 : 1; u16 _r : 15; };
struct G016c   { char _a[3320]; int fcf8; };   /* fcf8 @ 0xcf8 */

extern struct G016c data_ov002_022d016c;
extern int func_ov002_021bbf50(int a);
extern int func_ov002_02259f74(int a);

int func_ov002_022062e0(struct Ent62e0 *p) {
    if (func_ov002_021bbf50(1 - p->b0) == 0)
        return 0;
    if (data_ov002_022d016c.fcf8 != 2)
        return 0;
    return func_ov002_02259f74(p->b0) != 0;
}
