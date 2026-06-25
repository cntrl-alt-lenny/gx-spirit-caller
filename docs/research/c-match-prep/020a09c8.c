/* CAMPAIGN-PREP candidate for func_020a09c8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base=*data+idx*0x5d4 in r3 across regions; unsigned bhi compare; predicated tail store
 *   risk:       reshape-able-ish: orig holds mla base in r3 and re-adds +0x1000/+0x1d00 per use; if mwcc reloads *data_021a98fc or recomputes idx*0x5d4, ldr/mla diverge. struct-guessed: +0xd52/+0x48 offsets inferred.
 *   confidence: low
 */
/* func_020a09c8 (main, class C): gate bit test, then a ring-buffer head
 * advance inside a per-index record. base = *data_021a98fc + idx*0x5d4,
 * held in r3 across two sub-region accesses (+0x1000 region byte gate at
 * +0xd52, +0x1d00 region: enabled u16 @+0x4c, head u16 @+0x48,
 * tail u16 @+0x4a).
 * arg: r0=idx (0..31, used as 1<<idx against the gate mask).
 */

extern unsigned int data_021a9840;   /* gate bitmask */

typedef struct {
    char  _pad[0x1000 + 0xd52];
    unsigned char enabled_byte;       /* +0x1d52: presence gate */
} rec_gate_t;

typedef struct {
    char           _pad[0x1d00 + 0x48];
    unsigned short head;              /* +0x1d48 */
    unsigned short tail;              /* +0x1d4a */
    unsigned short active;            /* +0x1d4c */
} rec_ring_t;

extern char *data_021a98fc;          /* *base of stride-0x5d4 records */

void func_020a09c8(int idx) {
    char *base;
    rec_gate_t *g;
    rec_ring_t *r;
    unsigned short tail, head;

    if (!((1 << idx) & data_021a9840)) return;

    base = *(char **)data_021a98fc + idx * 0x5d4;
    g = (rec_gate_t *)base;
    if (g->enabled_byte == 0) return;

    r = (rec_ring_t *)base;
    if (r->active == 0) return;

    head = r->head;
    tail = r->tail;
    if (tail > head) {            /* bhi: unsigned */
        r->head = head;
        return;
    }
    if (head <= tail + 2) {       /* cmp r2,(ip+2); addle/strleh */
        r->head = (unsigned short)(head + 1);
    }
}
