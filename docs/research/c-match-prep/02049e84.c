/* CAMPAIGN-PREP candidate for func_02049e84 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload-each-use accessor; if-assign branch; store-order +184/+188; byte vs int offset casts
 *   risk:       First guard loads [+0x1a0] into temp 'st' then compares; orig reloads each branch. If mwcc keeps 'st' bound across the 3 cmps the early ldr/reload pattern diverges (reshape-able: split into 3 fresh func_020498f0() reads, drop the temp).
 *   confidence: med
 */
/* func_02049e84 - main - class C
 * repeated accessor reloads + guard chain + field stores.
 * func_020498f0() = singleton base ptr; re-called each use to force reload.
 * Field offsets confirmed against src/main/func_02049e84.s.
 */
extern unsigned char *func_020498f0(void);
extern void func_020498dc(int);
extern void func_0204ed50(int, int);
extern int  func_0204a9b0(void);

void func_02049e84(int a0)
{
    int st;

    st = *(int *)(func_020498f0() + 0x1a0);
    if (st == 1) {
        func_020498dc(6);
    } else if (*(int *)(func_020498f0() + 0x1a0) != 6) {
        if (*(int *)(func_020498f0() + 0x1a0) != 0xb)
            return;
    }

    if (a0 == *(int *)(func_020498f0() + 0x180)) {
        func_020498f0()[0x17c] = func_020498f0()[0x17c] + 1;
    } else {
        func_020498f0()[0x17c] = 0;
        *(int *)(func_020498f0() + 0x180) = a0;
    }

    *(int *)(func_020498f0() + 0x184) = 0;
    *(int *)(func_020498f0() + 0x188) = 0;
    func_0204ed50(1, a0);
    if (func_0204a9b0() != 0)
        return;
    func_020498f0()[0x3cc] = 0xff;
}
