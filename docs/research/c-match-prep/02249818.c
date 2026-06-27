/* CAMPAIGN-PREP candidate for func_02249818 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     multi-guard chain; bitfield col=:8 row=signed:1; lim const; count@+0x10
 *   risk:       struct-guessed + permuter-class: the r12-pack arg to func_021b3fd8 (mov r3,col<<1; add r3,r3,row>>31; r2=0x12a1; r1=0xb) is fragile — operand order/reg assignment of the 4 args likely rotates. col=(r<<2)>>0x18 and row sign bit are :8/:1 guesses.
 *   confidence: low
 */
typedef unsigned int u32;
typedef int s32;

extern u32 func_0202e234(u32 id);
extern s32 func_0202b950(u32 id);
extern u32 func_0202b890(u32 id);
extern u32 func_ov002_021ca440(u32 a, u32 b);
extern u32 func_ov002_021b3fd8(u32 a, u32 b, u32 c, u32 d);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[4];     /* +0x00 */
    u32 count;       /* +0x10 */
    u32 pad1[0x93];  /* +0x14 .. +0x260 */
    u32 entries[1];  /* +0x260 */
};

extern struct Tbl data_ov002_022cf16c[2];
extern u32 data_ov002_022cf17c[][0x868/4];

void func_ov002_02249818(u32 arg, u32 other)
{
    s32 lim;
    int i;
    u32 *e;
    struct Tbl *base;
    u32 a, b;

    i = 0;
    if (data_ov002_022cf17c[arg & 1][0] == 0)
        return;
    lim = 0x12a1 - 0x28c;
    base = &data_ov002_022cf16c[arg & 1];
    e = &base->entries[0];
    do {
        u32 raw = e[0];
        u32 id = (raw << 0x13) >> 0x13;
        if (func_0202e234(id) != 0 &&
            func_0202b950(id) <= lim) {
            a = func_0202b890(id);
            b = func_0202b890(other);
            if (a == b && func_ov002_021ca440(arg, id) != 0) {
                u32 r = e[0];
                u32 col = (r << 2) >> 0x18;
                s32 row = (s32)(r << 0x12) >> 0x1f;
                if (func_ov002_021b3fd8(arg, 0xb, col * 2 + (u32)row, 0x12a1) == 0) {
                    func_ov002_02253458(arg, 0xd, i);
                }
            }
        }
        i++;
        e++;
    } while ((u32)i < base->count);
}
