/* CAMPAIGN-PREP candidate for func_0221adcc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp-chain dispatch (no range-fuse); byte-resplit a/b; bitfield row validate; tail-call 021d90c0
 *   risk:       truncated asm ends at `bl 021d90c0` (no epilogue shown) so the state-2 tail is inferred as `return 021d90c0(...)`; its leftover-reg args (r1=row,r3) are guessed. permuter-class.
 *   confidence: low
 */
/* func_ov002_0221adcc (cls D): 3-way state dispatch on self+0xc. state 1 =
 * validate via 0223df38/0223de94 then 0225764c/021c2084/021de64c; state 2 =
 * the cf16c/cf1a4 row validate then tail-call 021d90c0; else return 0. */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 row : 5; u16 _r : 10; };

extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf1a4[];

extern int  func_ov002_021c2084(void *self, int a, int b, int d);
extern int  func_ov002_021d90c0(int player, int row, int hword);
extern int  func_ov002_021de64c(int a, int b, int c);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0223df38(void *self, int idx, int *out);
extern int  func_ov002_0225764c(int self, int a, int b);

int func_ov002_0221adcc(struct Self *self) {
    int state = *(u16 *)((char *)self + 0xc);
    if (state == 1) {
        int packed, a, b;
        if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
        packed = func_ov002_0223de94(self, 0);
        a = packed & 0xff;
        b = ((u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, a, b) == 0) return 0;
        if (func_ov002_021c2084(self, a, b, 1) == 0) return 0;
        func_ov002_021de64c((int)self, a, b);
        return 0;
    }
    if (state == 2) {
        int player = self->b0 & 1;
        int row = self->row;
        int word = *(int *)(data_ov002_022cf16c + player * 0x868 + row * 0x14 + 0x30);
        if ((unsigned)(*(u16 *)((char *)self + 4) << 17) >> 23 !=
            (((unsigned)(word << 2) >> 24) << 1) + ((unsigned)(word << 18) >> 31))
            return 0;
        if (*(u16 *)((char *)data_ov002_022cf1a4 + player * 0x868 + row * 0x14) == 0)
            return 0;
        return func_ov002_021d90c0(player, row, *(u16 *)((char *)self + 8));
    }
    return 0;
}
