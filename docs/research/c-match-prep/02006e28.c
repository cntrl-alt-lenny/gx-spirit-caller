/* CAMPAIGN-PREP candidate for func_02006e28 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r4=a1 then result; r5=sel; movcs/movcc & movls/movhi as cmp-set bool
 *   risk:       struct-guessed + permuter-class: stack frame split (buf@0x104, scratch@0x0, the 0x128/0x12c reads) is reverse-engineered from sp offsets; the &out vs &scratch aliasing is fragile. Already-shipping-as-.s confirms the r4/r5 cmp-set scheduling (movcs/movcc, movls/movhi from func_02007104's r0) is a reg-alloc wall a C reshape likely won't close.
 *   confidence: low
 */
/* func_02006e28: stack-struct (0x14c) builder + branch-tail compare-set.
 * Ships as .s today (reg-alloc walled). Calls func_02006b4c to fill a
 * stack record at sp+0x104, then either a masked-compare path or a
 * field-difference path produces a 0/1 result.
 *
 *   sub sp,#0x14c; r3=a0; r4=a1
 *   ok = func_02006b4c(sp+0x104, a0, sp+0x4)   ; r0=buf,r1=a0,r2=&out
 *   if (!ok) return 0;
 *   h = func_02007104(<prev r0>, data_020c3f44)
 *   sel = (h != -1)                            ; r5 = 0/1
 *   t = func_0207d3ac(*(void**)(data_02104f1c+0x1c), a1); r4=t
 *   if (sel) {
 *     func_02038ad4(sp+0x104, sp+0x0, 4)
 *     func_020928e8(sp+0x0, 4)
 *     r4 = (t >= (*(u32*)sp >> 8))
 *   } else {
 *     r4 = ((*(u32*)(sp+0x12c) - *(u32*)(sp+0x128)) <= t)
 *   }
 *   func_02097ff0(sp+0x104)
 *   return r4
 */

typedef struct { char _b[0x48]; } rec_t;     /* sp+0x104 .. , size guess */

extern int  func_02006b4c(rec_t *buf, void *a0, void *out);
extern int  func_02007104(void *a, void *b);
extern int  func_0207d3ac(void *ctx, void *a1);
extern void func_02038ad4(rec_t *buf, void *dst, int n);
extern void func_020928e8(void *p, int n);
extern void func_02097ff0(rec_t *buf);
extern void *data_02104f1c;     /* +0x1c handler ptr */
extern int   data_020c3f44;

int func_02006e28(void *a0, void *a1) {
    rec_t buf;
    unsigned int scratch[0x4b];   /* sp+0x0 region; layout guessed */
    int t, sel;

    if (!func_02006b4c(&buf, a0, &scratch[1])) {
        return 0;
    }
    sel = (func_02007104((void *)&buf, &data_020c3f44) != -1);
    t = func_0207d3ac(*(void **)((char *)&data_02104f1c + 0x1c), a1);
    if (sel) {
        func_02038ad4(&buf, &scratch[0], 4);
        func_020928e8(&scratch[0], 4);
        t = (t >= (scratch[0] >> 8));
    } else {
        t = ((scratch[0x4b] - scratch[0x4a]) <= (unsigned int)t);
    }
    func_02097ff0(&buf);
    return t;
}
