/* CAMPAIGN-PREP candidate for func_02234650 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global 3-way switch + early-zero-return guard + setter-style call
 *   risk:       self/arg1 saved to r5/r4 across calls; reg-alloc choice of which callee-saved reg holds each may flip vs orig.
 *   confidence: high
 */
/* func_ov002_02234650: global 3-way state switch on [data+0x5a8].
 *   case 0x80: if 021ff3bc(self)==0 return 0; 022287c4(self, arg1); return 0x7f;
 *   case 0x7f: 02212e8c(); break;   (-> return 0)
 *   default:   return 0;
 */
extern char data_ov002_022ce288[];
extern int  func_ov002_021ff3bc(void *self);
extern void func_ov002_022287c4(void *self, int arg1);
extern void func_ov002_02212e8c(void);

int func_ov002_02234650(void *self, int arg1) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_021ff3bc(self) == 0) return 0;
        func_ov002_022287c4(self, arg1);
        return 0x7f;
    case 0x7f:
        func_ov002_02212e8c();
        break;
    }
    return 0;
}
