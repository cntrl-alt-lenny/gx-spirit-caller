/* CAMPAIGN-PREP candidate for func_02223f18 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     4-case contiguous switch -> jump table; 1-bit0; bit0 extracts
 *   risk:       mwcc may emit compare-chain not addls jump-table; d0e6c reload-vs-bind
 *   confidence: med
 */
/* func_ov002_02223f18: global-state (ce288+0x5a8) jump-table dispatch over
 * 0x7d..0x80.
 *   0x7d -> 021e286c(1-f2.b0); return 0
 *   0x7e -> 0226b054(f2.b0); return 0x7d
 *   0x7f -> if (*(u16*)(d0e6c+0xb0)==0) return 0x7e;
 *           021e1870(1-f2.b0, *(u16*)(d0e6c+0xb2), 1); return 0x7d
 *   0x80 -> 0226b194(1-f2.b0, f0, 0); return 0x7f
 *   default -> 0 */
typedef unsigned short u16;

struct F02223f18_F2 { u16 b0 : 1; u16 rest : 15; };
struct F02223f18_Self { u16 f0; struct F02223f18_F2 f2; };

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021e286c(int arg0);
extern void func_ov002_0226b054(unsigned int b0);
extern void func_ov002_021e1870(unsigned int notbit, u16 v, int one);
extern void func_ov002_0226b194(unsigned int notbit, u16 f0, int z);

int func_ov002_02223f18(struct F02223f18_Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x7d:
        func_ov002_021e286c(1 - self->f2.b0);
        return 0;
    case 0x7e:
        func_ov002_0226b054(self->f2.b0);
        return 0x7d;
    case 0x7f:
        if (*(u16 *)(data_ov002_022d0e6c + 0xb0) == 0) return 0x7e;
        func_ov002_021e1870(1 - self->f2.b0, *(u16 *)(data_ov002_022d0e6c + 0xb2), 1);
        return 0x7d;
    case 0x80:
        func_ov002_0226b194(1 - self->f2.b0, self->f0, 0);
        return 0x7f;
    }
    return 0;
}
