/* CAMPAIGN-PREP candidate for func_0203a780 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch bodies in source order 0,3,1 (case1 falls through); walking ptr; reload count
 *   risk:       walker init (add r6,r4,#4) is sunk AFTER the count==0 guard in orig; mwcc may hoist rec init above the guard -> scheduling diff. reshape-able-ish but possibly permuter-class. count must compare unsigned (bcc).
 *   confidence: med
 */
/* func_0203a780 (cls D): walk array of 8-byte {u8 op; u32 arg} records, dispatch
 * on op (0/1/3; 2 & default skip). Each handler(arg0, rec->arg, arg2); if it
 * returns 0 the whole fn returns 0. Loop count reloaded each iter (opaque calls).
 * Walking pointer (rec++ by 8) + separate index, mirroring r6 walker + r5 index.
 * Case bodies in SOURCE order 0,3,1 so case 1 (last) falls through to continue. */

typedef struct {
    unsigned char op;     /* +0 */
    char  _pad[3];
    int   arg;            /* +4 */
} rec_t;                  /* 8 bytes */

typedef struct {
    unsigned count;       /* +0 */
    rec_t    recs[1];     /* +4 */
} list_t;

extern list_t *func_02089134(void *key);
extern int     func_0203a6e8(void *a, int arg, int c);
extern int     func_0203a694(void *a, int arg, int c);
extern int     func_0203a744(void *a, int arg, int c);

int func_0203a780(void *arg0, void *key, int arg2) {
    list_t *list = func_02089134(key);
    rec_t  *rec;
    int     i;
    if (list == 0)
        return 0;
    rec = &list->recs[0];
    for (i = 0; i < list->count; i++) {
        switch (rec->op) {
        case 0:
            if (func_0203a6e8(arg0, rec->arg, arg2) == 0) return 0;
            break;
        case 3:
            if (func_0203a744(arg0, rec->arg, arg2) == 0) return 0;
            break;
        case 1:
            if (func_0203a694(arg0, rec->arg, arg2) == 0) return 0;
            break;
        }
        rec++;
    }
    return 1;
}
