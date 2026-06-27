/* CAMPAIGN-PREP candidate for func_020258c4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: struct-copy via aggregate assign; field stores in asm order; loop reuses base+i<<4.
 *   risk:       struct-guessed: the 0x68/0xac block sizes and +0x100 attr layout are inferred; the read-modify-write store order at +0x6a and the i<<4 vs strb [r1],#0x10 post-index addressing are the likely diverge.
 *   confidence: low
 */
/* func_020258c4: struct ctor. dst (r0) is the 0x16c entry; src (r1) feeds
 * the +0x68 sub-struct. Copies a 0x68 block (self->head) out and back around a
 * Fill32(0,self,0x16c), then field inits and a 6-entry sprite-attr table at
 * +0x100 (stride 0x10), each .word -1 + clear bit0 of a parallel byte array. */

extern void Fill32(int v, void *dst, int size);
extern void func_02025f00(void *self);

struct Sub { int w[26]; };          /* 0x68 bytes = 26 words */

struct Attr { short a, b, c; unsigned char flags; char pad; }; /* 0x10 with the +0x62.. layout below */

struct Obj {
    int   head[26];          /* 0x000: 0x68 saved/restored block */
    int   pad68[(0x100-0x68)/4];
    /* explicit fields written after Fill32 */
};

void func_020258c4(struct Obj *self, struct Sub *src) {
    struct Sub tmp;
    char *base;
    int i;
    int v0;
    int v1000;

    tmp = *(struct Sub *)self;            /* ldm/stm 6x4 + 2 : copy 0x68 out */
    Fill32(0, self, 0x16c);
    *(struct Sub *)self = tmp;             /* copy 0x68 back in */
    *(struct Sub *)((char *)self + 0x68) = *src;          /* 0x68 block from src */
    *(struct Sub *)((char *)self + 0xac) = *(struct Sub *)((char *)src + 0x1c); /* 0xc-byte tail (3 words) */

    v0 = 0;
    *(int *)((char *)self + 0xb8) = v0;
    *(int *)((char *)self + 0xbc) = v0;
    *(int *)((char *)self + 0xc0) = v0;
    v1000 = 0x1000;
    *(int *)((char *)self + 0xc4) = v1000;
    *(int *)((char *)self + 0xc8) = v1000;
    *(int *)((char *)self + 0xcc) = v1000;
    *(int *)((char *)self + 0xd0) = 0x1f0;
    *(int *)((char *)self + 0xd4) = v0;
    *(int *)((char *)self + 0xd8) = v0;

    base = (char *)self + 0x100;
    *(short *)(base + 0x62) = 2;
    *(short *)(base + 0x64) = 0;
    *(short *)(base + 0x6a) = (short)(((*(unsigned short *)(base + 0x6a) | 6) & ~1) | 1);
    *(short *)(base + 0x6a) = (short)(*(unsigned short *)(base + 0x6a) & ~0x20);
    *(short *)(base + 0x6a) = (short)((*(unsigned short *)(base + 0x6a) & ~0xf000) | 0xf000);

    for (i = 0; i < 6; i++) {
        *(short *)((char *)self + (i << 4) + 0x100) = (short)-1;
        *(unsigned char *)(base + 0x3 + i * 0x10) =
            (unsigned char)(*(unsigned char *)(base + 0x3 + i * 0x10) & ~1);
    }
    func_02025f00(self);
}
