/* CAMPAIGN-PREP candidate for func_02225788 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fc switch; (player&1)*0x868 runtime-mul byte index; bit0; guarded call
 *   risk:       mwcc may strength-reduce *0x868 differently than orig load+mul; 021e286c return ignored ok
 *   confidence: med
 */
/* func_ov002_02225788: dispatch on fc@0xc; each case indexes the per-player
 * count table cf17c by (player&1)*0x868 (byte stride) and, if nonzero, calls
 * 021e286c(player). case1 player=f2.b0; case2 player=1-f2.b0. return 0. */
typedef unsigned short u16;

struct F02225788_Self {
    u16 f0; u16 bit0 : 1; u16 rest : 15;
    u16 _4; u16 _6; u16 _8; u16 _a; u16 fc;
};

extern int  data_ov002_022cf17c[];
extern int  func_ov002_021e286c(int arg0);

int func_ov002_02225788(struct F02225788_Self *self) {
    switch (self->fc) {
    case 1:
        if (*(int *)((char *)data_ov002_022cf17c + (self->bit0 & 1) * 0x868) != 0)
            func_ov002_021e286c(self->bit0);
        break;
    case 2:
        if (*(int *)((char *)data_ov002_022cf17c + ((1 - self->bit0) & 1) * 0x868) != 0)
            func_ov002_021e286c(1 - self->bit0);
        break;
    }
    return 0;
}
