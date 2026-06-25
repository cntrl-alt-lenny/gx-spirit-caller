/* CAMPAIGN-PREP candidate for func_0207cbe0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r5+0x2000 base across f260/f26b loads; ret/val zero-init pre-branch; nested ifs
 *   risk:       The byte==0 predicated block (addeq/ldreq forming val+ret) and live-across-OS_RestoreIrq alloc of val(r6)/ret(r7) is a register coin-flip: permuter-class.
 *   confidence: med
 */
#include <stddef.h>

typedef unsigned short u16;
typedef unsigned char u8;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern unsigned char *func_0207b538(void);

struct S_207cbe0 {
    char _pad2000[0x2000];
    int  f260;       /* +0x2000 + 0x260 = 0x2260 */
    char _pad264[0x26b - 0x260 - 4];
    u8   f26b;       /* +0x2000 + 0x26b = 0x226b */
};

u16 *func_0207cbe0(u16 *out)
{
    unsigned char *base;
    int irq;
    u16 *ret;
    u16 val;
    struct S_207cbe0 *p;

    ret = NULL;
    val = 0;
    base = func_0207b538();
    irq = OS_DisableIrq();
    if (base != NULL) {
        p = (struct S_207cbe0 *)base;
        if (p->f260 == 9) {
            if (p->f26b == 0) {
                val = *(u16 *)(base + 0x214a);
                ret = (u16 *)(base + 0x214c);
            }
        }
    }
    OS_RestoreIrq(irq);
    if (out != NULL)
        *out = val;
    return ret;
}
