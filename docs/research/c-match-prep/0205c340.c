/* CAMPAIGN-PREP candidate for func_0205c340 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     hoisted struct loads + null assert; stack-arg marshal then tail call
 *   risk:       r4/r5/r6 loaded from arg3 BEFORE the null check (must not sink past assert); 0x4c frame size; stacked args r6,r4 order
 *   confidence: low
 */
/* func_0205c340: read three fields of arg3 (loaded unconditionally),
 * assert arg3 != 0, format a stack record via func_020a978c with two
 * stacked args, then tail-call func_02057d2c(arg0, arg1, &record).
 *   r6=arg3->+4, r5=arg3->+0, r4=arg3->+8 (hoisted before bne)
 *   func_020a978c(&rec, data_02100b90, arg2, r5, /*stk*/ r6, r4)
 *   func_02057d2c(arg0, arg1, &rec)
 */

extern unsigned char data_02100b64[];
extern unsigned char data_02100b84[];
extern unsigned char data_02100b90[];
extern void func_02057d2c(void *a0, void *a1, void *rec);
extern void func_020a6d54(void *a, void *b, int c, int d);
extern void func_020a978c(void *dst, const void *fmt, int a2, int a3,
                          int a4, int a5);

typedef struct {
    int f0;   /* +0x00 */
    int f4;   /* +0x04 */
    int f8;   /* +0x08 */
} Args3;

void func_0205c340(void *a0, void *a1, int a2, Args3 *p) {
    unsigned char rec[0x40];
    int v4 = p->f4;
    int v0 = p->f0;
    int v8 = p->f8;
    if (p == 0) {
        func_020a6d54(data_02100b84, data_02100b64, 0, 0x376);
    }
    func_020a978c(rec, data_02100b90, a2, v0, v4, v8);
    func_02057d2c(a0, a1, rec);
}
