/* CAMPAIGN-PREP candidate for func_0209e124 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: <<16>>16 => (u16) casts; u32 global +1 store-back, u16 return
 *   risk:       reshape-able: the trailing `mov r0,r2,lsl#16 ... lsr#16` recomputes the return from the stored value; if mwcc returns the pre-store temp instead, store to the global first then `return (u16)data_021026dc;` (already done).
 *   confidence: med
 */
/* func_0209e124: if a u32 global == 0x10000, refresh it from a 2-word fill
 * buffer ((buf[2] + (buf[1]<<8)) truncated to u16); then unconditionally
 * increment the global with u16 wraparound and return it as u16.
 * class D: lsl#16/lsr#16 pairs == (unsigned short) casts; global is u32
 * (it is compared to 0x10000 so cannot itself be u16).
 */

extern int data_021026dc;            /* u32 counter, truncated to u16 on store */
extern void func_0209bcdc(void);
extern int  func_0209bb60(void *buf);

unsigned short func_0209e124(void) {
    int buf[3];
    if (data_021026dc == 0x10000) {
        func_0209bcdc();
        if (func_0209bb60(&buf[0]) == 0) {
            data_021026dc = (unsigned short)(buf[2] + (buf[1] << 8));
        }
    }
    data_021026dc = (unsigned short)(data_021026dc + 1);
    return (unsigned short)data_021026dc;
}
