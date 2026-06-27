/* CAMPAIGN-PREP candidate for func_021b01f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store f224=1 right after guard; flag via if-assign (mov#1;moveq#2); (u16) pack
 *   risk:       permuter-class: brief-360 sibling near-miss (`a global load hoisted`) — f224=1 store-order vs the f4 load scheduling is the likely 1-2 insn diff. Logic/store-order correct; route to permuter if it doesn't land.
 *   confidence: med
 */
/* func_ov002_021b01f4: one-shot guard on data_ov002_022d016c.f224; set it,
 * write f3328 = (arg0==data_ov002_022cd73c.f4 ? 2 : 1), then post a packed
 * (u16) command (kind 0x23, bit15 = arg0!=0, arg1=0xb) via func_021d479c. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];
extern int  func_ov002_021d479c(int packed, int a, int b, int c);

void func_ov002_021b01f4(int arg0) {
    int flag;
    if (*(int *)(data_ov002_022d016c + 0xe0) != 0) return;
    *(int *)(data_ov002_022d016c + 0xe0) = 1;
    flag = 1;
    if (arg0 == *(int *)(data_ov002_022cd73c + 0x4)) flag = 2;
    *(int *)(data_ov002_022d016c + 0xd00) = flag;
    func_ov002_021d479c(
        (unsigned short)((arg0 ? 0x8000 : 0) | 0x23),
        0xb, 0, 0);
}
