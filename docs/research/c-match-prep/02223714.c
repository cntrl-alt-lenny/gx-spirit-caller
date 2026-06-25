/* CAMPAIGN-PREP candidate for func_02223714 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-state switch; ternary cond-move; 1-bit0; asr byte-split
 *   risk:       switch block order / compare-chain may flip; byte-split asr scheduling may reorder
 *   confidence: med
 */
/* func_ov002_02223714: global-state (ce288+0x5a8) 3-way dispatch.
 *   0x80 -> return 02257b48() ? 0x7f : 0   (ternary cond-move)
 *   0x7f -> 0226b034(1-f2.b0, f0, 0); return 0x7e
 *   0x7e -> 021de910(self, lo, hi) of u16 (d0e6c+0xb0); return 0
 *   default -> 0 */
typedef unsigned short u16;

struct F02223714_F2 { u16 b0 : 1; u16 rest : 15; };
struct F02223714_Self { u16 f0; struct F02223714_F2 f2; };

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_02257b48(void);
extern int  func_ov002_0226b034(unsigned int notbit, u16 f0, int z);
extern void func_ov002_021de910(struct F02223714_Self *self, int lo, int hi);

int func_ov002_02223714(struct F02223714_Self *self) {
    int v;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x7e:
        v = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        func_ov002_021de910(self, v & 0xff, (v >> 8) & 0xff);
        return 0;
    case 0x7f:
        func_ov002_0226b034(1 - self->f2.b0, self->f0, 0);
        return 0x7e;
    case 0x80:
        return func_ov002_02257b48() ? 0x7f : 0;
    }
    return 0;
}
