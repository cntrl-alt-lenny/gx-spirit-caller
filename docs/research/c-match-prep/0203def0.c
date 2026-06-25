/* CAMPAIGN-PREP candidate for func_0203def0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: cnt :7 + busy :1 byte at 0x447 (lsl19;lsr19 + bic/orr 0x80); two independent strides (4 and 0xc0) kept unfused; matched&0xff each bump
 *   risk:       struct-guessed + permuter-class: loop uses r1(stride-0xc0 walker),r2(stride-4 walker),ip(index) as THREE live pointers reloading base[0xd12] every iter; mwcc will almost certainly choose a different walker/index reg split and recompute i*0xc0/i*4 differently -- a C reshape is unlikely to land this; escape to .s.
 *   confidence: low
 */
/* func_0203def0 - main - class D (bitfield + RMW) + class C reg-alloc
 * counted loop over base[0xd12] entries; per-entry occupied flag at
 * stride-4 (off 0x444) gates a stride-0xc0 u16 field (off 0x4a6) compared
 * to a :7 counter byte at stride-4 (off 0x447) whose bit7 is a busy flag.
 * Returns the count of entries whose counter mismatched (cleared + bumped).
 */
typedef struct {
    unsigned char occ;      /* +0x444 stride 4 : occupied flag   */
    unsigned char _445;
    unsigned char _446;
    unsigned char cnt:7;    /* +0x447 stride 4 : counter (lsl19;lsr19) */
    unsigned char busy:1;   /* +0x447 bit7 : bic/orr #0x80        */
} Slot4;

typedef struct {
    unsigned char _pad[0x4a6];
    unsigned short lim;     /* +0x4a6 stride 0xc0 : ldrh, lim-1 cmp */
} SlotC0;

typedef struct {
    unsigned char _pad0[0x444];
    Slot4 s4[1];            /* base+0x444, stride 4  */
} Base;

int func_0203def0(unsigned char *base)
{
    int matched;
    int i;
    Slot4 *e;
    SlotC0 *c;

    matched = 0;
    for (i = 0; i < *(signed char *)(base + 0xd12); i++) {
        e = (Slot4 *)(base + 0x444 + i * 4);
        if (e->occ == 0) {
            c = (SlotC0 *)(base + i * 0xc0);
            if ((unsigned)(c->lim - 1) != e->cnt) {
                e->busy = 0;
                matched = (matched + 1) & 0xff;
            } else {
                e->busy = 1;
            }
        } else {
            e->busy = 1;
        }
    }
    return matched;
}
