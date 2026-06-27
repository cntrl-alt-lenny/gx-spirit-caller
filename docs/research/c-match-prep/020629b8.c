/* CAMPAIGN-PREP candidate for func_020629b8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: byte hdr 0x64, halfword arg obj->h_66, tail bool
 *   risk:       obj->h_66 ldrh is scheduled after the strb's (between bl-setup) and f_90 offset is inferred; tail is movne r0,#0;strne;movne r0,#1. Field offsets struct-guessed; scheduling reshape-able.
 *   confidence: med
 */
/* func_020629b8 (cls D, size 0x68): build {0xfe,0xfe,0x64} packet, append the
 * object's h_66 halfword as the value, commit via func_02062280(obj,buf,5).
 * On success clear obj->f_90 and return 1, else 0.
 *
 * data_02101530 == 0xfefe read byte-wise.  Store order: hdr0, hdr1, 0x64.
 * func_02064490(buf, 3, obj->h_66) -> r2 = ldrh[r4,#0x66].
 */

typedef unsigned char  u8;
typedef unsigned short u16;

typedef struct Obj Obj;
struct Obj {
    char _pad0[0x66];
    u16  h_66;
    char _pad68[0x90 - 0x68];
    int  f_90;
};

extern int data_02101530;
extern int func_02064490(void *buf, int off, int val);
extern int func_02062280(Obj *obj, void *buf, int len);

int func_020629b8(Obj *obj)
{
    u8  buf[4];
    const u8 *hdr = (const u8 *)&data_02101530;

    buf[0] = hdr[0];
    buf[1] = hdr[1];
    buf[2] = 0x64;
    func_02064490(buf, 3, obj->h_66);
    if (func_02062280(obj, buf, 5) != 0) {
        obj->f_90 = 0;
        return 1;
    }
    return 0;
}
