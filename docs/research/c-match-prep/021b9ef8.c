/* CAMPAIGN-PREP candidate for func_021b9ef8 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order state fields; branch-table switch all-cases-named; bind self base; per-mode flag byte
 *   risk:       permuter-class: orig allocates THREE distinct '1' regs (r0/r1/r7) for the per-mode tst branches; mwcc reuses one reg, diverging the movne source. Already shipped as .s (brief 302 wall).
 *   confidence: low
 */
/* func_ov006_021b9ef8 — per-state init: Fill32 the struct, seed state words,
 * branch-table select of render flags, then a 5-element loop that sets bit0 of
 * each element's +0x20 word from a per-mode flag byte (data_02104f54[mode-sel]). */
typedef unsigned char  u8;
typedef unsigned int   u32;

extern void Fill32(int val, void *dst, u32 size);
extern char data_021040ac[];
extern u8   data_02104f54[];
extern char data_ov006_0225c4dc[];

typedef struct {
    char _pad0[0x38];
    int  f38;            /* 0x38 */
    int  f3c;            /* 0x3c */
    int  mode;           /* 0x40 */
    char _pad44[0x04];
    int  f48;            /* 0x48 */
    int  f4c;            /* 0x4c */
    int  f50;            /* 0x50 */
    char _pad54[0x10];
    int  f64;            /* 0x64 */
    int  f68;            /* 0x68 */
    int  f6c;            /* 0x6c */
    char _pad70[0x04];
    int  f74;            /* 0x74 */
    char _pad78[0x28];
    struct { int a, b, c; char _p[0x14]; int f20; } elem[5]; /* 0xa0, stride 0x24 */
} Ov006InitS;

int func_ov006_021b9ef8(Ov006InitS *self, int mode, int arg) {
    int i;
    self->f38 = 0;
    self->f3c = 0;
    Fill32(0, data_ov006_0225c4dc, 0x674);
    if (mode != 1) arg = 0;
    self->mode = mode;
    self->f74 = arg;
    if (arg != 0) {
        self->f64 = *(int *)(data_021040ac + 0x38);
        self->f68 = 0;
        self->f6c = 0xb4;
    }
    self->f48 = 1;
    switch (self->mode) {
    case 3: case 6: case 7:
        self->f4c = 0;
        self->f50 = 0;
        break;
    case 4:
        self->f4c = 1;
        self->f50 = 1;
        break;
    default:
        self->f4c = 0;
        self->f50 = 1;
        break;
    }
    for (i = 0; i < 5; i++) {
        self->elem[i].a = 0;
        self->elem[i].b = 0;
        self->elem[i].c = 0;
        if (self->mode == 5)
            self->elem[i].f20 = (self->elem[i].f20 & ~1) | ((data_02104f54[1] & (1 << i)) ? 1 : 0);
        else if (self->mode == 6)
            self->elem[i].f20 = (self->elem[i].f20 & ~1) | ((data_02104f54[2] & (1 << i)) ? 1 : 0);
        else
            self->elem[i].f20 = (self->elem[i].f20 & ~1) | ((data_02104f54[0] & (1 << i)) ? 1 : 0);
    }
    return 1;
}
