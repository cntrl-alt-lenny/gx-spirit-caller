/* CAMPAIGN-PREP candidate for func_021c8068 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: same switch; loop loads .val first (add base,i<<2;ldrsh+2) returns .key
 *   risk:       struct-guessed + reshape-able: load-order (.val before .key) drives the `add base,i<<2`/`ldrsh #2` shape; if mwcc CSEs i<<2 like the twin it diverges. 3 tables inferred.
 *   confidence: med
 */
/* func_ov006_021c8068 (ov006, class D): table-of-tables REVERSE lookup (twin of
 * 021c7f5c). Same 9-table switch, but scans for val==arg and returns the key.
 * recipe: inner loop loads .val FIRST (add base,i<<2 ; ldrsh [+2]) into the
 * compare reg, then i<<2 separately; on match reads .key [base,i<<2]. Writing
 * `arg == tbl[i].val` (val read first) drives the add-base-then-ldrsh#2 order. */

typedef struct { short key; short val; } kv_t;

extern kv_t data_ov006_021ce274[];
extern kv_t data_ov006_021ce29c[];
extern kv_t data_ov006_021ce38a[];
extern kv_t data_ov006_021ce3d6[];
extern kv_t data_ov006_021ce3fe[];
extern kv_t data_ov006_021ce56c[];

int func_ov006_021c8068(int val, int sel) {
    kv_t *tbl = 0;
    int count = 0;
    int i;
    switch (sel) {
    case 2: tbl = data_ov006_021ce3fe; count = 0xa;  break;
    case 3: tbl = data_ov006_021ce274; count = 0x3;  break;
    case 4: tbl = data_ov006_021ce38a; count = 0x9;  break;
    case 5: tbl = data_ov006_021ce29c; count = 0x4;  break;
    case 6: tbl = data_ov006_021ce3d6; count = 0xa;  break;
    case 7: tbl = data_ov006_021ce56c; count = 0x16; break;
    case 8: tbl = data_ov006_021ce3fe; count = 0xa;  break;
    case 9: tbl = data_ov006_021ce56c; count = 0x23; break;
    default: break;
    }
    if (tbl == 0) {
        return -1;
    }
    for (i = 0; i < count; i++) {
        if (val == tbl[i].val) {
            return tbl[i].key;
        }
    }
    return -1;
}
