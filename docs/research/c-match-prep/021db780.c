/* CAMPAIGN-PREP candidate for func_021db780 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     base bound; large offsets split (0xf90+0x5000); 6-arg stack calls; bound-then-test guard
 *   risk:       orig normalizes *022915e8 to 0/1 (movne#1/moveq#0) before the branch; mwcc may collapse to a bare cmp;bne. reshape-able: materialize `int b=(g!=0)`.
 *   confidence: med
 */
/* func_ov004_021db780: gated state-advance then three fixed sub-object calls.
 * Guard: base[0x4c]==base[0x48] && *022915e8==0 -> (base[0x3c90]?dab1c+da848(3)
 * :dac7c). Always: db530(); two ca0a4 panel calls on base+0x5f90; c9dd4 on
 * base+0x5ef0. Returns 0. */
extern char data_ov004_0220b500[];
extern int  data_ov004_022915e8;
extern void func_ov004_021c9dd4(int, void *, int, int);
extern void func_ov004_021ca0a4(void *, int, int, int, int, int);
extern void func_ov004_021da848(int);
extern void func_ov004_021da898(void);
extern void func_ov004_021dab1c(void);
extern void func_ov004_021dac7c(void);
extern void func_ov004_021db530(void);

int func_ov004_021db780(void) {
    char *base = data_ov004_0220b500;
    if (*(int *)(base + 0x4c) == *(int *)(base + 0x48) && data_ov004_022915e8 == 0) {
        if (*(int *)(base + 0x3c90) != 0) {
            func_ov004_021dab1c();
            func_ov004_021da848(3);
        } else {
            func_ov004_021dac7c();
        }
    }
    func_ov004_021db530();
    func_ov004_021ca0a4((void *)(base + 0x5f90), 2, 0, 0, 2, 0x1f);
    func_ov004_021da898();
    func_ov004_021ca0a4((void *)(base + 0x5f90), 2, 0xe4, 3, 2, *(int *)(base + 0xa0));
    func_ov004_021c9dd4(0x05000638, (void *)(base + 0x5ef0), 4, 0x00600100);
    return 0;
}
