/* func_02062318: allocate+copy a buffer sized from func_02064d3c's 2nd
 * out-param, optionally copy a 4-word block from d into a+0x28, then
 * hand a scratch buffer to three helper calls.
 *
 * Stack math on the ground-truth .s: `sub sp,#0x24` (36B locals) sits
 * BELOW the {r4,r5,lr} save (0xc) and BELOW the {r0,r1,r2,r3} param-
 * home spill (0x10) -- so `sp+0x34`/`sp+0x38` (func_02064d3c's two
 * out-params) land INSIDE the r1/r2 (b/c) parameter homes, not in the
 * 36B local block at all. b and c are otherwise dead in this function,
 * so mwcc reuses their spill slots as scratch instead of growing the
 * frame. `sp+0x0` (passed to the three helper calls) is a genuinely
 * separate ~36B local the callees populate/use as scratch -- b and c
 * themselves are never referenced by name.
 */

struct Block4_0206238c {
    int w0, w1, w2, w3;
};

struct S0206238c {
    unsigned char pad_00[0x0c];
    int field_c;      /* 0x0c */
    unsigned char pad_10[0x28 - 0x10];
    struct Block4_0206238c block28; /* 0x28, 16 bytes */
    int field_38;        /* 0x38 */
    int field_3c;          /* 0x3c */
};

extern void func_02064d3c(int *out1, int *out2);
extern int func_02045398(int a);
extern void *func_020a7274(void *dst, signed char *src, int count);
extern void func_020610dc(void *arg);
extern void *func_02060fa4(void *dst, void *src);
extern void func_02062d14(void *self, void *arg);

int func_02062318(struct S0206238c *a, int b, int c, int *d) {
    int scratch[9];

    func_02064d3c(&b, &c);
    if (c > 0) {
        a->field_38 = func_02045398(c);
        if (a->field_38 == 0) {
            return 1;
        }
        func_020a7274((void *)a->field_38, (signed char *)b, c);
        a->field_3c = c;
    }

    if (d != 0) {
        a->block28 = *(struct Block4_0206238c *)d;
    }

    func_020610dc(scratch);
    func_02060fa4((char *)a + 0x68, scratch);
    func_02062d14(a, scratch);
    a->field_c = 0;
    return 0;
}
