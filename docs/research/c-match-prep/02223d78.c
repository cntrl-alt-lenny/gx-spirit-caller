/* CAMPAIGN-PREP candidate for func_02223d78 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-state switch; bitfield :1/:5 extracts to calls
 *   risk:       2-case compare order / which arm inlines may flip vs orig
 *   confidence: med
 */
/* func_ov002_02223d78: global-state (ce288+0x5a8) 2-way dispatch.
 *   0x7f -> 021d8840(f2.b0, 0x1f); return 0
 *   0x80 -> 021d6c98(self, f2.b0, f2.f1); return 0x7f
 *   default -> 0 */
typedef unsigned short u16;

struct F02223d78_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F02223d78_Self { u16 f0; struct F02223d78_F2 f2; };

extern char data_ov002_022ce288[];
extern void func_ov002_021d8840(unsigned int b0, int k);
extern int  func_ov002_021d6c98(struct F02223d78_Self *self, unsigned int b0, unsigned int f1);

int func_ov002_02223d78(struct F02223d78_Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x7f:
        func_ov002_021d8840(self->f2.b0, 0x1f);
        return 0;
    case 0x80:
        func_ov002_021d6c98(self, self->f2.b0, self->f2.f1);
        return 0x7f;
    }
    return 0;
}
