/* CAMPAIGN-PREP candidate for func_02084bc8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order int i; reload count in loop-cond; signed >>5 = asr
 *   risk:       reshape-able: i>>5 needs signed int (asr, not lsr); count reloaded each iter via ldrb [r1,#0x19] - if mwcc caches count or uses unsigned i, index calc diverges.
 *   confidence: med
 */
/* func_02084bc8: walk linked list (next at +0x10), for each node iterate
 * count = u8 [+0x19] entries of u16 array at +0x1a; if entry & 0x100, set
 * bit (i & 0x1f) in word bits[i >> 5]. r0=bits base held throughout; count
 * reloaded each inner iteration; i>>5 is asr (signed int i). */

typedef struct Node_02084bc8 {
    char _pad0[0x10];
    struct Node_02084bc8 *next;   /* +0x10 */
    char _pad14[0x19 - 0x14];
    unsigned char count;          /* +0x19 */
    unsigned short flags[1];      /* +0x1a, stride 2 */
} Node_02084bc8;

void func_02084bc8(unsigned int *bits, Node_02084bc8 *node)
{
    if (node == 0)
        return;
    do {
        int i;
        for (i = 0; i < node->count; i++) {
            if (node->flags[i] & 0x100) {
                bits[i >> 5] |= 1 << (i & 0x1f);
            }
        }
        node = node->next;
    } while (node != 0);
}
