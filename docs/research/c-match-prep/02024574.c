/* CAMPAIGN-PREP candidate for func_02024574 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Alloc clone: bind base reload post-loop, inline i*0x16c (no shared base CSE).
 *   risk:       reshape-able: orig reloads p->base into r6 AFTER loop and holds it across Fill32 (str r4,[r6,r5]); if mwcc keeps the loop's base or re-muls, the post-call str/add diverge.
 *   confidence: med
 */
/* func_02024574: scan pool data_0219a8ec for a free slot (stride 0x16c),
 * Fill32-clear it, store arg0 at +0, return the slot; else return 0.
 * Pool head: { void *base @0x0; int count @0x4 }. */

extern void Fill32(int v, void *dst, int size);
extern char data_0219a8ec[];

struct Pool { char *base; int count; };

int func_02024574(int arg0) {
    struct Pool *p = (struct Pool *)data_0219a8ec;
    int count = p->count;
    int i = 0;
    if (count > 0) {
        char *e = p->base;
        do {
            if (*(int *)e == 0) break;
            i++;
            e += 0x16c;
        } while (i < count);
    }
    if (i >= count) return 0;
    {
        char *base = p->base;
        char *slot = base + i * 0x16c;
        Fill32(0, slot, 0x16c);
        *(int *)(base + i * 0x16c) = arg0;
        return (int)(base + i * 0x16c);
    }
}
