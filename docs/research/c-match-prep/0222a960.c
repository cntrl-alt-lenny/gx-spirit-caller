/* CAMPAIGN-PREP candidate for func_0222a960 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param call, byte-unpack, two guards->shared epilogue
 *   risk:       021de64c called 4-arg (sets r3=0) vs its 3-arg .c elsewhere; if it must be 3-arg, drop the trailing 0.
 *   confidence: high
 */
/* func_ov002_0222a960: 0223df38(self,0,&buf) fills a packed u16; unpack low
 * byte (b0) and (u16>>8) byte (b1); gate on 0225764c, then 021de64c(self,b0,b1,0).
 * always return 0. */
typedef unsigned short u16;
typedef unsigned char u8;

extern int func_ov002_0223df38(void *self, int idx, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de64c(int a, int b, int c, int d);

int func_ov002_0222a960(void *self) {
    int packed, b0, b1;
    if (func_ov002_0223df38(self, 0, &packed) == 0) return 0;
    b0 = packed & 0xff;
    b1 = ((u16)packed >> 8) & 0xff;
    if (func_ov002_0225764c(self, b0, b1) == 0) return 0;
    func_ov002_021de64c(self, b0, b1, 0);
    return 0;
}
