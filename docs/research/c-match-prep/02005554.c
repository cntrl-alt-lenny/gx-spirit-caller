/* CAMPAIGN-PREP candidate for func_02005554 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order buf first; 7-arg call w/ 3 stack words; func-ptr literal
 *   risk:       permuter-class: identical-shape sibling func_020054f0 already escaped to .s (reg-alloc/stack-arg ordering of the 0/a1/&fn block). The return read of buf+0x8 as raw int may also need a real struct field. struct-guessed for buf layout.
 *   confidence: low
 */
/* func_02005554: stack-struct init + marshal call, sibling of func_020054f0.
 * Only diff vs 54f0: middle call is func_02001d98(buf,arg2) [2 args] not
 * func_02001d84(buf,arg2,0) [3 args]. Both ship as .s (reg-alloc walled).
 *
 *   stmdb sp!, {r4,r5,r6,lr}; sub sp,#0x40
 *   r6=a0; r5=a1; r4=a2
 *   func_02001d0c(sp+0xc, 0x20, 2)
 *   func_02001d98(sp+0xc, a2)
 *   stack args: [0]=0 [1]=a1 [2]=&func_02003b14
 *   func_02004ef4(sp+0xc, a0, 0, 0, /stack/0, a1, &func_02003b14)
 *   return *(int*)(sp+0x14)   ; buf field +0x8
 */

typedef struct {
    char _pad[0x34];
} marshal_buf_t;   /* 52-byte struct func_02001d0c zero-fills */

extern void func_02001d0c(marshal_buf_t *buf, int a, int b);
extern void func_02001d98(marshal_buf_t *buf, int a2);
extern int  func_02003b14();
extern void func_02004ef4(marshal_buf_t *buf, int a0, int x, int y,
                          int s0, int s1, int (*cb)());

int func_02005554(int a0, int a1, int a2) {
    marshal_buf_t buf;
    func_02001d0c(&buf, 0x20, 2);
    func_02001d98(&buf, a2);
    func_02004ef4(&buf, a0, 0, 0, 0, a1, func_02003b14);
    return *(int *)((char *)&buf + 0x8);
}
