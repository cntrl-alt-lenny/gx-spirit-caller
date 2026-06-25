/* CAMPAIGN-PREP candidate for func_02231fa4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global 3-way switch + mul-by-1000 + 1-bit0 rsb + tail call
 *   risk:       mul: orig `mov r1,#0x3e8; mul r2,r0,r1` (const in reg). mwcc may strength-reduce *1000 to shifts; if so keep literal via volatile/const-temp.
 *   confidence: med
 */
/* func_ov002_02231fa4: global 3-way state switch on [data+0x5a8].
 *   case 0x80: 021df818(self, 1 - self->bit0, 022577dc(self) * 1000); return 0x7f;
 *   case 0x7f: return 0220e75c(self);   (tail call)
 *   default:   return 0;
 */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };

extern char data_ov002_022ce288[];
extern int  func_ov002_022577dc(void *self);
extern void func_ov002_021df818(void *self, int b, int c);
extern int  func_ov002_0220e75c(void *self);

int func_ov002_02231fa4(struct S *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        func_ov002_021df818(self, 1 - self->bit0, func_ov002_022577dc(self) * 1000);
        return 0x7f;
    case 0x7f:
        return func_ov002_0220e75c(self);
    }
    return 0;
}
