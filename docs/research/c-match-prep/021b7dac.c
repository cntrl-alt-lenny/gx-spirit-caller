/* CAMPAIGN-PREP candidate for func_021b7dac (ov017, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     /2 signed plain '/'; if-assign flag clamp (cmp/cond chain); store word-then-halfword on stack in asm order
 *   risk:       permuter-class: the func_02005dac call discards its result region/args ambiguously and the stack frame layout (frame[4] alias) is struct-guessed; clamp branch order + sp slot offsets likely diverge first.
 *   confidence: low
 */
/* func_ov017_021b7dac: if (state==1 && f0==1) hit-test a point against a box derived
 * from a /2-centred X, set a flag, then build a draw command (packed word + halfword
 * on the stack) and submit it. Always returns 1.
 *
 *   base = self->f18 + ((0xc0 - self->f14)/2 - 8)
 *   func_02006110(&x,&y); flag = (x>=0x68 && y>=base+5 && x<0x98 && y<base+5+0x12)
 *   r = func_020061ac(); sel = (r && flag) ? 0x274 : 0x26c
 *   stk.w  = ((base-2)&0xff) | 0xc0614000
 *   stk.hw = (sel | 0x5400)
 *   func_020944a4(&stk, func_02005dac(2,0,...), 6)
 */

extern void func_02005dac(int a, int b, void *c);
extern void func_02006110(int *x, int *y);
extern int  func_020061ac(void);
extern void func_020944a4(void *buf, int r, int n);

typedef struct {
    int f0;
    int f4;
    char _pad8[0xc];
    int f14;
    int f18;
} St_021b7dac;

int func_ov017_021b7dac(St_021b7dac *self) {
    int base = self->f18 + ((0xc0 - self->f14) / 2 - 8);
    if (self->f4 == 1 && self->f0 == 1) {
        int x, y, r, sel, flag = 0;
        int top = base + 5;
        func_02006110(&x, &y);
        if (x >= 0x68 && y >= top) {
            if (x < 0x98 && y < top + 0x12) flag = 1;
        }
        r = func_020061ac();
        sel = 0x26c;
        if (r != 0 && flag != 0) sel = 0x274;
        {
            int stk0;
            unsigned short stk4;
            stk0 = ((base - 2) & 0xff) | 0xc0614000;
            stk4 = (unsigned short)(sel | 0x5400);
            {
                int res;
                struct { int w; unsigned short hw; } *bp;
                /* stack block: +0 word then +4 halfword (store order) */
                int frame[4];
                bp = (void *)frame;
                bp->w = stk0;
                bp->hw = stk4;
                res = 0;
                func_02005dac(2, 0, frame);
                func_020944a4(frame, res, 6);
            }
        }
    }
    return 1;
}
