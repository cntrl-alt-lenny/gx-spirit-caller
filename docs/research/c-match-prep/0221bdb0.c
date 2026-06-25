/* CAMPAIGN-PREP candidate for func_0221bdb0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     f4.bit2 inline-guard; dual-bitfield f2(bit0,f1_5) one read; f4 :9 field & 1
 *   risk:       field9&1 must emit lsl#17;lsr#23;and#1 (bitfield then mask) not fused to a single bit-extract; f2 must be read once for both fields
 *   confidence: med
 */
/* func_ov002_0221bdb0: if f4.bit2 set return 0; call func_021de9d4(self, f2.bit0,
 * f2.f1_5); call func_021e286c(f4.field9 & 1). Returns 0. f2 read once (two
 * fields), f4 read twice (bit2 guard, then field9) across the call barrier.
 */
typedef unsigned short u16;

struct F0221bdb0_Self {
    u16 f0;
    struct { u16 bit0 : 1; u16 f1_5 : 5; u16 rest : 10; } f2;
    struct { u16 pad2 : 2; u16 bit2 : 1; u16 pad3 : 3; u16 field9 : 9; u16 hi : 1; } f4;
};

extern int func_ov002_021de9d4(struct F0221bdb0_Self *self, int b, int c);
extern int func_ov002_021e286c(int arg0);

int func_ov002_0221bdb0(struct F0221bdb0_Self *self) {
    if (self->f4.bit2) return 0;
    func_ov002_021de9d4(self, self->f2.bit0, self->f2.f1_5);
    func_ov002_021e286c(self->f4.field9 & 1);
    return 0;
}
