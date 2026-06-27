/* CAMPAIGN-PREP candidate for func_021b6f50 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C/D: switch jump-table base-select; 4-byte stack temp str#0+strh; signed cmp tail
 *   risk:       VERIFIED switch table, str/strh temp, and movge/addlt/ldrblt tail all match. TWO residuals: orig table has a dead 6th slot yet cmp#4 (anomalous, permuter/structural — unreproducible from plain switch); and `if(count<=0)return 0` makes mwcc duplicate the epilogue under `le` vs orig single `ble` skip (reshape: single-return if(count>0){...}).
 *   confidence: med
 */
/* func_ov006_021b6f50 (ov006, class C/D): pick one of several stride-4 tables
 * by region index, bsearch a u16 key into it (count from a parallel array),
 * and return the matched element's byte field at +2 (0 if not found).
 *
 * func_020059b0 is a bsearch-style routine:
 *   (void *key, void *base, int nmemb, int size, cmp) -> index.
 * The comparator func_ov006_021b9000 is passed as the 5th (stacked) arg. */

extern int func_020059b0(void *key, void *base, int nmemb, int size,
                         int (*cmp)(const void *, const void *));
extern int func_ov006_021b9000(const void *a, const void *b);

unsigned char func_ov006_021b6f50(char *p, int sel, int key16) {
    int key;                       /* 4-byte stack temp, low half = key16 */
    char *base;
    int count;
    int idx;

    key = 0;
    *(unsigned short *)&key = (unsigned short)key16;

    switch (sel) {
    case 1:  base = p + 0x62a0; break;   /* 0x2a0 + 0x6000 */
    case 2:  base = p + 0x7a60; break;   /* 0xa60 + 0x7000 */
    case 3:  base = p + 0x7c60; break;   /* 0xc60 + 0x7000 */
    case 4:  base = p + 0x7e60; break;   /* 0xe60 + 0x7000 */
    /* NOTE: orig table has a 6th (dead) slot for a case-5 base
       p+0x60+0x8000 yet bounds at cmp #4 — anomalous, see risk flag. */
    default: base = 0; break;
    }

    count = *(unsigned short *)(p + sel * 2 + 0x8160);
    if (count <= 0)
        return 0;

    idx = func_020059b0(&key, base, count, 4, func_ov006_021b9000);
    if (idx < count)
        return *(unsigned char *)(base + idx * 4 + 2);
    return 0;
}
