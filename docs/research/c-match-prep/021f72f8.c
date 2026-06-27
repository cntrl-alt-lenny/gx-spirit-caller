/* CAMPAIGN-PREP candidate for func_021f72f8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     addls jump-table switch; case0 falls into case1; &&-chain guard; self+8 u16[idx]|=1<<sh; packed f8|fa<<16
 *   risk:       permuter-class: ALREADY .s-shipped reg-alloc wall (596B). Whole-fn callee-saved layout (r3-r5) + load scheduling across 4 states will differ; also 02257878 arity guessed (orig sets only r0,r1).
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
extern int  data_ov002_022cd744[];

extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022575c8(struct Self *self, int a, int b);
extern int  func_ov002_02259774(int a, int b, int c, int d);
extern int  func_ov002_022593f4(void);
extern void func_ov002_021ded30(u16 *p, int packed);
extern int  func_ov002_02257878(struct Self *self, int fn);
extern void func_ov002_021e7584(void);

int func_ov002_021f72f8(struct Self *self, struct Self *other) {
    int *state = (int *)(data_ov002_022ce288 + 1460);
    switch (*state) {
    case 0:
        self->fa = 0;
        self->f8 = 0;
        self->fc = 0;
        func_ov002_021ae400(self->b0, 0x3a);
        *state += 1;
        /* fall through */
    case 1:
        if (data_ov002_022cd744[self->b0] == 1 &&
            self->b0 == other->b0 &&
            func_ov002_022575c8(self, other->b0, other->b1)) {
            *(int *)(data_ov002_022d016c + 3436) = self->b0;
            func_ov002_02259774(other->b0, other->b1, 0, 0xb);
            *state += 1;
            return 0;
        }
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_021e7584);
        *state += 1;
        return 0;
    case 2:
        if (func_ov002_022593f4()) {
            int idx = *(int *)(data_ov002_022d016c + 3440);
            int sh  = *(int *)(data_ov002_022d016c + 3444) +
                      *(int *)(data_ov002_022d016c + 3448);
            u16 *arr = (u16 *)((char *)self + 8);
            self->fc = self->fc + 1;
            arr[idx] |= (1 << sh);
            if (data_ov002_022cd744[self->b0] == 1) {
                *state += 1;
                return 0;
            }
            if (func_ov002_02257878(self, (int)func_ov002_021e7584) != 0)
                *state -= 1;
            else
                *state += 1;
            return 0;
        }
        if (self->fc == 0)
            *state = 0;
        else
            *state += 1;
        return 0;
    case 3:
        func_ov002_021ded30((u16 *)self, self->f8 | (self->fa << 16));
        self->f8 = self->fc;
        *state += 1;
        return 0;
    default:
        return 1;
    }
}
