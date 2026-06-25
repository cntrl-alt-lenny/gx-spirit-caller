/* CAMPAIGN-PREP candidate for func_0205d614 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return + two compare-calls + store; return 1/0
 *   risk:       struct offsets (0xc/0/8/4/8/c) guessed; compare arg order to func_020aaf40 fixed by asm
 *   confidence: med
 */
/* func_0205d614: callback comparing a candidate record (r1) against an
 * existing entry held at r1->slot (+0xc). Returns 1 (keep scanning) when
 * there is no entry or either key differs; on a full match writes back the
 * record pointer + a 1 flag into the query block (r2) and returns 0 (stop).
 *
 *   r6=cand; r4=cand->_0xc; r5=query
 *   if (r4==0) return 1;
 *   if (func_020aaf40(query->_0, r4->_0)   != 0) return 1;
 *   if (func_020aaf40(query->_4, r4->_8)   != 0) return 1;
 *   *query->_8 = cand; query->_c = 1; return 0;
 */
typedef struct query  query_t;
typedef struct record record_t;

struct record {
    char _pad_00[0xc];
    record_t *entry;   /* +0xc */
};

struct query {
    void  *key0;       /* +0x0 */
    void  *key1;       /* +0x4 */
    void **out;        /* +0x8 */
    int    found;      /* +0xc */
};

extern int func_020aaf40(void *a, void *b);

int func_0205d614(int dummy, record_t *cand, query_t *query) {
    record_t *entry = cand->entry;

    if (entry == 0) return 1;
    if (func_020aaf40(query->key0, *(void **)entry) != 0) return 1;
    if (func_020aaf40(query->key1, *(void **)((char *)entry + 8)) != 0) return 1;

    *query->out = cand;
    query->found = 1;
    return 0;
}
