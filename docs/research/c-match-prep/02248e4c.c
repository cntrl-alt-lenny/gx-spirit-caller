/* CAMPAIGN-PREP candidate for func_02248e4c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     struct entries base bind; stack temps frame[2]; nested counted loop; :19 mask shift
 *   risk:       struct-guessed: entry stride/offset (+0x418, count@+0x14) and the sp temps frame[2] layout are inferred from add r0,r8,#0x18/#0x400; loop-exit cmp vs count likely needs decl-order tweak (permuter-class on i/j reg pick).
 *   confidence: low
 */
typedef unsigned int u32;
typedef int s32;

extern u32 func_0202df78(u32 a, u32 b);
extern u32 func_ov002_021ca3f0(u32 a, u32 b);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[5];      /* +0x00 */
    u32 count;        /* +0x14 */
    u32 pad1;         /* +0x18 -> entries follow as [r0+0x18+0x400] */
    u32 hdr[0x100];   /* +0x18 .. fills to +0x418 (0x400 bytes) */
    u32 entries[1];   /* +0x418 = +0x18 + 0x400 */
};
/* sizeof(struct Tbl) must be 0x868; pad to size via union below */
struct TblPad { struct Tbl t; char _pad[0x868 - (int)sizeof(struct Tbl)]; };

extern struct TblPad data_ov002_022cf16c[2];
extern u32 data_ov002_022cf180[][0x868/4];

void func_ov002_02248e4c(u32 arg, u32 sel)
{
    int a, b;
    int i, j;
    u32 *e;
    struct Tbl *base;

    if (sel == 0x1294) {
        a = 0x1294 - 3;
        b = 0x1294 - 1;
    } else if (sel == 0x1631) {
        a = 0xfc9;
        b = 0x2340 - 0xfc9;
    } else {
        int stack[2];
        stack[0] = a; stack[1] = b;
        goto body;
    }
body:
    {
        int frame[2];
        frame[0] = a;
        frame[1] = b;
        if (data_ov002_022cf180[arg & 1][0] == 0)
            return;
        base = &data_ov002_022cf16c[arg & 1].t;
        e = &base->entries[0];
        for (i = 0; ; i++) {
            for (j = 0; j < 2; j++) {
                u32 id = (e[0] << 0x13) >> 0x13;
                if (func_0202df78(id, frame[j]) != 0 &&
                    func_ov002_021ca3f0(arg, frame[j]) != 0) {
                    func_ov002_02253458(arg, 0xe, i);
                    return;
                }
            }
            if ((u32)i + 1 >= base->count) break;
            e++;
        }
    }
}
