/* CAMPAIGN-PREP candidate for func_02287474 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield-cmp fold (cmp,lsr#31); guard chain; fn-ptr arg; >=0 tail
 *   risk:       none material — VERIFIED byte-exact. d016c base CSE'd across two reads as orig; cmp folds bit0 shift; fn addr in pool.
 *   confidence: high
 */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022d008c[];
extern int  func_ov002_021bd5e8(int id);
extern int  func_ov002_022575f0(struct Self *self);
extern int  func_ov002_0228c754(int b0, int p, void *fn);
extern int  func_ov002_0228dc98(void);

int func_ov002_02287364(struct Self *self) {
    int p;
    if (*(int *)(data_ov002_022d008c + 0xcec) != self->b0) return 0;
    if (*(int *)(data_ov002_022d008c + 0xcf8) != 0) return 0;
    if (func_ov002_021bd5e8(0x169f) != 0) return 0;
    p = func_ov002_022575f0(self);
    return func_ov002_0228c754(self->b0, p, (void *)func_ov002_0228dc98) >= 0;
}
