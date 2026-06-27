/* CAMPAIGN-PREP candidate for func_020971b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind p,arg first; ands0x100 branch; clear-bit path + guarded tail; else IRQ store path
 *   risk:       func_02096728 args in the taken branch are ambiguous (asm loads r0=p->f24, r2=p->f1c but r1 unset before bl) - struct-guessed: the real func_02096728(node,v) arg roles/count must be confirmed; arg in r6 is preserved but only used in else-branch store sub->f14
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020971b8 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     bind r4=p, r6=arg first; ands#0x100 flag branch; clear-bit path calls + guarded tail; else IRQ path stores arg & clears 0x200
 *   risk:       see risk note
 *   confidence: med
 */
/* func_020971b8(p,arg): if(p->f1c & 0x100){ p->f1c &= ~0x100; func_02096728(p->f24, p->f24...); -- see asm: r0=p->f24,r2=p->f1c then bl func_02096728;
 *   then if(func_02097af0(p)) func_02097a4c(); return; }
 *   else { sub=p->f24; tok=OS_DisableIrq(); sub->f14=arg; p->f1c &= ~0x200; func_02091a0c(&p->f0c); OS_RestoreIrq(tok); } */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);
extern void func_02091a0c(void *p);
extern void func_02096728(void *node, int v);
extern void func_02097a4c(int x);
extern int  func_02097af0(void *p);

typedef struct {
    unsigned char pad00[0xc];
    unsigned char f0c[0x10];   /* 0x0c (passed to func_02091a0c) */
    unsigned int  f1c;         /* 0x1c flags */
    unsigned char pad20[0x4];
    void         *f24;         /* 0x24 -> sub */
} Obj020971b8;

typedef struct {
    unsigned char pad00[0x14];
    int           f14;         /* 0x14 */
} Sub020971b8;

void func_020971b8(Obj020971b8 *p, int arg)
{
    int token;
    Sub020971b8 *sub;

    if (p->f1c & 0x100) {
        int node = (int)p->f24;
        p->f1c &= ~0x100;
        func_02096728((void *)node, (int)p->f1c);
        if (func_02097af0(p)) {
            func_02097a4c((int)p);
        }
        return;
    }

    sub = (Sub020971b8 *)p->f24;
    token = OS_DisableIrq();
    sub->f14 = arg;
    p->f1c &= ~0x200;
    func_02091a0c(&p->f0c);
    OS_RestoreIrq(token);
}
