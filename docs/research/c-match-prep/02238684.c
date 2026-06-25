/* CAMPAIGN-PREP candidate for func_02238684 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     word+0x14 low-9 as :9 bitfield (shift pair, not and); unpack b before a (decl order); mla base +0x418+hi*4
 *   risk:       the +0x14 arg uses lsl#23;lsr#23 — only a :9 bitfield emits that; a plain &0x1ff folds to one 'and' and diverges. struct-guessed: the :9 field at +0x14 and the +0x418 store offset are inferred; confirm against the real struct.
 *   confidence: med
 */
/* func_ov002_02238684: unpack 021b947c(low-9-bits of word+0x14) into a/b/hi;
 * if b==0xe, store via 021d7d0c(self, a, per-player row + 0x418 + hi*4).
 * Returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self { struct { unsigned f14 : 9; } f14w; };

extern int func_ov002_021b947c(int v);
extern int func_ov002_021d7d0c(void *self, int a, int ptr);
extern char data_ov002_022cf16c[];

int func_ov002_02238684(void *arg0) {
    int v, a, b;
    unsigned hi;
    v = func_ov002_021b947c(((struct Self *)((char *)arg0))->f14w.f14);
    b  = ((u16)v >> 8) & 0xff;
    a  = v & 0xff;
    hi = (u16)(v >> 16);
    if (b == 0xe) {
        char *base = data_ov002_022cf16c + (a & 1) * 0x868;
        func_ov002_021d7d0c(arg0, a,
                            (int)(base + 0x418 + hi * 4));
    }
    return 0;
}
