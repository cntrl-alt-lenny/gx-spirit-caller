extern char data_02105b70[];
extern char data_ov004_0220b500[];
extern char data_ov004_022915e8[];

extern int func_0203309c(void *a, unsigned int b);
extern void *func_0202c0c0(int a);
extern void func_ov004_021d8798(void *a, void *b, int c);
extern void func_02008888(void);
extern int func_02007230(void);
extern void func_ov004_021d8cd0(void *a);
extern void *func_0203268c(void);
extern int func_02032e8c(void *self, void *a1);
extern int func_02032efc(void *self, int idx, void *ptr);

/* func_ov004_021d3c8c: init hook -- if 0203309c's region-check (against
 * the "AYXJ" game-code constant) passes, allocate + register a resource
 * (021d8798) and, unless 02007230's late-fail gate trips, hand it to
 * 021d8cd0. Either way it then re-registers the current context (via the
 * 0203268c singleton) at data_02105b70, and finally re-registers 60 more
 * sub-slots walking data_ov004_0220b500+0x128+0x3c00 in 0x54-byte strides.
 */
int func_ov004_021d3c8c(void) {
    char *base = data_ov004_0220b500;

    if (func_0203309c(data_02105b70, 0x4159584a) == 1) {
        void *h = func_0202c0c0(0xe8);
        func_ov004_021d8798(data_ov004_022915e8, h, 1);
        func_02008888();
        if (func_02007230() != 0) {
            return -1;
        }
        func_ov004_021d8cd0(data_ov004_022915e8);
    }

    func_02032e8c(func_0203268c(), data_02105b70);

    {
        int i;
        char *p = base + 0x128 + 0x3c00;
        for (i = 0; i < 0x3c; i++) {
            func_02032efc(func_0203268c(), i, p);
            p += 0x54;
        }
    }
    return 0;
}
