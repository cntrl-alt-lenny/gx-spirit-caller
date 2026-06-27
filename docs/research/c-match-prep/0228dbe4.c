/* CAMPAIGN-PREP candidate for func_0228dbe4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla parity then idx*0x14+0x30; (w<<19)>>19 :13 field; stack int buf[]; guard chain
 *   risk:       struct-guessed: buf size and func_0202f620 signature inferred; r6=n-1 index reused for two ldr — if mwcc recomputes n-1, diverges. permuter-class risk on the guard-chain branch order.
 *   confidence: low
 */
// func_ov002_0228dbe4 — ov002 class D: mla base + bitfield + stack-array, guard chain
#include <stddef.h>

extern unsigned char data_ov002_022cf16c[]; // 2D base, parity stride 0x868
extern int func_0202eab0(unsigned int x);
extern int func_0202f620(unsigned int x, int *out);   // fills out[], returns count
extern int func_ov002_021ba294(unsigned int a0, int v);
extern int func_ov002_021c3b60(unsigned int a0);

int func_ov002_0228dbe4(unsigned int a0, int idx)
{
    int buf[2];
    unsigned char *base = data_ov002_022cf16c + (a0 & 1) * 0x868;
    unsigned int w = *(unsigned int *)(base + idx * 0x14 + 0x30);
    unsigned int key = (w << 0x13) >> 0x13;   // :13 unsigned field
    if (func_0202eab0(key)) {
        int n = func_0202f620(key, buf);
        int last = n - 1;
        if ((int)key < buf[last]) {
            if (func_ov002_021c3b60(a0) < 0) {
                if (func_ov002_021ba294(a0, buf[last]) < 0) return 0;
            }
            return buf[last];
        }
    }
    return 0;
}
