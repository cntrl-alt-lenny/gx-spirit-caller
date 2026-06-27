/* CAMPAIGN-PREP candidate for func_021acfa0 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D byte-combine+store-order: index via shifts; zero two fields then row pair; low-byte insert
 *   risk:       permuter-class (CONFIRMED): brief-403 permuter-probed 900s/~7k iters, base 1890 best 765, NO match; mwcc peepholes the (hw<<24)>>24 to and#0xff + r4-r6 spill cascade. Already shipped whole-function .s.
 *   confidence: low
 */
/* func_ov008_021acfa0 — clear two ints in 021b2dc8, then zero the stride-52
 * row pair at byte0+byte1 index, and copy that index byte into the low byte
 * of 021b2dc0.u16@+6; tail-call 021ada90. */
extern unsigned char data_ov008_021b27a0[];
extern unsigned char data_ov008_021b27a4[];
extern unsigned char data_ov008_021b2dc0[];/* u16@+4 (index src), u16@+6 */
extern unsigned char data_ov008_021b2dc8[];/* int@+0xc, int@+0x10 */
extern void func_ov008_021ada90(void);

void func_ov008_021acfa0(void) {
    unsigned hw = *(unsigned short *)(data_ov008_021b2dc0 + 4);
    int idx = (hw & 0xff) + ((hw << 16) >> 24);   /* byte0 + byte1 */
    *(int *)(data_ov008_021b2dc8 + 0x10) = 0;
    *(int *)(data_ov008_021b2dc8 + 0xc) = 0;
    *(int *)(data_ov008_021b27a0 + idx * 52) = 0;
    *(int *)(data_ov008_021b27a4 + idx * 52) = 0;
    *(unsigned short *)(data_ov008_021b2dc0 + 6) =
        (*(unsigned short *)(data_ov008_021b2dc0 + 6) & ~0xffu) | (idx & 0xff);
    func_ov008_021ada90();
}
