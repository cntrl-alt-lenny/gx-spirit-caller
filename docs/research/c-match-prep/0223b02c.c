/* CAMPAIGN-PREP candidate for func_0223b02c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player mla stride; bitfield-insert RMW; row f22*2+f13 decode; store-order preserved
 *   risk:       permuter-class: dense liveness across 3 ldrh self->f4 reload/insert cycles + mla row base held in r3/r5; mwcc reg-alloc & the strh-insert sequence will diverge. struct-guessed: f2/f4 field widths.
 *   confidence: low
 */
/* func_ov002_0223b02c (ov002, class D): per-player row lookup + double bitfield-
 * insert RMW on self->f4 (clear bit1, set/clear bit3 from extracted bits), then a
 * row-entry vs self compare gate, then two dispatched sink calls. Store-order +
 * bitfield-insert heavy. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int  data_ov002_022cf16c[];
extern int  data_ov002_022cf184[];
extern int  func_ov002_021b00d0(int x);
extern void func_ov002_021d8904(void);
extern void func_ov002_021e16a4(int a, int b, int c, int d);

/* self->f2 carries player(bit0) and other 1/5-bit fields; self->f4 is a packed
 * u16 the body rewrites two single-bit fields in. */
struct Self {
    u16 f0;
    u16 player : 1;          /* f2 bit0 */
    u16 f2_b1  : 4;          /* f2 bits1..4 (read lsl#1a;lsr#1b => bits1..5? width5) */
    u16 f4_b0  : 1;          /* f4 bit0 */
    u16 f4_b1  : 1;          /* f4 bit1 (cleared via bic #2 path) */
    u16 f4_b2  : 1;          /* f4 bit2 */
    u16 f4_b3  : 1;          /* f4 bit3 (cleared via bic #8 path) */
};

/* row entry: 32-bit word; f13 at bit13 width1, f22 at bit22 width8. */
struct Row { u32 id : 13; u32 f13 : 1; u32 _p : 8; u32 f22 : 8; };

int func_ov002_0223b02c(struct Self *self, struct Self *other) {
    int idx = (self->f2_b1 & 0) + ((((int)self->player) & 1) * 0x868); /* placeholder; real idx below */
    char *cf184 = (char *)data_ov002_022cf184;
    char *cf16c = (char *)data_ov002_022cf16c;
    int p = ((int)*(u16 *)((char *)self + 2)) & 1;        /* (f2 & 1) */
    int slot = *(int *)(cf184 + p * 0x868);
    int v, row;
    struct Row *e;
    (void)idx;
    if (slot == 0) return 0;

    /* RMW self->f4 (other->f4): set bit1 from bit1 of (f4|2)>>? then clear bit3 */
    v = (int)(((u16)((u32)*(u16 *)((char *)other + 4) | 2)));
    *(u16 *)((char *)other + 4) =
        (u16)((v & ~4) | ((u32)((u32)(v << 0x1e) >> 0x1f) << 2));
    {
        u32 t = (u32)*(u16 *)((char *)other + 4);
        *(u16 *)((char *)other + 4) =
            (u16)((t & ~8) | (((t << 0x1d) >> 0x1f) << 3));
    }

    /* row compare gate */
    {
        u32 f2 = (u32)*(u16 *)((char *)other + 2);
        u32 f4 = (u32)*(u16 *)((char *)other + 4);
        int rp = (int)((f2 << 0x1f) >> 0x1f) & 1;
        int sub = (int)((f2 << 0x1a) >> 0x1b);
        int *rowbase = (int *)(cf16c + rp * 0x868 + sub * 0x14 + 0x30);
        e = (struct Row *)&rowbase[0];
        row = (int)(((u32)e->f22 << 1) + (((u32)((u32)((u32)e->id | ((u32)e->f13 << 13) | ((u32)e->_p << 14) | ((u32)e->f22 << 22)) << 0x12) >> 0x1f)));
        v = (int)((f4 << 0x11) >> 0x17);
        if (row != v) func_ov002_021d8904();
    }

    slot = *(int *)(cf184 + (((int)*(u16 *)((char *)self + 2)) & 1) * 0x868);
    v = func_ov002_021b00d0(slot);
    {
        int rp = ((int)*(u16 *)((char *)self + 2)) & 1;
        int *row2 = (int *)(cf16c + rp * 0x868);
        int w = *(int *)((char *)row2 + v * 4 + 0x3a0);
        func_ov002_021e16a4((int)((u32)(w << 0x13) >> 0x13), 0, 0, 0);
    }
    return 0;
}
