/* CAMPAIGN-PREP candidate for func_021c7f5c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch->(base,count); branch-table; loop indexes tbl[i].key then .val[+2]
 *   risk:       struct-guessed: the 9 table addrs/counts and the case->_LITn mapping are inferred from 6 visible pools (LIT6/7/8 hidden); confirm the 3 missing tables. Loop addressing reshape-able.
 *   confidence: med
 */
/* func_ov006_021c7f5c (ov006, class D): table-of-tables forward lookup.
 * sel (r1, 0..9) picks one of 9 (short key, short val) tables; scans up to a
 * fixed count for key==arg(r2), returns its val; -1 on miss/empty table.
 * recipe: switch sets (base,count); inner loop indexes tbl[i] with i<<2 base,
 * compares .key first (i<<2 then ldrsh [base,i<<2]) then reads .val [+2]. */

typedef struct { short key; short val; } kv_t;

extern kv_t data_ov006_021ce274[];
extern kv_t data_ov006_021ce29c[];
extern kv_t data_ov006_021ce38a[];
extern kv_t data_ov006_021ce3d6[];
extern kv_t data_ov006_021ce3fe[];
extern kv_t data_ov006_021ce56c[];

int func_ov006_021c7f5c(int key, int sel) {
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
        if (key == tbl[i].key) {
            return tbl[i].val;
        }
    }
    return -1;
}
