/* CAMPAIGN-PREP candidate for func_02028790 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Alloc clone: reload base post-loop, hold across Fill32, inline i*0x19c.
 *   risk:       reshape-able: identical risk to 02024574/020270d0 — the post-loop base reload into r6 held across Fill32 (str r4,[r6,r5]; add r0,r6,r5); mwcc re-muling or keeping the loop pointer diverges the tail.
 *   confidence: med
 */
/* func_02028790: alloc clone of 02024574 for pool data_0219a92c, stride 0x19c.
 * Scan for free slot (entry+0==0), Fill32-clear, store arg0 at +0, return slot;
 * else 0. */

extern void Fill32(int v, void *dst, int size);
extern char data_0219a92c[];

struct Pool { char *base; int count; };

int func_02028790(int arg0) {
    struct Pool *p = (struct Pool *)data_0219a92c;
    int count = p->count;
    int i = 0;
    if (count > 0) {
        char *e = p->base;
        do {
            if (*(int *)e == 0) break;
            i++;
            e += 0x19c;
        } while (i < count);
    }
    if (i >= count) return 0;
    {
        char *base = p->base;
        char *slot = base + i * 0x19c;
        Fill32(0, slot, 0x19c);
        *(int *)(base + i * 0x19c) = arg0;
        return (int)(base + i * 0x19c);
    }
}
