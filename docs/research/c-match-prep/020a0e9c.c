/* CAMPAIGN-PREP candidate for func_020a0e9c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order ws/p/ctx; r5 reused (f_14 then *buf); status writeback fields in order
 *   risk:       struct-guessed + reshape-able: the func_020977c0 return feeds func_02098104 as a coord; offsets f_10/f_14 and the 0x48 vs 0x4c frame are inferred. Decl-order of buf vs r5-reuse will move ldr; almost certainly needs iteration.
 *   confidence: low
 */
/* func_020a0e9c (main, class C): builds a 0x4c-byte stack workspace, runs
 * a parse/step pipeline, writes status back into the arg struct. r4=arg
 * fields base (arg->f_10), r5=arg->f_14 then reused as *r4 (the buffer
 * ptr). decl-order is the dominant lever here.
 * arg: r0 -> struct with f_10 (sub-struct ptr) and f_14 (param).
 */

typedef struct {
    void *buf;          /* +0x0: byte buffer base */
    int   len;          /* +0x4: length */
    int   f_8;          /* +0x8 */
    int   f_c;          /* +0xc: status (2 == done) */
} parse_t;

typedef struct {
    char  _pad10[0x10];
    parse_t *f_10;      /* +0x10 */
    void   *f_14;       /* +0x14: secondary ctx (has f_14 field, base+0x10) */
} outer_0e9c_t;

extern void func_020977c0(void *dst, int a);
extern int  func_02097f10(void *ws, int a, int b);
extern void func_02097ff0(void *ws);
extern int  func_02098104(void *ws, int len, int base, int end, int neg);
extern void func_02098388(void *ws);

void func_020a0e9c(outer_0e9c_t *arg) {
    char ws[0x48];
    parse_t *p = arg->f_10;
    void *ctx = arg->f_14;
    int r0;
    char *buf;

    func_02098388(ws);
    r0 = (int)(*(int *)((char *)ctx + 0x14));   /* ldr r1,[r5,#0x14] before bl */
    func_020977c0((char *)ctx + 0x10, r0);
    buf = (char *)p->buf;
    r0 = func_02097f10_dummy_unused;
}
