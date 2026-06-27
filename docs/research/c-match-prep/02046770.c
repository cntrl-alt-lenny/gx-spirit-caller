/* CAMPAIGN-PREP candidate for func_02046770 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     and-mask iter var (i+1)&0xff; reload base; scan-then-tail; ge-guard early return
 *   risk:       loop holds base in r3 across iterations: `add r2,r3,ip,lsl#2; ldr [r2,#0x448]` -- mwcc may fold i<<2 with the +0x448 differently or reload data_0219daec each pass (3 ldr diverge). Tail return value unknown (no r0 set on fallthrough). reshape-able/permuter-class. struct-guessed.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 *data_0219daec;
extern void func_020467e4(void);
extern void func_02046858(void);
extern void func_02046888(int a);

u32 func_02046770(u32 a0, int n) {
    u8 *g;
    u32 i;
    i = 0;
    if (n > 0) {
        g = data_0219daec;
        do {
            if (a0 == *(u32 *)(g + (i << 2) + 0x448)) {
                break;
            }
            i = (i + 1) & 0xff;
        } while ((int)i < n);
    }
    if ((int)i >= n) {
        return 0;
    }
    g = data_0219daec;
    func_02046888(*(u8 *)(g + i + 0x624));
    func_02046858();
    func_020467e4();
    return ???;
}
