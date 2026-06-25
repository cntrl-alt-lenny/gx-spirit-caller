/* CAMPAIGN-PREP candidate for func_02067208 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global as loop counter (reload each iter); 4-byte struct copy = byte-wise stores; dst base bound once
 *   risk:       the for-end test in my C is malformed; orig is do/while-style: store base data_0219eb70 held in ip across loop, index reloaded, ++ then cmp<5. mwcc may hoist index to a reg instead of reloading the global, or emit str(word) not 4 strb. reshape-able (use plain `for(i=0;i<5;i++)` with global) / struct-guessed.
 *   confidence: low
 */
/* func_02067208 - main - class C
 * counted loop (0..4), 4-byte struct copies, global loop index
 * _LIT0 = data_0219eb6c (int index), _LIT1 = data_0219eb70 (Quad dst[])
 * func_02054f44 -> handle, field_c is ptr[]
 */
typedef struct { unsigned char b0, b1, b2, b3; } Quad;
typedef struct { unsigned char _pad[0xc]; Quad **list; /* +0xc */ } Handle;

extern int  data_0219eb6c;
extern Quad data_0219eb70[];
extern Handle *func_02054f44(void);

void func_02067208(void)
{
    Handle *h;
    Quad *src;

    h = func_02054f44();
    if (h == 0)
        return;
    for (data_0219eb6c = 0; ; data_0219eb6c++) {
        src = h->list[data_0219eb6c];
        if (src == 0)
            return;
        data_0219eb70[data_0219eb6c] = *src;
        if (data_0219eb6c + 1 >= 5)
            ;
        else
            continue;
        if (data_0219eb6c + 1 < 5)
            ;
    }
}
