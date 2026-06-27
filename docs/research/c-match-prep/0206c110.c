/* CAMPAIGN-PREP candidate for func_0206c110 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: ordered field reads; 6-arg call spills h0 then b2 to stack in asm order
 *   risk:       arg/eval-order: stack args must be [sp]=cmd->h0 then [sp+4]=cmd->b2, and dst=base+off computed before the 02092614 call (off in r0). If mwcc reorders the ldrh/ldrb spills or recomputes eng+0x20, scheduling diverges. permuter-class for the spill interleave; struct-guessed Cmd offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206c110 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: ordered field loads + 2 stack args (half0 then byte2) in asm order
 * func_0206c110(base, eng, cmd):
 *   off = func_0206c2c0(cmd); dst = base + off;
 *   func_02092614(eng, base, cmd->b3);
 *   func_02092844(eng + 0xe0);
 *   func_02091d24(eng+0x20, func_0206bd74, eng, dst, cmd->h0, cmd->b2);
 *   func_020919d8(eng+0x20);
 *   return dst;
 */
typedef struct {
    unsigned short h0;   /* +0x0 ldrh */
    unsigned char  b2;   /* +0x2 ldrb */
    unsigned char  b3;   /* +0x3 ldrb */
} Cmd;

extern int  func_0206c2c0(Cmd *cmd);
extern void func_0206bd74(void);              /* _LIT0, passed by address */
extern void func_02092614(void *eng, void *base, int b3);
extern void func_02092844(void *p);
extern void func_02091d24(void *p, void *cb, void *eng, void *dst, int h0, int b2);
extern void func_020919d8(void *p);

void *func_0206c110(char *base, char *eng, Cmd *cmd) {
    char *dst = base + func_0206c2c0(cmd);
    func_02092614(eng, base, cmd->b3);
    func_02092844(eng + 0xe0);
    func_02091d24(eng + 0x20, (void *)func_0206bd74, eng, dst, cmd->h0, cmd->b2);
    func_020919d8(eng + 0x20);
    return dst;
}
