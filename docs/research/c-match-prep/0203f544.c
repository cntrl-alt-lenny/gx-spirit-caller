/* CAMPAIGN-PREP candidate for func_0203f544 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear stack-buffer call seq; address-of locals in asm order
 *   risk:       stack frame is 0x6c; my struct split (0x14/0x58) may shift sp offsets if mwcc lays locals differently
 *   confidence: med
 */
#include "types.h"

extern void func_02094688(void *dst, void *src, int n);
extern void func_020990e0(void *dst, void *src);
extern void func_020991a4(void *p, void *src, int n);
extern void func_02099298(void *p);

struct StackBuf_0203f544 {
    u8 a[0x14];   /* sp+0x00 : the 0x14-byte first block (b[0x3] used as buf) */
    u8 b[0x58];   /* sp+0x14 : the 0x18-init block + slack to 0x6c */
};

void func_0203f544(void *arg0, void *arg1)
{
    struct StackBuf_0203f544 s;
    func_02099298(&s.b);
    func_020991a4(&s.b, arg0, 0x18);
    func_020990e0(&s.a, &s.b);
    func_02094688(&s.a[3], arg1, 0xd);
}
