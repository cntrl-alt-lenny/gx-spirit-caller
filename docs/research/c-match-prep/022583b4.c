/* CAMPAIGN-PREP candidate for func_022583b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     5-bit bitfield as (x<<16)&0x1f0000; sign (x<<31)&0x80000000; store-order
 *   risk:       permuter-class: in the arg!=0 path orig reuses the d78 value already in r1 (the cmp r1) to build the (x<<31) sign packing; if mwcc reloads d78 the and/orr reg sequence and operand order shift. Also d78-as-discriminant guess.
 *   confidence: low
 */
/* func_ov002_022583b4: class D state machine on pool field 0xd68.
 * State 0: call 021e25f0(d70,d78,arg), store result to 0xd7c, d68++.
 * State!=0: if arg!=0, branch on d78 (the value still in r1 from the
 * ldr at d78? -- actually the cmp r1 uses d78 loaded just before),
 * pack d7c/d60/d5c into args and call 021e3354 / 021e311c, then
 * call 0202b878(d5c); if ==0x16 call 021e2d20(d70,0x1a,1). Clear d50.
 * Pack here uses a 0x1f0000 (5-bit) field: (d7c & 0x1f)<<16.
 */
struct Pool022583b4 {
    char pad_d50[0xd50];
    int  f_d50;        /* 0xd50 */
    char pad_d54[0x8];
    int  f_d5c;        /* 0xd5c */
    int  f_d60;        /* 0xd60 */
    char pad_d64[0x4];
    int  f_d68;        /* 0xd68 */
    char pad_d6c[0x4];
    int  f_d70;        /* 0xd70 */
    char pad_d74[0x4];
    int  f_d78;        /* 0xd78 */
    int  f_d7c;        /* 0xd7c */
};
extern struct Pool022583b4 data_ov002_022d016c;
extern int  func_0202b878(int x);
extern int  func_ov002_021e25f0(int a, int b, int c);
extern void func_ov002_021e2d20(int r0, int r1, int r2);
extern int  func_ov002_021e311c(unsigned int r0, unsigned int r1, int r2, int r3);
extern int  func_ov002_021e3354(unsigned int r0, unsigned int r1, int r2, int r3);

void func_ov002_022583b4(int arg)
{
    if (data_ov002_022d016c.f_d68 == 0) {
        data_ov002_022d016c.f_d7c =
            func_ov002_021e25f0(data_ov002_022d016c.f_d70, data_ov002_022d016c.f_d78, arg);
        data_ov002_022d016c.f_d68 = data_ov002_022d016c.f_d68 + 1;
        return;
    }
    if (arg != 0) {
        if (data_ov002_022d016c.f_d78 != 0) {
            unsigned int r0 = (((unsigned int)data_ov002_022d016c.f_d78 << 31) & 0x80000000u)
                              | ((data_ov002_022d016c.f_d7c << 16) & 0x1f0000u)
                              | (data_ov002_022d016c.f_d5c & 0xffffu);
            unsigned int r1 = data_ov002_022d016c.f_d60 & 0xffffu;
            func_ov002_021e3354(r0, r1, 0, 0);
        } else {
            unsigned int r0 = (((unsigned int)data_ov002_022d016c.f_d78 << 31) & 0x80000000u)
                              | ((data_ov002_022d016c.f_d7c << 16) & 0x1f0000u)
                              | (data_ov002_022d016c.f_d5c & 0xffffu);
            unsigned int r1 = data_ov002_022d016c.f_d60 & 0xffffu;
            func_ov002_021e311c(r0, r1, 0, 0);
        }
        if (func_0202b878(data_ov002_022d016c.f_d5c) == 0x16) {
            func_ov002_021e2d20(data_ov002_022d016c.f_d70, 0x1a, 1);
        }
    }
    data_ov002_022d016c.f_d50 = 0;
}
