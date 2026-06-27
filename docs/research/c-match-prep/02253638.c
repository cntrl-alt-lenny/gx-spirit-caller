/* CAMPAIGN-PREP candidate for func_02253638 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     binary search; signed (lo+hi)/2 (gives add,add lsr#31,asr#1); unsigned key compare (addcc); 8-byte stride struct; mvnne -1 sentinel.
 *   risk:       lo/hi/mid register coloring in the search loop may rotate vs orig (lo=lr,hi=ip); permuter-class. If key declared signed the compare becomes addlt not addcc (reshape-able: keep unsigned).
 *   confidence: med
 */
/* func_ov002_02253638: lower-bound binary search over data_022cad34, 390
 * entries of 8-byte stride keyed by the first u32; returns the matching index
 * or -1. mid is signed (lo+hi)/2; the key compare is unsigned. */

extern struct rec8 { unsigned int key; int _pad; } data_ov002_022cad34[];

int func_ov002_02253638(unsigned int key) {
    int hi;
    int lo;
    int mid;
    hi = 0x186;
    lo = 0;
    while (lo < hi) {
        mid = (lo + hi) / 2;
        if (data_ov002_022cad34[mid].key < key) lo = mid + 1;
        else hi = mid;
    }
    if (key != data_ov002_022cad34[lo].key) lo = -1;
    return lo;
}
