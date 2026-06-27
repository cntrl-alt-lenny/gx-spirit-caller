/* CAMPAIGN-PREP candidate for func_022a6afc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     eor f4^1 parity idiom, :N extracts, if-assign movne/moveq, header reloaded each use
 *   risk:       permuter-class: the eor-flag compares (cmp r0,r1.lsr#1f swapped operand order) plus movne/moveq pairing are coin-flip; bit-index args to 021c9504 (b,c order) struct-guessed.
 *   confidence: low
 */
/* func_ov002_022a6afc (ov002, D) — eor-flag validation guard chain, returns flag.
 * r0=self(r5). Reads halfword at self+0x500+0x90 (header a:1,b:5,c:8). G=cd73c,
 * G.f4 is the parity word (idiom f4 ^ 1). flag = (G.f4 ^ 1)==a ? 1 : 0 set both
 * at entry and at the tail (movne/moveq coin-flip). Two helper guards in between:
 * 021c9504(self,b,c) must be nonzero; then if (a == G.f4) skip the 021c988c gate,
 * else 021c988c(self,b,c) must be nonzero. Then 021c93f0(self,a,b,c)->p, reload
 * *(p) header, recompute flag = (G.f4 ^ 1)==((*p)>>13 & ...) hmm: orig uses bit13
 * of *(int*)p: mov r0,#0x12 lsl ;lsr#1f => bit13. Returns r4. */
typedef unsigned short u16;
struct Cd73c { char _a[4]; int f4; };
extern struct Cd73c data_ov002_022cd73c;
extern int func_ov002_021c9504(void *self, int b, int c);
extern int func_ov002_021c988c(int b, int c);
extern int *func_ov002_021c93f0(void *self, int a, int b, int c);

int func_ov002_022a6afc(char *self) {
    u16 *hp = (u16 *)(self + 0x500 + 0x90);
    int a = *hp & 1;
    int r4 = ((data_ov002_022cd73c.f4 ^ 1) == a) ? 1 : 0;
    if (func_ov002_021c9504(self, (*hp >> 6) & 0xff, (*hp >> 1) & 0x1f) == 0)
        return r4;
    if ((*hp & 1) != data_ov002_022cd73c.f4) {
        if (func_ov002_021c988c((*hp >> 1) & 0x1f, (*hp >> 6) & 0xff) == 0)
            return r4;
    }
    {
        int *p = func_ov002_021c93f0(self, *hp & 1, (*hp >> 1) & 0x1f, (*hp >> 6) & 0xff);
        r4 = ((data_ov002_022cd73c.f4 ^ 1) == ((*p >> 13) & 1)) ? 1 : 0;
    }
    return r4;
}
