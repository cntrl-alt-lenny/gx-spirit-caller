/* CAMPAIGN-PREP candidate for func_02234b4c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ==guard block + 1-bit field (no rsb) + reload bit0 twice + tail call
 *   risk:       0x14c4 is loaded once into a literal pool (_LIT1) and reused for both calls; mwcc should pool-share. self->bit0 reloaded twice (orig re-ldrh) — mwcc may CSE.
 *   confidence: med
 */
/* func_ov002_02234b4c: single state guard, bitfield args, then tail call.
 *   if (state == 0x80) {
 *       if 021b3ecc(self->bit0, 11, 0x14c4) != 0 return 0;
 *       021e276c(self->bit0, 0x14c4, 1, 0);
 *   }
 *   return 02228a9c(self, arg1);
 */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };

extern char data_ov002_022ce288[];
extern int  func_ov002_021b3ecc(int a, int b, int c);
extern void func_ov002_021e276c(int a, int b, int c, int d);
extern int  func_ov002_02228a9c(void *self, int arg1);

int func_ov002_02234b4c(struct S *self, int arg1) {
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x80) {
        if (func_ov002_021b3ecc(self->bit0, 11, 0x14c4) != 0) return 0;
        func_ov002_021e276c(self->bit0, 0x14c4, 1, 0);
    }
    return func_ov002_02228a9c(self, arg1);
}
