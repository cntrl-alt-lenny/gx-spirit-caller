/* CAMPAIGN-PREP candidate for func_021b0184 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ternary f4?0x8000:0 -> movne/moveq; (u16) cast for lsl#16;lsr#16 pack
 *   risk:       permuter-class: this is the brief-360 catalogued near-miss (`a global load hoisted`) — mwcc schedules the f3312/f4 load earlier than orig. Logic matches; the diff is instruction scheduling -> permuter, not C reshape.
 *   confidence: med
 */
/* func_ov002_021b0184: guarded arg-pack. Bail unless data_ov002_022d016c.f3316
 * == 0xffff and func_021b1cf0()==0; then latch f3316=f3312 and post a packed
 * (u16) command (kind 0xb, bit15 = data_ov002_022cd73c.f4!=0) via func_021d479c. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];
extern int  func_ov002_021b1cf0(void);
extern int  func_ov002_021d479c(int packed, int a, int b, int c);

void func_ov002_021b0184(void) {
    if (*(int *)(data_ov002_022d016c + 0xcf4) != 0xffff) return;
    if (func_ov002_021b1cf0() != 0) return;
    *(int *)(data_ov002_022d016c + 0xcf4) = *(int *)(data_ov002_022d016c + 0xcf0);
    func_ov002_021d479c(
        (unsigned short)((*(int *)(data_ov002_022cd73c + 0x4) ? 0x8000 : 0) | 0xb),
        0, 0, 0);
}
