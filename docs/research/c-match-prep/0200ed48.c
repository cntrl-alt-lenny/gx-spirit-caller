/* CAMPAIGN-PREP candidate for func_0200ed48 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: hold base+running ptr, mul-index on hit, reload base for return
 *   risk:       flag test uses lsl#31;lsr#31 (bit0) -> keep &1 not bitfield; return reloads data->base (i*0x284 must recompute, not CSE with the hit ptr). reshape-able
 *   confidence: med
 */
/* func_0200ed48 (main, class C) — scan slot[].flagbit0; first free -> Fill32, return its addr.
 * head struct @ data_02186ae8; count @ +0xc; array base @ +0x14; stride 0x284.
 * guard: slot->f60 & 1 (lsl#31;lsr#31). On free slot: Fill32(slot,0,0x284) then
 * RELOAD base (data->+0x14) and return base + i*0x284. */

extern void Fill32(int val, void *dst, int n);

typedef struct {
    int  count;   /* 0xc */
    char *base;   /* 0x14 */
} Hdr;

typedef struct { unsigned int f60; } Slot;  /* flag @ 0x60 */

extern char data_02186ae8;

void *func_0200ed48(void)
{
    Hdr *h = (Hdr *)&data_02186ae8;
    int i = 0;
    int n = h->count;
    if (n > 0) {
        char *base = h->base;
        char *p = base;
        do {
            if ((((Slot *)p)->f60 & 1) == 0) {
                char *q = base + i * 0x284;
                Fill32(0, q, 0x284);
                return ((Hdr *)&data_02186ae8)->base + i * 0x284;
            }
            i++;
            p += 0x284;
        } while (i < n);
    }
    return 0;
}
