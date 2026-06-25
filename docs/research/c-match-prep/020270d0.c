/* CAMPAIGN-PREP candidate for func_020270d0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Alloc clone: reload base post-loop into r6, hold across Fill32, inline i*0xe0.
 *   risk:       reshape-able: same as 02024574 — orig reloads p->base post-loop (mul r5,r3,0xe0; ldr r6,[r1]) and keeps r6 across Fill32 for str r4,[r6,r5]; mwcc keeping loop pointer or re-muling diverges the tail.
 *   confidence: med
 */
/* func_020270d0: alloc clone of 02024574 for pool data_0219a924, stride 0xe0.
 * Scan for free slot (entry+0==0), Fill32-clear, store arg0 at +0, return slot;
 * else 0. Pool head { void *base @0; int count @4 }. */

extern void Fill32(int v, void *dst, int size);
extern char data_0219a924[];

struct Pool { char *base; int count; };

int func_020270d0(int arg0) {
    struct Pool *p = (struct Pool *)data_0219a924;
    int count = p->count;
    int i = 0;
    if (count > 0) {
        char *e = p->base;
        do {
            if (*(int *)e == 0) break;
            i++;
            e += 0xe0;
        } while (i < count);
    }
    if (i >= count) return 0;
    {
        char *base = p->base;
        char *slot = base + i * 0xe0;
        Fill32(0, slot, 0xe0);
        *(int *)(base + i * 0xe0) = arg0;
        return (int)(base + i * 0xe0);
    }
}
