/* CAMPAIGN-PREP candidate for func_022ae374 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl maxidx/key/base first (r4/r5/r6); separate j for 2nd loop (distinct r2); unsigned score for movhi; +0x4080 auto-splits
 *   risk:       struct-guessed: sel[] at 0x04 and score[] at 0x10 share one record indexed by i*4 (parallel word arrays); if real layout differs the field offsets diverge.
 *   confidence: med
 */
/* func_ov002_022ae374: slot allocator over a 3-entry record.
 * If an entry's sel[] already holds `key`, reuse it (clear its score,
 * return its packed id). Otherwise pick the entry with the highest
 * score, notify func_ov002_022ae2e0, claim it for `key`, clear score.
 * Packed id = (idx<<11) + 0x4080.
 *
 *     mov r4,#0          ; maxidx
 *     mov r5,r1          ; key
 *     mov r6,r0          ; base
 *     mov r1,r4          ; i
 *   .find:
 *     add r2,r6,r1,lsl#2; ldr r0,[r2,#4]; cmp r5,r0; bne .next
 *     mov r0,r1,lsl#0xb; mov r1,#0; add r0,#0x80
 *     str r1,[r2,#0x10]; add r0,#0x4000; ret
 *   .next: add r1,#1; cmp r1,#3; blt .find
 *     mov r2,#0
 *   .max:
 *     ... ldr score[j]; ldr score[maxidx]; cmp; movhi r4,r2
 *     add r2,#1; cmp r2,#3; blt .max
 *     bl func_ov002_022ae2e0(base,maxidx,key)
 *     add r2,r6,r4,lsl#2; mov r0,r4,lsl#0xb; add r0,#0x80
 *     str r5,[r2,#4]; mov r1,#0; str r1,[r2,#0x10]; add r0,#0x4000; ret
 */

struct slot3 {
    int f0;        /* 0x00 */
    int sel[3];    /* 0x04 */
    unsigned score[3]; /* 0x10 (unsigned: movhi) */
};

extern void func_ov002_022ae2e0(struct slot3 *base, int idx, int key);

int func_ov002_022ae374(struct slot3 *base, int key) {
    int maxidx = 0;
    int i;
    int j;

    for (i = 0; i < 3; i++) {
        if (key == base->sel[i]) {
            base->score[i] = 0;
            return (i << 11) + 0x4080;
        }
    }

    for (j = 0; j < 3; j++) {
        if (base->score[j] > base->score[maxidx])
            maxidx = j;
    }

    func_ov002_022ae2e0(base, maxidx, key);
    base->sel[maxidx] = key;
    base->score[maxidx] = 0;
    return (maxidx << 11) + 0x4080;
}
