/* CAMPAIGN-PREP candidate for func_0204931c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind a in r4 across calls; obj=g->f0 reloaded after func_0204525c; b1d as u8 arg middle
 *   risk:       arg load order in asm is ldrb b1d (r1), ldr f30 (r2), ldr f2c (r3) then mov r0=a; if mwcc evaluates f2c (the callee) before the args it picks different temp regs. reshape-able by keeping callee-expr last; struct-guessed obj offsets.
 *   confidence: med
 */
/* func_0204931c (main, class C). g = *data_0219dc80.
 * If g==0 return. mov r4=a. If a==0 return. func_0204525c().
 * obj = g->f0; if obj->f0==0 || obj->f0==2 skip dispatch;
 * else (*obj->f2c)(a, (u8)obj->b1d, obj->f30). Always func_02048ed4() at end. */

typedef void (*Fn2c_t)(int a, int b1d, int f30);

typedef struct Obj0204931c {
    int            f0;          /* +0x00 state (0 or 2 skips) */
    char           _pad0[0x19];
    unsigned char  b1d;         /* +0x1d */
    char           _pad1[0xe];
    Fn2c_t         f2c;         /* +0x2c dispatch fn-ptr */
    int            f30;         /* +0x30 */
} Obj0204931c;

typedef struct State0204931c {
    Obj0204931c   *f0;          /* +0x00 sub-object */
} State0204931c;

extern State0204931c *data_0219dc80;
extern void func_0204525c(void);
extern void func_02048ed4(void);

void func_0204931c(int a) {
    if (data_0219dc80 == 0) return;
    if (a == 0) return;
    func_0204525c();
    {
        Obj0204931c *obj = data_0219dc80->f0;
        if (obj->f0 != 0 && obj->f0 != 2) {
            obj->f2c(a, obj->b1d, obj->f30);
        }
    }
    func_02048ed4();
}
