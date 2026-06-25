/* CAMPAIGN-PREP candidate for func_0209d0f8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     (B) shifted-operand-first orr; BIND base+word; MMIO poke; .legacy.c
 *   risk:       struct offsets guessed; 0xB7000000 must encode as immediate orr (it does); final MMIO store reg/value ordering stable
 *   confidence: med
 */
/* file: src/main/func_0209d0f8.legacy.c  (mwcc 1.2/sp2p3)
 * 2-step `ldmia {r4,lr}; bx lr` => Style A => .legacy.c.
 * (B) commutative: orig is `orr r0, (v>>8), #0xB7000000` — shifted/
 * computed operand FIRST picks the dest reg, so write `(v>>8)|0xB7000000`
 * not `0xB7000000|(v>>8)`. Bind the global base to r4 (held across both
 * calls). Bind the loaded word `v=base->field_1c` to one local (reused
 * for v>>8 and v<<24). 0x04100010 is an MMIO ptr arg; final write pokes
 * ROMCTRL-like reg 0x040001a4 with data_021a8b00.field_4. */

typedef struct {
    char _pad_00[0x1c];
    int  field_1c;  /* +0x1c */
    int  field_20;  /* +0x20 */
    char _pad_24[0x28 - 0x24];
    int  field_28;  /* +0x28 */
} data_021a84c0_t;
extern data_021a84c0_t data_021a84c0;

typedef struct { char _pad_00[0x4]; int field_4; } data_021a8b00_t;
extern data_021a8b00_t data_021a8b00;

extern void func_02094864(int a, void *fifo, int b, int len);
extern void func_0209d150(int w0, int w1);

void func_0209d0f8(void) {
    int v;
    func_02094864(data_021a84c0.field_28, (void *)0x04100010,
                  data_021a84c0.field_20, 0x200);
    v = data_021a84c0.field_1c;
    func_0209d150((v >> 8) | 0xB7000000, v << 24);
    *(volatile unsigned *)0x040001a4 = data_021a8b00.field_4;
}
