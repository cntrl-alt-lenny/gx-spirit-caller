/* CAMPAIGN-PREP candidate for func_02243138 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sequential-cmp switch; mul(*20)+mla((rec&1)*0x868+base) index; (u16) wrap; bit0 bitfield
 *   risk:       the *(u16*)(idx*20 + (rec&1)*0x868 + cf1a2): mwcc may not fuse exactly to orig's mul+mla(r4,0x868,cf1a2) and may CSE the base; reshape-able (inline product, don't bind base) but mla-fusion is finicky. arg3=0x198+1 folds to mov vs orig add r2,r1,#1 (minor).
 *   confidence: low
 */
/* func_ov002_02243138: ov002 2-state step machine (state at
 * data_ov002_022ce288+0x5b8). case 0 computes a u16 table index via
 * mul(idx*20) + mla((b0&1)*0x868 + cf1a2 base); writes it to d016c+0xd44. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021ae514(int a, int b, int c, int d, int e, int f);
extern void func_ov002_0223dad0(int a);
extern int  func_ov002_0226b0d0(int a, int b, int c, int d);

int func_ov002_02243138(struct Ov002Self *self) {
    int sel;
    int rec;

    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
        sel = self->b0;
        if (data_ov002_022cd744[sel] != 1) {
            func_ov002_021ae514(0x7f, 0x198, 0x198 + 1, 0, 0, 0xf);
        } else {
            rec = *(int *)(data_ov002_022cd3f4 + 0x4);
            if (rec == sel) {
                *(int *)(data_ov002_022d016c + 0xd44) = 0;
            } else {
                *(int *)(data_ov002_022d016c + 0xd44) =
                    *(u16 *)(*(int *)(data_ov002_022cd3f4 + 0x20) * 20 +
                             ((rec & 1) * 0x868 + (int)data_ov002_022cf1a2));
            }
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 1:
        func_ov002_0223dad0((u16)(*(int *)(data_ov002_022d016c + 0xd44) + 1));
        func_ov002_0226b0d0(1 - self->b0, self->f0,
                            *(int *)(data_ov002_022d016c + 0xd44), self->b0);
        return 1;
    }
    return 0;
}
