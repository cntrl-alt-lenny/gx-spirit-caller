/* CAMPAIGN-PREP candidate for func_02257464 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested :2 / :6 bitfield discriminants; signed (lo+hi)/2 midpoint; 24-byte stride (mul, not lsl); unsigned key compare; return &record; no default (base/count uninit).
 *   risk:       binary-search loop reg-alloc (lo=r0,hi=r4,mid=lr) rotates vs mwcc => permuter-class (documented wall). Secondary: jump-table formation and the uninitialized-default; lo=0 placement before the switch may move.
 *   confidence: low
 */
/* func_ov002_02257464: the indirect-dispatch resolver. self->f2 field[13:12]
 * (:2) picks a table+count; field[11:6] (:6) sub-selects in case 2. Then a
 * lower-bound binary search over 24-byte records keyed by the first u32
 * against self->f0; returns &record on an exact hit, else 0. Default path
 * leaves base/count uninitialized (matches orig). */

typedef unsigned short u16;
typedef unsigned int   u32;

struct rec24 { u32 key; char _pad[20]; };

struct hdr_02257464 {
    u16 f0;
    u16 _lo6 : 6;
    u16 sub6 : 6;
    u16 kind2 : 2;
};

extern struct rec24 data_ov002_022c357c[];
extern struct rec24 data_ov002_022c08c4[];
extern struct rec24 data_ov002_022be1ac[];
extern struct rec24 data_ov002_022bf3c4[];

struct rec24 *func_ov002_02257464(struct hdr_02257464 *self) {
    u32 key;
    int lo;
    int hi;
    int mid;
    struct rec24 *base;
    lo = 0;
    key = self->f0;
    switch (self->kind2) {
    case 0: base = data_ov002_022c357c; hi = 0x32b; break;
    case 1: base = data_ov002_022c08c4; hi = 0x1dc; break;
    case 2:
        if (self->sub6 == 0x23) { base = data_ov002_022c357c; hi = 0x32b; }
        else { base = data_ov002_022be1ac; hi = 0xc0; }
        break;
    case 3: base = data_ov002_022bf3c4; hi = 0xdf; break;
    }
    while (lo < hi) {
        mid = (lo + hi) / 2;
        if (base[mid].key < key) lo = mid + 1;
        else hi = mid;
    }
    if (key == base[lo].key) return &base[lo];
    return 0;
}
