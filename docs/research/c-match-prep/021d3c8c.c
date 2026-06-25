/* CAMPAIGN-PREP candidate for func_021d3c8c (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD + tail-bail (mvnne -1) + counted loop walking ptr + cached base reg
 *   risk:       0x3d28 may split differently than orig (0x128+0x3c00); loop strength-reduction (separate p+=0x54 vs i) per brief 320 wall; base must hold across calls
 *   confidence: med
 */
/* func_ov004_021d3c8c: boot the ov004 scene. If func_0203309c(cfg,'AYXJ')==1 run
 * the one-time sound/init (bail -1 if func_02007230 trips), then push 60 cell
 * records (stride 0x54) at base+0x3d28 through func_02032efc. */
#include "ov004_core.h"
extern char data_02105b70[];
extern int func_0203309c(void *a, int b);
extern int func_0202c0c0(int id);
extern int func_02007230(void);
extern void func_02008888(void);
extern void *func_0203268c(void);
extern void func_02032e8c(void *a, void *b);
extern void func_02032efc(void *a, int i, void *p);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_ov004_021d8cd0(void *p);

int func_ov004_021d3c8c(void) {
    char *base = data_ov004_0220b500;
    if (func_0203309c(data_02105b70, 0x4159584a) == 1) {
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0xe8), 1);
        func_02008888();
        if (func_02007230() != 0)
            return -1;
        func_ov004_021d8cd0(data_ov004_022915e8);
    }
    func_02032e8c(func_0203268c(), data_02105b70);
    {
        char *p = base + 0x3d28;
        int i;
        for (i = 0; i < 0x3c; i++) {
            func_02032efc(func_0203268c(), i, p);
            p += 0x54;
        }
    }
    return 0;
}
