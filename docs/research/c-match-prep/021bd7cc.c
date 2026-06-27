/* CAMPAIGN-PREP candidate for func_021bd7cc (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla element pointer (idx*0x24); limit if-assign; two do-while carry loops; ret flag
 *   risk:       permuter-class: orig emits each loop guard TWICE (cmp;bge then cmp;mov#1;bge) — a redundant double-compare from ret-flag placement; mwcc's single-guard do-while likely differs. May need .s.
 *   confidence: low
 */
/* func_ov006_021bd7cc — leaf wrap-normalizer: for element idx (stride 0x24 at
 * self+0xa0), clamp field v=elem[+4] into [0, limit) by carrying into elem[+8];
 * limit = (self->f50==4)?3:4. Returns 1 iff a carry occurred. */
int func_ov006_021bd7cc(void *self, int idx) {
    int *elem = (int *)((char *)self + 0xa0 + idx * 0x24);
    int limit = (*(int *)((char *)self + 0x50) == 4) ? 3 : 4;
    int ret = 0;
    int v = elem[1];
    if (v < 0) {
        ret = 1;
        do {
            elem[1] = ++v;
            elem[2]--;
        } while ((v = elem[1]) < 0);
    }
    if (v >= limit) {
        ret = 1;
        do {
            elem[1] = --v;
            elem[2]++;
        } while ((v = elem[1]) >= limit);
    }
    return ret;
}
