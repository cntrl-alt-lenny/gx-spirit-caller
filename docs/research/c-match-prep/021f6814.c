/* CAMPAIGN-PREP candidate for func_021f6814 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch-on-state; bit0/:5 bitfields; bind d016c trio in callee-saved across void call; fn-ptr literal arg
 *   risk:       case0 reads self->b0 TWICE (orig 2 ldrh); mwcc likely CSEs to 1 load -> 1 ldrh diverges. reshape-able: re-read after first 0225935c arg, but borderline.
 *   confidence: med
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
};

extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];

extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_021decdc(struct Self *self, int a, int b);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_022575c8(struct Self *self, int a, int b);

int func_ov002_021f6814(struct Self *self) {
    int *state = (int *)(data_ov002_022ce288 + 1460);
    switch (*state) {
    case 0:
        func_ov002_021ae400(self->b0, 0x3a);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_022575c8);
        *state += 1;
        return 0;
    case 1:
        if (func_ov002_022593f4())
            *state += 1;
        else
            *state -= 1;
        return 0;
    case 2: {
        int a = *(int *)(data_ov002_022d016c + 3440);
        int b = *(int *)(data_ov002_022d016c + 3444);
        int c = *(int *)(data_ov002_022d016c + 3448);
        func_ov002_021e2b3c();
        func_ov002_021decdc(self, a, b + c);
        func_ov002_021decdc(self, self->b0, self->b1);
        func_ov002_021e2c5c();
        return 1;
    }
    default:
        return 1;
    }
}
