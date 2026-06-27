/* CAMPAIGN-PREP candidate for func_0223dcc0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player base mla; bitfield counter; asymmetric raw shifts; preserve guard order
 *   risk:       _LIT2 base for the record `add r0,r0,#0x30; ldr [r0,r4]` is struct-guessed (assumed cf16c); the 5/6/8 reg liveness across 3 calls is reg-alloc walled. permuter-class + struct-guessed.
 *   confidence: low
 */
/* func_ov002_0223dcc0: guard (counter<5 -> 0223db04 init; ==5 -> seed ring),
 * compute a slot value via 021d86fc, bump self->hdr.count, then conditional
 * tail dispatches (021b9ecc / 021d59cc). 3 args (self, a, b); r3 dead. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Ent0223dcc0 {
    u16 f0;
    u16 f2;
    u16 f4;
    struct { u16 lo:8; u16 count:8; } hdr;   /* +6 */
    u16 ring[5];                              /* +8 */
};

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern void func_ov002_0223db04(struct Ent0223dcc0 *self, int a, int b);
extern void func_ov002_021d86fc(int a, int b, int c, int d);
extern int  func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021d59cc(int a, int b, int c, int d, int e);

int func_ov002_0223dcc0(struct Ent0223dcc0 *self, int a, int b) {
    int count = self->hdr.count;
    int rec;
    int t;
    if (count < 5) {
        func_ov002_0223db04(self, a, b);
    } else if (count == 5) {
        self->ring[count] = (u16)*(int *)(data_ov002_022ce288 + 0x494);
    }
    rec = *(int *)(data_ov002_022cf16c + (a & 1) * 0x868 + b * 20 + 0x30);
    t = ((unsigned)((u16)rec << 2) >> 24) * 2 + ((unsigned)((u16)rec << 18) >> 31);
    func_ov002_021d86fc(a, b, t, self->hdr.count & 0xff);
    self->hdr.count = (self->hdr.count + 1) & 0xff;
    if (*(u16 *)(data_ov002_022cf16c + (a & 1) * 0x868 + b * 20) == 0) return 0;
    if (b > 4) return 0;
    rec = func_ov002_021b9ecc(a, b);
    if (rec != *(int *)data_ov002_022cf1a4 && rec != *(int *)data_ov002_022cf1a4 + 2) return 0;
    func_ov002_021d59cc(a, b, *(int *)data_ov002_022cf1a4, 2, (self->f4 << 17 >> 23));
    return 0;
}
