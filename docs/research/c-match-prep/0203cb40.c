/* CAMPAIGN-PREP candidate for func_0203cb40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear state dispatch; sub sp #4 byte temp on stack; tail calls
 *   risk:       Stack byte-slot (strb/ldrb [sp]) needs char local addr-taken; func_0203dc10 takes &temp
 *   confidence: med
 */
/* func_0203cb40: read a state byte, branch.
 *  s = func_0203c888();   (stored to stack byte)
 *  if(s==0 || s==0x12){ func_0203c968(); return 1; }
 *  func_0203dc10(&s); func_0203c89c(s); return 0;
 * The stack byte (sub sp,#4 / strb/ldrb [sp]) comes from an
 * address-taken unsigned char local.
 */
extern unsigned char func_0203c888(void);
extern void func_0203c968(void);
extern void func_0203dc10(unsigned char *p);
extern void func_0203c89c(unsigned char s);

int func_0203cb40(void) {
    unsigned char s = func_0203c888();
    if (s == 0 || s == 0x12) {
        func_0203c968();
        return 1;
    }
    func_0203dc10(&s);
    func_0203c89c(s);
    return 0;
}
