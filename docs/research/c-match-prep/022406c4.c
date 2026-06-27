/* CAMPAIGN-PREP candidate for func_022406c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early guard then switch over 0x5b8 (addls pc branch-table); reload state per arm; bit0 shift
 *   risk:       the `addls pc,pc,r1,lsl#2` branch-table needs a dense 0..3 switch with default first in source — mwcc may emit cmp-chains instead unless cases are contiguous. The 0228df3c/021ae514/0225935c arg counts are struct-guessed. struct-guessed.
 *   confidence: low
 */
/* func_ov002_022406c4: if cd744[f2&1]==1, fire 0228df3c + 0223dad0 and return 1.
 * Else 5-way branch-table on ce288[0x5b8]: 0=>nop ret0, 1=>021ae400+0225935c,
 * 2=>022593f4 gate then 0223dcc0 (state++/--), 3=>021ae514, 4=>0223dad0+0226b0d0
 * ret1. Branch-table dispatch; large. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Ent022406c4 { u16 f0; u16 f2; };

extern char data_ov002_022cd744[];   /* int flag table */
extern char data_ov002_022ce288[];   /* +0x5b8 state */
extern char data_ov002_022d016c[];   /* +0xd44 / +0xd70 / +0xd74 / +0xd78 */
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021ae514(int a, int b, int c, int d, int e, int f);
extern void func_ov002_021e8a18(void);
extern void func_ov002_0223dad0(struct Ent022406c4 *self, int v);
extern void func_ov002_0223dcc0(struct Ent022406c4 *self, int a, int b);
extern void func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022593f4(void);
extern void func_ov002_0226b0d0(int a, u16 b, int c, int d);
extern void func_ov002_0228df3c(int a, int b);

int func_ov002_022406c4(struct Ent022406c4 *self) {
    int bit0 = (unsigned)((u16)self->f2 << 31) >> 31;
    int state;
    if (*(int *)(data_ov002_022cd744 + (bit0 << 2)) == 1) {
        func_ov002_0228df3c(0x10d3, (int)func_ov002_021e8a18);
        func_ov002_0223dad0(self, 1);
        return 1;
    }
    state = *(int *)(data_ov002_022ce288 + 0x5b8);
    switch (state) {
    case 0:
        return 0;
    case 1:
        func_ov002_021ae400(bit0, 0x65);
        func_ov002_0225935c((unsigned)((u16)self->f2 << 31) >> 31, self->f0, (int)func_ov002_021e8a18);
        *(int *)(data_ov002_022ce288 + 0x5b8) = *(int *)(data_ov002_022ce288 + 0x5b8) + 1;
        return 0;
    case 2:
        if (func_ov002_022593f4() == 0) {
            *(int *)(data_ov002_022ce288 + 0x5b8) = *(int *)(data_ov002_022ce288 + 0x5b8) - 1;
            return 0;
        }
        func_ov002_0223dcc0(self, *(int *)(data_ov002_022d016c + 0xd70),
                            *(int *)(data_ov002_022d016c + 0xd74) + *(int *)(data_ov002_022d016c + 0xd78));
        *(int *)(data_ov002_022ce288 + 0x5b8) = *(int *)(data_ov002_022ce288 + 0x5b8) + 1;
        return 0;
    case 3:
        func_ov002_021ae514(0x7f, 0x198, 0x198 + 1, 0, 0, 0xf);
        *(int *)(data_ov002_022ce288 + 0x5b8) = *(int *)(data_ov002_022ce288 + 0x5b8) + 1;
        return 0;
    default:
        func_ov002_0223dad0(self, (u16)(*(int *)(data_ov002_022d016c + 0xd44) + 1));
        func_ov002_0226b0d0(1 - bit0, self->f0, *(int *)(data_ov002_022d016c + 0xd44), 0);
        return 1;
    }
}
