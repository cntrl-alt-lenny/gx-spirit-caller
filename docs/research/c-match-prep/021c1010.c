/* CAMPAIGN-PREP candidate for func_021c1010 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D STORE-ORDER: two ldr/orr/str RMW to same cell in asm order; if-assign shift = movne/moveq 0x17/0x16
 *   risk:       reshape-able: orig does ldr;orr;str then a SEPARATE ldr before the 2nd orr;str (reloads, not bound) — my `*cell|...` reloads (matches). Main risk is the range ladder bgt/bge/sub ordering; keep the >0x18a6 / >0x19c1 nesting exactly.
 *   confidence: med
 */
/* func_ov002_021c1010 (ov002, class D, STORE-ORDER): bank=arg0&1 (stride 0x868),
 * row=arg1*0x14 into data_022cf1ac. RMW: set bit21, STORE; test bit22 to pick
 * shift 0x17/0x16, set that bit, STORE again; then 021b9ecc(obj,idx) and a
 * signed range ladder (0x18a6 / 0x19c1) that may re-call 021b9ecc + 021b1f20. */

extern char data_ov002_022cf1ac[];
extern int  func_ov002_021b1f20(int obj, int idx, int a, int stack0);
extern int  func_ov002_021b9ecc(int obj, int idx);

int func_ov002_021c1010(int obj, int idx) {
    int bank = (obj & 1) * 0x868;
    int row  = idx * 0x14;
    unsigned int *cell = (unsigned int *)(data_ov002_022cf1ac + bank + row);
    unsigned int v;
    int shift;
    int r;

    v = *cell | 0x200000;            /* set bit 21 */
    *cell = v;                       /* store #1 (store-order) */
    if ((v >> 0x16) & 1)
        shift = 0x17;
    else
        shift = 0x16;
    *cell = *cell | (1u << shift);   /* reload then store #2 */

    r = func_ov002_021b9ecc(obj, idx);
    if (r > 0x18a6) {
        if (r > 0x19c1) {
            if (r != 0x19c1 + 0x8d)
                return 0;
        } else if (r != 0x19c1) {
            return 0;
        }
    } else if (r != 0x18a6) {
        if (r != 0x18a6 - 0x3a)
            return 0;
    }

    func_ov002_021b9ecc(obj, idx);
    func_ov002_021b1f20(obj, idx, 1, 0);
    return 0;
}
