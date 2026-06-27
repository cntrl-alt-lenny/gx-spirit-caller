/* CAMPAIGN-PREP candidate for func_0227adcc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: header bitfields; cond strb pair; mode=4; +0x6 = re-extracted :15; equality-OR sets +0x4 bit4
 *   risk:       orig stores +0x4 (=5) and the bit4-OR as ONE strh after a cmp;cmpne chain (f6==0x1578||==0x1a92); mwcc may emit a movcc/extra strh diverging. The +0x6 derivation and 021b9aa8 2nd arg struct-guessed. Header fusion = permuter-class.
 *   confidence: low
 */
/* func_ov002_0227adcc (ov002, class D, MED) — packed-field RMW chain + cond store.
 * Packs header into data_022cd300 (bit0 player, :4 kind, b5=1, b7 from arg3,
 * :15 slot @bit8 from d0250[arg1*4], :9 index @bit23=arg1), conditional zero of
 * +0x8/+0x9 when arg4==0, sets +0x16 mode=4, computes +0x6 field, compares it
 * against 0x1578/0x1a92 to set +0x4 bit4, then guarded 021b9aa8/02254a2c. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Hdr300 { u32 b0:1; u32 f1:4; u32 b5:1; u32 b6:1; u32 b7:1; u32 f8:15; u32 f23:9; };
struct F30016 { u16 lo8:8; u16 mode:3; u16 hi:5; };

extern char data_ov002_022cd300[];
extern u16  data_ov002_022d0250[];
extern int  func_ov002_021b9aa8(int a, int b);
extern void func_ov002_02254a2c(int a);
extern void func_ov002_0227a8fc(void);

int func_ov002_0227adcc(int a, int b, int c, int d, int e)
{
    struct Hdr300 *h = (struct Hdr300 *)data_ov002_022cd300;
    u16 f6;
    if (c < 0)
        return 0;
    h->b0 = a;
    h->f1 = c;
    h->b5 = 1;
    h->b6 = 0;
    h->b7 = d;
    if (e == 0) {
        data_ov002_022cd300[9] = 0;
        data_ov002_022cd300[8] = 0;
    }
    h->f8 = *(u16 *)((char *)data_ov002_022d0250 + b * 4);
    h->f23 = b;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->mode = 4;
    f6 = (u16)(((u32)*(u32 *)data_ov002_022cd300 << 9) >> 0x11);  /* :15 field re-read into +0x6 */
    *(u16 *)(data_ov002_022cd300 + 6) = f6;
    *(u16 *)(data_ov002_022cd300 + 4) = 4 | 1;
    if (f6 == 0x1578 || f6 == 0x1a92)
        *(u16 *)(data_ov002_022cd300 + 4) |= 0x10;
    if (func_ov002_021b9aa8(a, 0) >= 0)
        func_ov002_02254a2c(a);
    func_ov002_0227a8fc();
    return 0;
}
