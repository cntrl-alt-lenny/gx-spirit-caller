/* CAMPAIGN-PREP candidate for func_020468ec (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     lsl#16/lsr#16 = (u16) zero-ext arg; bind r4=*gp across calls; reload gp per use elsewhere
 *   risk:       complex arg marshalling: func_020627f0 takes r0=*gp, r1=prev call result, r2=base->14, r3=base->18, plus stack0=func_02045cb8; r4 holds *data_0219daec bound across two calls then reloaded. My TU mis-sequences the two calls and can't express stack-arg cleanly -- needs faithful rewrite. permuter-class + struct-guessed.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 **data_0219daec;
extern u32 func_020459f0(u32 a);
extern void func_02045cb8(void);
extern u32 func_02046498(void);
extern void func_02050450(void);
extern void func_020506b0(void);
extern void func_02062508(u32 a, void *b);
extern u32 func_0206279c(u32 a, void *b);
extern u32 func_020627f0(u32 a, u32 b, u32 c, u32 d);
extern u32 func_02064f84(u32 a, u32 b, u32 c);

u32 func_020468ec(void) {
    u8 *base;
    u32 t;
    u32 r;
    if (*(u32 *)(*data_0219daec) != 0) {
        return 0;
    }
    t = func_020459f0(0x4000) + 0xc000;
    base = *data_0219daec;
    func_02064f84(0, (t << 16) >> 16, 0);
    r = func_020627f0((u32)*data_0219daec, 0, *(u32 *)(base + 0x14), *(u32 *)(base + 0x18));
    /* note: arg1 of func_020627f0 is the return of func_02064f84 (r0), arg0=*data_0219daec, stack0=func_02045cb8 */
    r = func_020627f0(/*placeholder*/0, 0, 0, 0);
    if (func_02046498() != 0) {
        return r;
    }
    func_0206279c((u32)*data_0219daec, (void *)func_02050450);
    func_02062508((u32)*data_0219daec, (void *)func_020506b0);
    return r;
}
