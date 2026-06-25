/* CAMPAIGN-PREP candidate for func_021b61dc (ov017, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf init: memset + struct-base chase + two sprite-spawn marshals
 *   risk:       struct-offset field chase (r4+f10+fc then +0x20 byte) and the +0x9f+0x700 fold may differ; data ptr deref
 *   confidence: med
 */
/* func_ov017_021b61dc: clear the 0x12c0 work block (func_0208df0c base),
 * kick a job (func_02001d0c), resolve a glyph id from the self struct
 * (self + self->f10 + self->fc, byte at +0x20, biased +0x79f), spawn its
 * sprite via func_0202c0c0, then submit it through func_02004f58.
 */

extern char data_02102c90[];
extern void func_02001d0c(void *a, int b, int c);
extern int func_02004f58(void *a, int b, void *c, int d, int e, int f);
extern int func_0202c0c0(int glyph);
extern char *func_0208df0c(void);
extern void func_02094504(int val, void *dst, int len);

void func_ov017_021b61dc(char *self) {
    int h;
    char *p;
    func_02094504(0, func_0208df0c() + 0x12c0, 0x12c0);
    func_02001d0c(data_02102c90, 0x1c, 5);
    p = self + *(int *)(self + 0x10) + *(int *)(self + 0xc);
    h = func_0202c0c0(*(unsigned char *)(p + 0x20) + 0x9f + 0x700);
    func_02004f58(data_02102c90, h, func_0208df0c() + 0x12c0, 1, 2, 0xc);
}
