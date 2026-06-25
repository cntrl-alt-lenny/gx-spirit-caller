/* CAMPAIGN-PREP candidate for func_022374e8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear leaf: 1-bit0 rsb + fn-ptr literal arg + chained call results
 *   risk:       fn-ptr passed via literal pool (_LIT0:.word 021e961c) — should match; 021e2b3c called with stale self in r0 (void decl emits bare bl, correct).
 *   confidence: high
 */
/* func_ov002_022374e8: straight leaf, no branches.
 *   021e2b3c();
 *   021df818(self, 1 - self->bit0, 300);
 *   r = 02257750(self, &func_ov002_021e961c);
 *   021de408(self, r);
 *   021e2c5c();
 *   return 0;
 */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };

extern void func_ov002_021e2b3c(void);
extern void func_ov002_021df818(void *self, int b, int c);
extern int  func_ov002_02257750(void *self, void *fn);
extern void func_ov002_021de408(void *self, int n);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_021e961c(void *self, int player, int idx);

int func_ov002_022374e8(struct S *self) {
    int r;
    func_ov002_021e2b3c();
    func_ov002_021df818(self, 1 - self->bit0, 300);
    r = func_ov002_02257750(self, (void *)func_ov002_021e961c);
    func_ov002_021de408(self, r);
    func_ov002_021e2c5c();
    return 0;
}
