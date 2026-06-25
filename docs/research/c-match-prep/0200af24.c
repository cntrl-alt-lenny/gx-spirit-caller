/* CAMPAIGN-PREP candidate for func_0200af24 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist count once; reload list/node/cells each use (opaque calls); inner bound 13
 *   risk:       struct-guessed: cells offset 0xc and the inner bound 13 are read off the asm. count MUST be hoisted (orig caches it in r6) while list/cells are reloaded — if mwcc instead caches `list[i]` across calls, the reload sequence diverges. Mostly clean.
 *   confidence: high
 */
/* func_0200af24: nested walk of a container; invoke each non-null cell, then the cell
   array, then the node, then the node array, then the container. cells at node+0xc, inner 13. */
extern void Task_InvokeLocked(void *p);

typedef struct Node02 { char pad[0xc]; void **cells; } Node02;   /* cells at +0x0c */
typedef struct Cont02 { int count; Node02 **list; } Cont02;       /* count +0, list +4 */

int func_0200af24(void *arg)
{
    Cont02 *c = (Cont02 *)arg;
    int i, j, n;
    if (c == 0)
        return 0;
    n = c->count;                                 /* hoisted once into callee-saved */
    for (i = 0; i < n; i++) {
        for (j = 0; j < 13; j++) {
            if (c->list[i]->cells[j])
                Task_InvokeLocked(c->list[i]->cells[j]);
        }
        if (c->list[i]->cells)
            Task_InvokeLocked(c->list[i]->cells);
        if (c->list[i])
            Task_InvokeLocked(c->list[i]);
    }
    Task_InvokeLocked(c->list);
    Task_InvokeLocked(c);
    return 1;
}
