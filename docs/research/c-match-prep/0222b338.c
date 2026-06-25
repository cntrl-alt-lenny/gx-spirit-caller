/* CAMPAIGN-PREP candidate for func_0222b338 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two bitfield-arg calls (f2 reloaded), >=0 guard, tail-ish call
 *   risk:       interleaved f0 load vs f2 extracts may reschedule; f2 reload between the two calls must hold; 021df818 r2=0xbb8.
 *   confidence: med
 */
/* func_ov002_0222b338: 021b4120(b0,f1,f0) -> r; 021de480(b0,f1,0,0) (f2 reloaded);
 * if r>=0, 021df818(self,r,0xbb8). return 0. */
typedef unsigned short u16;

struct S0222b338 {
    u16 f0;       /* +0 */
    u16 b0 : 1;   /* +2 bit0 */
    u16 f1 : 5;   /* +2 bits[5:1] -> lsl#26;lsr#27 */
    u16 _r : 10;
};

extern int func_ov002_021b4120(int a, int b, int c);
extern int func_ov002_021de480(int a, int b, int c, int d);
extern void func_ov002_021df818(void *self, int a, int b);

int func_ov002_0222b338(struct S0222b338 *self) {
    int r = func_ov002_021b4120(self->b0, self->f1, self->f0);
    func_ov002_021de480(self->b0, self->f1, 0, 0);
    if (r >= 0)
        func_ov002_021df818(self, r, 0xbb8);
    return 0;
}
