/* CAMPAIGN-PREP candidate for func_0203d5b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :2 bitfield (lsl;lsr) at p+0xe6; fall-through +0x100 chains; mla in 6/7; empty 8/9 keep cmp#9
 *   risk:       the :2 bitfield in a u8 container may emit `and #3` instead of `lsl#30;lsr#30`. reshape-able: widen the bitfield container (unsigned :2 in a 32-bit struct). Empty cases 8/9 are load-bearing for cmp#9; if folded, cmp#7. Offsets struct-guessed.
 *   confidence: med
 */
/* func_0203d5b0 (cls D): 10-way dispatch with +0x100 fall-through chains.
 * cases {2,1,0} share body A (p += 0x100 cascades), {5,4,3} share body B.
 * cases 6/7 use mla base (p+0x47c)+p->fd13*0xc0. Empty cases 8/9 keep cmp#9 / 10-
 * entry table. Body A reads a :2 bitfield at p[0xe6] (lsl#30;lsr#30, NOT and#3).
 * Return = out[0] != 0. Bodies in source order: {2,1,0},{5,4,3},6,7. */

typedef struct { unsigned char b2 : 2; } bits2_t;   /* :2 at p+0xe6 */
typedef struct { char _pad[0xc0]; } cell_t;          /* 0xc0 stride at p+0x47c */

extern void func_02094688(void *src, void *dst, int n);
extern void func_0203f690(cell_t *cell, void *dst);
extern void func_0203f718(cell_t *cell, void *dst);

int func_0203d5b0(unsigned char *p, int sel, unsigned char *out) {
    switch (sel) {
    case 2: p += 0x100;
    case 1: p += 0x100;
    case 0:
        out[0] = ((bits2_t*)(p + 0xe6))->b2;
        func_02094688(p + 0x80, out + 2, 0x50);
        break;
    case 5: p += 0x100;
    case 4: p += 0x100;
    case 3:
        out[0] = 1;
        func_02094688(p + 0xd1, out + 2, 0x14);
        out[0x16] = 0;
        break;
    case 6:
        out[0] = 2;
        func_0203f690((cell_t*)(p + 0x47c) + p[0xd13], out + 2);
        break;
    case 7:
        out[0] = 2;
        func_0203f718((cell_t*)(p + 0x47c) + p[0xd13], out + 2);
        break;
    case 8:
    case 9:
        break;
    }
    return out[0] != 0;
}
