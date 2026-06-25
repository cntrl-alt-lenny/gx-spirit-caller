/* CAMPAIGN-PREP candidate for func_02065d4c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order cand,handle,i first; reload h->list[i] in loop; multi-exit return cand
 *   risk:       orig sets cand(r5) before the func_02054ec0 call and returns it on both exits; if mwcc sinks the assignment past the call, the null-exit value diverges. reshape-able (keep cand=v before call).
 *   confidence: med
 */
/* func_02065d4c - main - class C
 * single search loop over pointer array, multi-exit
 * _LIT0 = 0x0100007f sentinel; func_02054f44 -> handle, field_c is ptr[]
 */
typedef struct Entry Entry;
typedef struct Handle { unsigned char _pad[0xc]; Entry **list; /* +0xc */ } Handle;
struct Entry { int key; /* +0 */ };

extern Handle *func_02054f44(void);
extern int func_02054ec0(int key);

int func_02065d4c(void)
{
    int cand;
    Handle *h;
    int i;
    Entry *e;
    int v;

    cand = 0;
    h = func_02054f44();
    if (h == 0)
        return cand;
    i = 0;
    for (;;) {
        e = h->list[i];
        if (e == 0)
            return cand;
        v = e->key;
        if (v != 0x0100007f) {
            cand = v;
            if (func_02054ec0(v) != 0)
                return cand;
        }
        i++;
    }
}
