/* CAMPAIGN-PREP candidate for func_0200afc8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     same as af24: hoist count, reload list/cells, cells at +0x8, inner bound 5
 *   risk:       struct-guessed: cells offset 0x8 and inner bound 5 inferred from asm. Same hoist-count/reload-list contract as af24; if that asymmetry breaks, reload count diverges. Mostly clean (direct clone).
 *   confidence: high
 */
/* func_0200afc8: clone of func_0200af24 with cells at node+0x8 and inner bound 5. */
extern void Task_InvokeLocked(void *p);

typedef struct Node02b { char pad[0x8]; void **cells; } Node02b;   /* cells at +0x08 */
typedef struct Cont02b { int count; Node02b **list; } Cont02b;     /* count +0, list +4 */

int func_0200afc8(void *arg)
{
    Cont02b *c = (Cont02b *)arg;
    int i, j, n;
    if (c == 0)
        return 0;
    n = c->count;
    for (i = 0; i < n; i++) {
        for (j = 0; j < 5; j++) {
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
