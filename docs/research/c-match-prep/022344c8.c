/* CAMPAIGN-PREP candidate for func_022344c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(*(int*)(g+0x5a8)-0x7a) jump-table; 0x868 table sel=1-bit0; status-const returns
 *   risk:       reshape-able/struct-guessed: addls dispatch order vs case-label emission may diverge (reorder cases to source-ascending); f14 bit tests (<<0x14/<<0x16) offsets inferred — confirm struct.
 *   confidence: low
 */
/* func_ov002_022344c8 (ov002, class D): global state dispatch on g+0x5a8 for
 * states 0x7a..0x80, returning status constants (0x7f/0x7e/0). cf16c/ce288 0x868
 * tables. Mirrors JPN 0223474c switch(*(int*)(g+0x5a8)) idiom + 021b8fc8 0x868. */
typedef unsigned short u16;

struct Self022344c8 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1 : 1;        /* placeholder for [r4+2]<<0x1f bit0 reuse */
    u16 rest : 14;
    char _pad4[0x10];
    unsigned int f14;  /* +0x14: bits via <<0x14 and <<0x16 tested */
};

extern char data_ov002_022ce288[];   /* g: g+0x5a8 = state */
extern char data_ov002_022cf178[];   /* _LIT2 table base */
extern char data_ov002_022d0e6c[];
extern int func_ov002_021ff3bc(void);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_0226afb4(int f0);
extern void func_ov002_0226b094(int v);
extern void func_ov002_022287c4(struct Self022344c8 *self, int arg);

int func_ov002_022344c8(struct Self022344c8 *self, int arg) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8) - 0x7a) {
    case 0:   /* .L_170 */
    default:
        return 0;
    case 1:   /* .L_164 */
        return 0;
    case 2:   /* .L_118 */
    case 4: { /* .L_118 */
        int b0 = self->bit0;
        int sel = 1 - b0;
        int v = *(int *)(data_ov002_022cf178 + (sel & 1) * 0x868);
        if (v != 0) func_ov002_0226afb4(self->f0);
        return *(int *)(data_ov002_022ce288 + 0x5a8) - 1;
    }
    case 3:   /* .L_d4 */
    case 5: { /* .L_d4 */
        int b0 = self->bit0;
        int sel = 1 - b0;
        int v = *(int *)(data_ov002_022cf178 + (sel & 1) * 0x868);
        if (v != 0) func_ov002_0226afb4(self->f0);
        return *(int *)(data_ov002_022ce288 + 0x5a8) - 1;
    }
    case 6: { /* .L_b0 */
        func_ov002_021e2b3c();
        func_ov002_0226b094(1 - self->bit0);
        return 0x7e;
    }
    case 7: { /* .L_40 */
        int sel, v;
        if (func_ov002_021ff3bc() == 0) return 0;
        func_ov002_022287c4(self, arg);
        if (self->bit0 != ((self->f14 >> 11) & 1)) return 0;
        if (self->bit0 == ((self->f14 >> 9) & 1)) return 0;
        sel = 1 - self->bit0;
        v = *(int *)(data_ov002_022cf178 + (sel & 1) * 0x868);
        if ((unsigned int)v >= 2) return 0x7f;
        return 0;
    }
    }
}
