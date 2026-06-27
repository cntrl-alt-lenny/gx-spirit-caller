/* CAMPAIGN-PREP candidate for func_021f7598 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clamp min unsigned (movcs); fc<n forced signed via (int)n; addls switch; asymmetric slot shifts u32; self+8 u16[p]|=1<<sum
 *   risk:       permuter-class: ALREADY .s-shipped reg-alloc wall (512B). r4-r7 distribution + scheduling across states + the unsigned-clamp/signed-fc-compare split (cap u32 vs blt) will not byte-match first build.
 *   confidence: low
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self {
    u16 f0;
    u16 b0  : 1;
    u16 b1  : 5;
    u16 b6  : 6;
    u16 b12 : 2;
    u16 f4;
    u16 f6;
    u16 f8;
    u16 fa;
    u16 fc;
};

extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];

extern u32  func_ov002_022577dc(struct Self *self);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern void func_ov002_021deb84(u16 *p, int packed);
extern int  func_ov002_022593f4(void);
extern void func_ov002_021e7584(void);

int func_ov002_021f7598(struct Self *self) {
    int *state;
    u32 n = func_ov002_022577dc(self);
    u32 cap = *(u32 *)(data_ov002_022cf17c + ((1 - self->b0) & 1) * 0x868);
    if (n >= cap) n = cap;
    state = (int *)(data_ov002_022ce288 + 1460);
    switch (*state) {
    case 0:
        self->fa = 0;
        self->f8 = 0;
        self->fc = 0;
        if (n == 0) return 0;
        func_ov002_021ae400(self->b0, 0x74);
        *state += 1;
        return 0;
    case 1:
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_021e7584);
        *state += 1;
        return 0;
    case 2:
        if (func_ov002_022593f4()) {
            int p   = *(int *)(data_ov002_022d016c + 3440);
            int sum = *(int *)(data_ov002_022d016c + 3444) +
                      *(int *)(data_ov002_022d016c + 3448);
            char *base = data_ov002_022cf16c + (p & 1) * 0x868;
            u32 slot = *(u32 *)(base + 0x30 + sum * 0x14);
            u16 *arr;
            func_ov002_0229ade0(0x28, p, sum,
                                (((slot << 2) >> 24) << 1) +
                                ((slot << 18) >> 31));
            arr = (u16 *)((char *)self + 8);
            arr[p] |= (1 << sum);
            self->fc = self->fc + 1;
            if (self->fc < (int)n)
                *state -= 1;
            else
                *state += 1;
            return 0;
        }
        if (self->fc == 0) {
            func_ov002_0229ade0(0x29, 0, 0, 0);
            *state = 0;
        } else {
            *state += 1;
        }
        return 0;
    case 3:
        func_ov002_021deb84((u16 *)self, self->f8 | (self->fa << 16));
        return 1;
    default:
        return 0;
    }
}
