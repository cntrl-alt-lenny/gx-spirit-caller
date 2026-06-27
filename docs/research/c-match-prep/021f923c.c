/* CAMPAIGN-PREP candidate for func_021f923c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     asymmetric shift extract (lsl17/lsr23) raw cast; signed s16 then asr#8; b0/f5 bitfields feed cmp-chain flag
 *   risk:       the flag-build folds two bitfield compares into predicated cmps (cmp r1,r3,lsr#31; cmpeq r0,r1,lsr#27) producing moveq#1/movne#0; writing it as a C ternary may emit movne#1;moveq#0 (swapped) instead of the orig's moveq#1;movne#0, or break the cmpeq chaining. reshape-able (flip to if-assign flag=0; if(cond)flag=1) but the chained-cmp folding is finicky; struct-guessed on self+4 field bits
 *   confidence: low
 */
/* func_ov002_021f923c: self=arg0 (r4). Reads a 6-bit field at self+4
 * (lsl#17;lsr#23 = bits9..14), maps it via 021b947c -> r0. From r0 derives
 * a sign-extended byte 'cls' = (s16)r0 >> 8 & 0xff; if cls>4 done. Else look
 * at r0's low 16 bits: if (u16)r0 != 0, build a flag from self fields and
 * call 021df2c4(flag); else call 021deb28(player, field). Always return 1. */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cd3f4[];
extern int  func_ov002_021b947c(int a);
extern void func_ov002_021deb28(int a, int b);
extern void func_ov002_021df2c4(int a);

struct Ov002Self3 { u16 f0; u16 b0 : 1; u16 : 4; u16 f5 : 5; };

int func_ov002_021f923c(void *self) {
    struct Ov002Self3 *s = (struct Ov002Self3 *)self;
    int r = func_ov002_021b947c((u32)(*(u16 *)((char *)self + 4) << 17) >> 23);
    if (((((int)(r << 16) >> 16) >> 8) & 0xff) > 4)
        return 1;
    if ((u16)r != 0) {
        int flag = (*(int *)(data_ov002_022cd3f4 + 4) == s->b0 &&
                    *(int *)(data_ov002_022cd3f4 + 0x20) == s->f5) ? 1 : 0;
        func_ov002_021df2c4(flag);
    } else {
        func_ov002_021deb28(s->b0, s->f5);
    }
    return 1;
}
