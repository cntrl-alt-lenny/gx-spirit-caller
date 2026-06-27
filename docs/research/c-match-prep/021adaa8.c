/* CAMPAIGN-PREP candidate for func_021adaa8 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D divmod: /5 magic via '/' and explicit %; reuse val/5 for remainder; ordered field stores
 *   risk:       permuter-class: orig CSEs one `smull r6,r1` (val/5) and reuses ip across quotient+remainder; mwcc emits two smulls scheduled differently, plus lr=#5 held across. Triple-smull CSE/scheduling (note) is the wall; saved@+0x18 must be read before the memset.
 *   confidence: low
 */
/* func_ov008_021adaa8 — when arg==0: read a stride-52 row value, divide by 5
 * twice (smull magic 0x66666667 asr#1) for quotient + remainder, write the
 * quotient low byte to 021b2dc0.u16@+6, bump a counter on nonzero remainder,
 * then copy back the row value and two parallel-array words into 021b2dc8. */
extern unsigned char data_ov008_021b279c[];/* row value: u16 at idx*52 */
extern unsigned char data_ov008_021b27a0[];/* parallel word at idx*52 */
extern unsigned char data_ov008_021b27a4[];/* parallel word at idx*52 */
extern unsigned char data_ov008_021b2dc0[];/* u16@+6 */
extern unsigned char data_ov008_021b2dc8[];/* int@+0x18, +0xc, +0x10 */
extern unsigned char data_ov008_021b2dce[];/* u16@+0 counter */
extern void func_02094504(void *, int, int);

void func_ov008_021adaa8(int a0) {
    int saved = *(int *)(data_ov008_021b2dc8 + 0x18);
    func_02094504(data_ov008_021b2dc8, 0, 0x1c);
    if (a0 != 0) return;
    {
        int idx = (unsigned char)*(unsigned short *)(data_ov008_021b2dc0 + 6);
        unsigned val = *(unsigned short *)(data_ov008_021b279c + idx * 52);
        int q = (int)val / 5;
        int rem = (int)val - (int)val / 5 * 5;
        *(unsigned short *)(data_ov008_021b2dc0 + 6) =
            (*(unsigned short *)(data_ov008_021b2dc0 + 6) & ~0xffu) | (q & 0xff);
        if (rem != 0) {
            unsigned c = (unsigned char)*(unsigned short *)(data_ov008_021b2dce + 0) + 1;
            *(unsigned short *)(data_ov008_021b2dce + 0) =
                (*(unsigned short *)(data_ov008_021b2dce + 0) & ~0xffu) | (c & 0xff);
        }
        *(unsigned short *)(data_ov008_021b2dc0 + 6) =
            (*(unsigned short *)(data_ov008_021b2dc0 + 6) & ~0xff00u) | ((val & 0xff) << 8);
        *(int *)(data_ov008_021b2dc8 + 0xc) = *(int *)(data_ov008_021b27a0 + idx * 52);
        *(int *)(data_ov008_021b2dc8 + 0x10) = *(int *)(data_ov008_021b27a4 + idx * 52);
        *(int *)(data_ov008_021b2dc8 + 0x18) = saved;
    }
}
