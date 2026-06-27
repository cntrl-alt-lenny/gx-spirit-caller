/* CAMPAIGN-PREP candidate for func_02241e74 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse if-chain (0/0xa/0xb); (h2>>6)&0x3f + bit0 bitfields; cd744[bit0] guard; store-order fieldA
 *   risk:       asm truncated mid case 0xb (.L_27c after 'mov r1,#0'); the bit13-vs-bit0 read (lsr#0x1f of h2<<0x1f = bit0) and the strneh/streqh ordering at .L_218 are the store-order/bitfield-sensitive points. struct-guessed + truncated-target.
 *   confidence: low
 */
/* func_ov002_02241e74  ov002  class D  MED  (asm TRUNCATED mid case 0xb / .L_27c)
 * sparse step machine (0, 0xa, 0xb) via cmp-chain; nested guards + h2 store.
 * recipe: if-chain (sparse states); (h2>>6)&0x3f bitfield; bit13; strh field-order.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct ObjE74 { u16 field0; u16 h2; u16 h4; u16 h6; u16 h8; u16 fieldA; }; /* [2] bitfields, [0xa] strh */
struct Glob5b8 { u8 pad[0x5b8]; s32 step; };
struct Glob_cd3f4 { s32 a; s32 b; };       /* _LIT1: [0]=a [4]=b */
struct Glob_d016c { u8 pad[0xd44]; s32 d44; };

extern struct Glob5b8    data_ov002_022ce288;
extern struct Glob_cd3f4 data_ov002_022cd3f4;
extern s32               data_ov002_022cd744[2];    /* _LIT2 table indexed by bit0 */
extern struct Glob_d016c data_ov002_022d016c;
extern void func_ov002_021ae484(int code);
extern int  func_ov002_02202d5c(void);
extern void func_ov002_0223f684(void);
extern void func_ov002_02240f88(void);
extern int  func_ov002_022577dc(void *obj);

extern int code_LIT4;   /* _LIT4 arg to 021ae484 in case 0xa else */

int func_ov002_02241e74(struct ObjE74 *obj, int r6)
{
    s32 step = data_ov002_022ce288.step;
    if (step == 0) {
        int r5 = (func_ov002_02202d5c() == 2);
        u16 h2 = obj->h2;
        int f6_6 = (h2 >> 6) & 0x3f;   /* (h2<<0x14)>>0x1a */
        int r4 = 0;
        if (f6_6 == 0x12) {
            int bit13 = (h2 >> 13) & 1;   /* (h2<<0x1f? ) -> actually h2<<0x1f lsr0x1f = bit0; here r1 lsl#0x1f lsr#0x1f = bit0 */
            if (data_ov002_022cd3f4.a == bit13 && data_ov002_022cd3f4.b == bit13) {
                if (func_ov002_022577dc(obj) != 0)
                    r4 = 1;
            }
        }
        if (r5 && r4) {
            data_ov002_022ce288.step = 0xa;
            return 0;
        }
        if (r5) obj->fieldA = 1; else obj->fieldA = 2;
        return 0;    /* b .L_294 epilogue (not shown) */
    }
    if (step == 0xa) {
        if (data_ov002_022cd744[ (obj->h2) & 1 ] == 1) {
            data_ov002_022d016c.d44 = 2;
        } else {
            func_ov002_021ae484(code_LIT4);
        }
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 0xb) {
        data_ov002_022d016c.d44 = 0;
        return 0;    /* TRUNCATED: .L_27c body after 'mov r1,#0' is cut */
    }
    return 0;
}
