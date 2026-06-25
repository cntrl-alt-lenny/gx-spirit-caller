/* CAMPAIGN-PREP candidate for func_022175e0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     f4.bit2 inline-guard(first return); f2.bit0 calls; 1-bit0; reload across call
 *   risk:       first return-0 must inline (movs;movne;popne) as the first such return; bit2 must be a :1 bitfield (lsl#29;lsr#31, no and)
 *   confidence: high
 */
/* func_ov002_022175e0: if f4.bit2 set return 0; if func_021e104c(f2.bit0,1) then
 * func_021e05fc(1 - f2.bit0, 1000). Returns 0. f2 reloaded after the call.
 */
typedef unsigned short u16;

struct F022175e0_Self {
    u16 f0;
    struct { u16 bit0 : 1; u16 rest : 15; } f2;
    struct { u16 pad2 : 2; u16 bit2 : 1; u16 rest : 13; } f4;
};

extern int  func_ov002_021e104c(unsigned int v, unsigned int k);
extern void func_ov002_021e05fc(unsigned int v, unsigned int k);

int func_ov002_022175e0(struct F022175e0_Self *self) {
    if (self->f4.bit2) return 0;
    if (func_ov002_021e104c(self->f2.bit0, 1) != 0)
        func_ov002_021e05fc(1 - self->f2.bit0, 1000);
    return 0;
}
