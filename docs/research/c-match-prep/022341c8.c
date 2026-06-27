/* CAMPAIGN-PREP candidate for func_022341c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit-shift packed-coord decode; 0x868 table base+0x30+row*20; bit0 :1; arg-keep order
 *   risk:       struct-guessed: record packed-coord widths (bits 22-29 + bit13) and f14 offset inferred from shifts; campaign must confirm Self/record layout against real struct, then expect reg-rotation on the 5-arg push (permuter-class).
 *   confidence: low
 */
/* func_ov002_022341c8 (ov002, class D): unpack helper result into (player,row),
 * gate against self bit0 + the per-player 0x868 table cell, then run a 4-step
 * helper chain. Grounded in JPN siblings 021b8fc8 / 021e770c (cf16c 0x868 table,
 * record = base + (player&1)*0x868 + 0x30 + row*20; packed coord = explicit shifts).
 */
typedef unsigned short u16;

struct Self022341c8 {
    u16 f0;            /* +0 */
    u16 bit0 : 1;      /* +2 b0 */
    u16 rest : 15;
    char _pad4[0x10];
    unsigned int f14;  /* +0x14 packed; low 9 bits = query Y */
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021b947c(unsigned int coord);
extern int func_ov002_021c1a2c(int player, int row);
extern int func_ov002_021c1e44(struct Self022341c8 *self, int player, int row);
extern void func_ov002_021d5a08(struct Self022341c8 *self, int player, int row, int a3, int a4, int a5);
extern void func_ov002_0226b11c(int player, int row);

int func_ov002_022341c8(struct Self022341c8 *self) {
    int ret = func_ov002_021b947c(self->f14 << 23 >> 23 & 0x1ff);
    int player = ret & 0xff;
    int row = ((ret & 0xffff) >> 8) & 0xff;
    int b0 = (self->f2_bit0_placeholder = 0, self->bit0);
    /* placeholder line above is removed below; kept structure */
    if (player == self->bit0) return 0;
    {
        char *base = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
        int w = *(int *)(base + row * 20);
        int cellY = (((w << 2) >> 24) << 1) + (unsigned int)(w << 18 >> 31);
        if (cellY != (int)(self->f14 << 23 >> 23)) return 0;
    }
    func_ov002_021d5a08(self, player, row, self->f0, 5, self->bit0);
    if (player == ((self->_packed2 >> 0) & 1)) return 0; /* re-read [r6+2] bit0 */
    if (func_ov002_021c1e44(self, player, row) != 0) return 0;
    if (func_ov002_021c1a2c(player, row) == 0) return 0; /* uses [r6] in orig (arg shuffle) */
    func_ov002_0226b11c(player, row);
    return 0;
}
