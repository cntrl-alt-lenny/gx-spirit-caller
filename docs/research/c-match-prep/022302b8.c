/* CAMPAIGN-PREP candidate for func_022302b8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param call, byte-unpack, two guards->shared epilogue (3-arg tail)
 *   risk:       021de9d4 is 3-arg (no r3) per ground-truth; unpack idiom matches sibling 0223a87c; epilogue sharing is the standard shape.
 *   confidence: high
 */
/* func_ov002_022302b8: 0223df38(self,0,&buf) packed u16; b0=low byte,
 * b1=(u16>>8) byte; gate 0225764c; then 021de9d4(self,b0,b1). return 0. */
typedef unsigned short u16;
typedef unsigned char u8;

extern int func_ov002_0223df38(void *self, int idx, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de9d4(int a, int b, int c);

int func_ov002_022302b8(void *self) {
    int packed, b0, b1;
    if (func_ov002_0223df38(self, 0, &packed) == 0) return 0;
    b0 = packed & 0xff;
    b1 = ((u16)packed >> 8) & 0xff;
    if (func_ov002_0225764c(self, b0, b1) == 0) return 0;
    func_ov002_021de9d4(self, b0, b1);
    return 0;
}
