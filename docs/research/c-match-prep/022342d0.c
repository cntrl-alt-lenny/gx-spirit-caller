/* CAMPAIGN-PREP candidate for func_022342d0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     !=guard tail-call + global reload@5ac + two calls (rsb vs no-rsb asymmetry)
 *   risk:       self->f8>>1 reloads h@+8 each call (orig re-ldrh); mwcc might CSE the two loads into one reg. f8 offset 0x8 guessed.
 *   confidence: med
 */
/* func_ov002_022342d0: state guard then two near-identical 021df818 calls.
 *   if (state != 0x78) return 02216180(self);
 *   021e2b3c();
 *   021de408(self, *(int*)(data+0x5ac));
 *   021df818(self, 1 - self->bit0, self->f8 >> 1);   // 1st: rsb (1-bit0)
 *   021df818(self,     self->bit0, self->f8 >> 1);   // 2nd: no rsb (bit0)
 *   021e2c5c();
 *   return 0;
 */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; u16 _pad4; u16 _pad6; u16 f8; };

extern char data_ov002_022ce288[];
extern int  func_ov002_02216180(void *self);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021de408(void *self, int n);
extern void func_ov002_021df818(void *self, int b, int c);
extern void func_ov002_021e2c5c(void);

int func_ov002_022342d0(struct S *self) {
    if (*(int *)(data_ov002_022ce288 + 0x5a8) != 0x78)
        return func_ov002_02216180(self);
    func_ov002_021e2b3c();
    func_ov002_021de408(self, *(int *)(data_ov002_022ce288 + 0x5ac));
    func_ov002_021df818(self, 1 - self->bit0, self->f8 >> 1);
    func_ov002_021df818(self, self->bit0, self->f8 >> 1);
    func_ov002_021e2c5c();
    return 0;
}
