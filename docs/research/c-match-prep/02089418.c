/* CAMPAIGN-PREP candidate for func_02089418 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     scalar fixups in source order off18/off20/off10; loop RELOADS p->p84 each iter; cond add (addne)
 *   risk:       loop reg-alloc: orig reloads ldr [r5,#0x84] every iteration and walks r2 with r3=i*0x10 accumulator. mwcc may hoist p->p84 or strength-reduce differently. permuter-class for loop body; header fixups reshape-able. struct-guessed.
 *   confidence: low
 */
// func_02089418 — relocate offset fields to pointers (header + per-element loop)
// data_021a5800: written at end to point at the relocated block.
struct Elem { int pad0; int pad4; int pad8; int reloc; };       // reloc field at +0x8?  NB: see risk
struct Sub  { int pad0; int pad4; int count; };                 // count at +0x8, elems at +0xc
struct Blk {
    char pad0[0x10];
    int  off10;   // +0x10
    char pad14[0x04];
    int  off18;   // +0x18
    char pad1c[0x04];
    int  off20;   // +0x20
    char pad24[0x10];
    int  p30;     // +0x30
    char pad34[0x50];
    int  p84;     // +0x84
    int  p88;     // +0x88
    int  p8c;     // +0x8c
};
extern void Copy32(void *dst, const void *src, unsigned int n);
extern void *data_021a5800;

void func_02089418(struct Blk *p, char *base)
{
    int i;
    Copy32(base, p, 0x30);
    p->p8c = p->off18 ? (int)(base + p->off18) : 0;
    p->p84 = p->off20 ? (int)(base + p->off20) : 0;
    p->p88 = p->off10 ? (int)(base + p->off10) : 0;
    {
        struct Sub *s = (struct Sub *)p->p84;
        if ((unsigned int)s->count > 0) {
            for (i = 0; (unsigned int)i < (unsigned int)((struct Sub *)p->p84)->count; i++) {
                int *fld = (int *)((char *)p->p84 + 0xc + i * 0x10 + 0x8);
                *fld = *fld ? (int)(base + *fld) : 0;
            }
        }
    }
    p->p30 = 0;
    data_021a5800 = p;
}
