/* CAMPAIGN-PREP candidate for func_0209d69c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ-bracket null-guard double-deref u16 read
 *   risk:       f4/f86 offsets guessed; the moveq-r5 / ldrh-r5 merge into r5 must reuse one reg — reg-alloc on ret could flip
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209d69c (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     IRQ-bracket + null-guard double-deref read; clear helper then u16 read
 *   risk:       Outer.f4(0x4)/Inner.f86(0x86) offsets guessed; return holds the ldrh value (no final lsl/lsr) so int return is correct
 */
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020928cc(void *p, int k);

struct Inner { char _pad[0x86]; unsigned short f86; };
struct Outer { char _pad0[0x4]; struct Inner *f4; };
extern struct Outer *data_021a8d2c;

int func_0209d69c(void) {
    int saved = OS_DisableIrq();
    struct Outer *p = data_021a8d2c;
    int ret;
    if (p != 0) {
        struct Inner *in = p->f4;
        func_020928cc(&in->f86, 2);
        ret = in->f86;
    } else {
        ret = 0;
    }
    OS_RestoreIrq(saved);
    return ret;
}
