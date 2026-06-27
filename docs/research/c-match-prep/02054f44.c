/* CAMPAIGN-PREP candidate for func_02054f44 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order global-record writes; bind handle in r0 across tail
 *   risk:       struct-guessed + call-arg ambiguity: func_0206e174's arg0 (r0=&e4e4 incidental vs real param) is guessed. d4/f8 field offsets+types inferred. mwcc may not hoist all literal loads ahead of the stores like orig.
 *   confidence: low
 */
/* func_02054f44 (main, class D) — register a descriptor: fill the data_0219e4d4
 * record (func ptr, ctx ptr, two halfwords, link) in store-order, clear the
 * handle data_0219e4e4, run init (func_0206e174) + bind (func_0206e670), and on
 * success patch the back-link record data_0219e4f8 and bump the d4.ha field to 4.
 * STORE-ORDER recipe: emit field writes in the asm's exact order; literals hoisted.
 */

extern char data_020ffc04[];
extern char data_0219e4cc[];
extern char data_0219e4d4[];
extern int  data_0219e4e4;
extern char data_0219e4f8[];

extern int  func_0206e174(void *p);
extern int  func_0206e670(int a, void *b);

int func_02054f44(void) {
    *(void **)(data_0219e4d4 + 0x0) = data_020ffc04;
    *(void **)(data_0219e4d4 + 0x4) = data_0219e4cc;
    *(short  *)(data_0219e4d4 + 0x8) = 2;
    *(short  *)(data_0219e4d4 + 0xa) = 0;
    *(void **)(data_0219e4d4 + 0xc) = data_0219e4f8;
    data_0219e4e4 = 0;

    func_0206e670(func_0206e174(&data_0219e4e4), &data_0219e4e4);

    {
        int h = data_0219e4e4;          /* r0 held across the trailing stores */
        if (h == 0)
            return 0;

        *(void **)(data_0219e4f8 + 0x0) = &data_0219e4e4;
        *(short  *)(data_0219e4d4 + 0xa) = 4;
        *(int   *)(data_0219e4f8 + 0x4) = 0;
        return h;
    }
}
