/* CAMPAIGN-PREP candidate for func_0227aa80 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: packed-header bitfield struct; b5/b6 if-assign; :15 slot field; u16 table *4; field store-order
 *   risk:       orig FUSES bit0+f1+b5/b6 then the f8/f23 insert into single load-modify-store cycles; per-field bitfield assigns split into multiple bic;orr;str RMW cycles. permuter-class (per brief 358 the fused-RMW + reg residue is .s-only).
 *   confidence: low
 */
/* func_ov002_0227aa80 (ov002, class D, MED) — packed-field RMW state setup.
 * word@0x0 of data_022cd300 is a packed header (bit0 player, :4 kind, b5/b6
 * flags, :15 slot value @bit8, :9 index @bit23); also +0x16 mode field, +0x4
 * flag halfword, +0x8/+0x9 bytes. d0250 is a u16 table indexed [arg1*4 bytes]. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Hdr300 { u32 b0:1; u32 f1:4; u32 b5:1; u32 b6:1; u32 b7:1; u32 f8:15; u32 f23:9; };
struct F30016 { u16 lo8:8; u16 mode:3; u16 hi:5; };

extern char data_ov002_022cd300[];
extern u16  data_ov002_022d0250[];   /* u16 table, byte stride 4 */
extern int  func_ov002_021bb068(int id);
extern void func_ov002_02254a2c(int a);
extern void func_ov002_0227a8fc(void);

int func_ov002_0227aa80(int a, int b, int c, int d, int e)
{
    struct Hdr300 *h = (struct Hdr300 *)data_ov002_022cd300;
    if (c < 0)
        return 0;
    h->b0 = a;
    h->f1 = c;
    if (e != 0) {
        h->b5 = 1;
        h->b6 = 0;
        h->b7 = 0;
    } else {
        h->b5 = 0;
        h->b6 = 1;
        h->b7 = 0;
    }
    if (func_ov002_021bb068(0x135d) != 0)
        h->b5 = 1;
    if (d == 0) {
        data_ov002_022cd300[8] = 0;
        data_ov002_022cd300[9] = 0;
    }
    h->f8 = *(u16 *)((char *)data_ov002_022d0250 + b * 4);
    h->f23 = b;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->mode = 1;
    *(u16 *)(data_ov002_022cd300 + 4) = 0;
    if (data_ov002_022cd300[8] != 0)
        *(u16 *)(data_ov002_022cd300 + 4) |= 1;
    func_ov002_02254a2c(a);
    func_ov002_0227a8fc();
    return 0;
}
