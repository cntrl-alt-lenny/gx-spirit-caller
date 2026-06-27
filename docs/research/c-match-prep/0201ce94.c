/* CAMPAIGN-PREP candidate for func_0201ce94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     short-circuit guard chain, bind base reloaded per call, store-order increment
 *   risk:       orig RELOADS data_0218febc (LIT0) separately in each of 3 call setups; modeling it as one bound local makes mwcc keep it in a reg -> the 3 ldr _LIT0 collapse. Write each access as a fresh global read. reshape-able (bind/reload flip) + struct-guessed offsets
 *   confidence: low
 */
/* func_0201ce94: if a queued slot is ready, dispatch it and advance the ring.
 * Guard: func_0201cfa0() && ctl.f10 && *data_020c5db0. Then clears the flag,
 * issues two callbacks keyed by ctl.f4, pokes func_020927b8/02092748 around a
 * ring-index bump (f4=(f4+1)&0x1f) and f10--.
 */
struct Ctl { char pad0[4]; int f4; char pad8[0x10-8]; int f10; };
extern struct Ctl data_0218febc;
extern int        data_020c5db0;
extern unsigned short data_0218ff4c[];
extern unsigned char  data_0219000c[];   /* stride 0x10 */
extern unsigned char  data_02191e20[];
extern unsigned char  data_0218fef4[];
extern void func_0201c99c(void);
extern int  func_0201cfa0(void);
extern void func_02094688(void *a, void *b, int c);
extern void func_02020b78(void *a, int b, void *c);
extern void func_020927b8(void *a);
extern void func_02092748(void *a);

void func_0201ce94(void)
{
    int k;
    if (func_0201cfa0() == 0) return;
    if (data_0218febc.f10 == 0) return;
    if (data_020c5db0 == 0) return;
    data_020c5db0 = 0;

    k = data_0218febc.f4;
    func_02094688(&data_0219000c[k << 4], data_02191e20, data_0218ff4c[k]);
    func_02020b78(data_02191e20, data_0218ff4c[data_0218febc.f4], func_0201c99c);
    func_020927b8(data_0218fef4);
    data_0218febc.f4 = (data_0218febc.f4 + 1) & 0x1f;
    data_0218febc.f10 = data_0218febc.f10 - 1;
    func_02092748(data_0218fef4);
}
