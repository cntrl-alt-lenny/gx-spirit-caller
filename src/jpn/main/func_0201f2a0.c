/* CAMPAIGN-PREP candidate for func_0201f2a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     range-test early return + (!=2) guard + strh global writes
 *   risk:       func_0209ed1c 1-arg proto vs real 4-arg; f_4/f_a/f_30 offsets & strh widths guessed
 *   confidence: med
 */
/* func_0201f2a0: state compare + conditional global writes. If
 * (unsigned)(g.f_30 - 4) <= 2 return 1 (range test, like the f19c idiom). Then
 * if func_0209ed1c(&func_0201f2f8) != 2: f19c(); return 0. Else set g.f_4=0,
 * g.f_a=1 (both u16) and return 1. The '!= 2' form yields the orig beq-over
 * to the store block. func_0209ed1c is called with only r0 set, so it is
 * prototyped with a single arg here. */

typedef struct {
    char _pad4[0x4];
    unsigned short f_4;    /* +0x04 */
    char _pad6[0x4];
    unsigned short f_a;    /* +0x0a */
    char _padc[0x24];
    unsigned int f_30;     /* +0x30 */
} state_f2f4;

extern state_f2f4 data_02191e60;
extern void func_0201f148(void);
extern int func_0201f2f8(void *p);
extern int func_0209ed1c(int a0);

int func_0201f2a0(void) {
    if ((unsigned int)(data_02191e60.f_30 - 4) <= 2) {
        return 1;
    }
    if (func_0209ed1c((int)func_0201f2f8) != 2) {
        func_0201f148();
        return 0;
    }
    data_02191e60.f_4 = 0;
    data_02191e60.f_a = 1;
    return 1;
}
