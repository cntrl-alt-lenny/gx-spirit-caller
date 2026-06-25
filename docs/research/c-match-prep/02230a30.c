/* CAMPAIGN-PREP candidate for func_02230a30 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-load hoist, guard chain, byte-unpack, 6-arg call w/ stack args
 *   risk:       cd3f4[1]/[8] loads must hoist before the first call (callee-saved r4/r5); 02257594 called 1-arg vs its 2-arg .c.
 *   confidence: med
 */
/* func_ov002_02230a30: r4=cd3f4[1], r5=cd3f4[8]; gate 02257594(self); gate
 * 0223df38(self,0,0); 0223de94(self,0) -> packed; b0/b1 bytes; gate 0225764c;
 * c=021c8470(b0,b1); 021d5a08(self,r4,r5,self->f0,4,(u16)c). return 0. */
typedef unsigned short u16;
typedef unsigned char u8;

struct S02230a30 { u16 f0; };

extern int data_ov002_022cd3f4[];
extern int func_ov002_02257594(void *self);
extern int func_ov002_0223df38(void *self, int idx, int *out);
extern u16 func_ov002_0223de94(void *self, int idx);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021d5a08(void *self, int a, int b, int c, int d, int e);

int func_ov002_02230a30(struct S02230a30 *self) {
    int r4, r5, packed, b0, b1, c;
    r4 = data_ov002_022cd3f4[1];
    r5 = data_ov002_022cd3f4[8];
    if (func_ov002_02257594(self) == 0) return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    packed = func_ov002_0223de94(self, 0);
    b0 = packed & 0xff;
    b1 = ((u16)packed >> 8) & 0xff;
    if (func_ov002_0225764c(self, b0, b1) == 0) return 0;
    c = func_ov002_021c8470(b0, b1);
    func_ov002_021d5a08(self, r4, r5, self->f0, 4, (u16)c);
    return 0;
}
