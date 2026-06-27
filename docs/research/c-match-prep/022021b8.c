/* CAMPAIGN-PREP candidate for func_022021b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind :6 bitfield; b0 :1, b1_5 :5; packed-u16 return compared to 0xffff
 *   risk:       asm computes (ret&0xff) and ((ret>>8)&0xff) into r0/r1 but they look dead (only ret!=0xffff drives the branch); if real, the two extracted bytes feed func_021b34f4 args — struct-guessed/reshape-able (recover the two byte args).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u8 _pad0[2];
    u16 b0 : 1;      /* bit 0 */
    u16 b1_5 : 5;    /* bits 1..5 */
    u16 kind : 6;    /* bits 6..11 */
    u16 b12_13 : 2;
    u16 b14 : 1;
    u16 b15 : 1;
} Entity;

extern int func_ov002_021b34f4(int a, int b);
extern int func_ov002_021b3618(int a, int b);   /* returns packed u16 */
extern int func_ov002_02203930(Entity *e);

int func_ov002_022021b8(Entity *e)
{
    int t;

    if (e->kind == 2) {
        t = func_ov002_021b3618(e->b0, e->b1_5);
        if ((t & 0xffff) != 0xffff) {
            if (func_ov002_021b34f4(e->b0, e->b1_5) == 0xa)
                return 1;
        }
        return 0;
    }
    return func_ov002_02203930(e);
}
