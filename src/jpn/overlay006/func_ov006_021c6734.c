/* func_ov006_021c6734: setup calls, then a 6-iteration loop over
 * p's "slot" table (at p+0x6c+field_4c*16), skipping out-of-range
 * indices, dispatching func_0202c3f8/func_0202c06c based on whether
 * (p + idx*16)->f7c is set, then a chain of func_02001d78/
 * func_02005538/func_02004f3c calls. Always returns 1.
 */

#define K_1CD 0x1cd
#define FIELD3(x) (((unsigned)((x) << 29)) >> 29)

extern void *func_0208dcb4(void);
extern void  func_02094410(int a, void *addr, int b);
extern void  func_02001cec(void *addr, int a, int b);
extern void  func_02001d48(int x);
extern int   func_0202c06c(int x);
extern int   func_0202c3f8(void);
extern void  func_02001d78(void *addr, int x);
extern int   func_02005538(int x, int a, int b);
extern void  func_02004f3c(void *addr, int r9, void *addr2, int a, int b, int c);

extern struct { unsigned char _pad_00[4]; unsigned int field_4; } data_02104e6c;

int func_ov006_021c6734(char *p) {
    void *ctx;
    char *slot;
    int negone;
    int i, j;
    const int fixedj = 12;

    ctx = func_0208dcb4();
    slot = p + 0x6c + *(unsigned int *)(p + 0x4c) * 16;

    func_02094410(0, (char *)ctx + 0xc40, 0x4800);
    func_02001cec(p + 8, 32, 18);
    func_02001d48(FIELD3(*(volatile unsigned int *)&data_02104e6c.field_4));

    negone = 0x1cc - K_1CD;
    j = 12;

    for (i = 0; i < 6; i++, j += 0x16) {
        int idx = *(int *)(slot + 4) + i;
        int r9;

        if (idx < 0) {
            continue;
        }
        if (idx >= *(int *)(slot + 8)) {
            continue;
        }

        if (*(int *)(p + idx * 16 + 0x7c) == 0) {
            r9 = func_0202c06c(K_1CD);
        } else {
            r9 = func_0202c3f8();
        }

        func_02001d78(p + 8, 5);

        if (func_02005538(r9, 12, 5) >= 0xa8) {
            func_02001d78(p + 8, 4);
        }

        func_02004f3c(p + 8, r9, (char *)ctx + 0xc40, 0x13, j, fixedj);
        func_02001d78(p + 8, negone);
    }

    return 1;
}
