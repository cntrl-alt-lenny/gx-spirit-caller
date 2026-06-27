/* CAMPAIGN-PREP candidate for func_021aa80c (ov020, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: two counted loops, const args (8,0xf0,0x24) reloaded each call; moveq-return result; mvn r0,#0 -> return -1.
 *   risk:       permuter-class: loop-1 holds result in r7 / step in r8 but loop-2 SWAPS them (result r8 / step r7); mwcc allocs both result-vars the same way -> one loop's r7/r8 register roles diverge. struct offsets (0x910,0x8c8,0xcc) also guessed.
 *   confidence: low
 */
// func_ov020_021aa80c : two parallel counted dispatch loops (reg roles swapped)
extern int func_ov020_021aa7ac(int a, int b, int c, int d);
extern unsigned short data_ov020_021ae0a8[];    // _LIT1 (table)
struct G20a { char pad[0x910]; int sel; };
extern struct G20a data_ov020_021ae060;          // _LIT0, [+0x910]
struct G20b { char pad[0x8c8]; int sel2; };      // _LIT2, [+0x8c8] and [+0x800+0xcc]
extern struct G20b data_ov020_021ae0a8_2;        // _LIT2 = data_ov020_021ae0a8

int func_ov020_021aa80c(void)
{
    int *p0  = &((struct G20a *)&data_ov020_021ae060)->sel;
    int idx0 = (*p0 - 1);
    if (data_ov020_021ae0a8[idx0] == 4) {
        int i, b = 0x1c;
        for (i = 0; i < 4; i++) {
            if (func_ov020_021aa7ac(8, b, 0xf0, 0x24) == 1) return i;
            b += 0x28;
        }
    } else {
        char *base = (char *)&data_ov020_021ae0a8;
        int idx2 = ((int *)(base + 0x8c8))[0] - 1;
        unsigned short v = *(unsigned short *)(base + idx2 * 2 + 0x800 + 0xcc);
        if (v == 3) {
            int i, b = 0x1c;
            for (i = 0; i < 3; i++) {
                if (func_ov020_021aa7ac(8, b, 0xf0, 0x24) == 1) return i;
                b += 0x28;
            }
        }
    }
    return -1;
}
