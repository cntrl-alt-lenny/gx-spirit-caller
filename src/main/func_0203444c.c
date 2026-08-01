/* func_0203444c: sequential subsystem-setup sequence. Each step gets a
 * fresh handle via func_0203268c() (never cached across calls) and
 * configures it. Bails with -1 (calling func_02093bfc() first) if either
 * the initial func_020330e4 or the final func_020335d4 call reports a
 * negative result.
 */

extern void *func_0203268c(void);
extern int   func_020330e4(void *ctx, int n, void *fp1, void *fp2);
extern void  func_02093bfc(void);
extern void  func_020335c8(void *ctx, int a, int b);
extern void  func_02032e80(void *ctx, unsigned int tag);
extern void  func_020335b8(void *ctx, int n, void *a, void *b);
extern void  func_02032f74(void *ctx, void *fp);
extern int   func_02032644(void *ctx, void *addr);
extern void  func_02033a48(void *ctx, int n, void *addr);
extern int   func_020335d4(void *ctx, int a, int b);

extern void func_02034194(void);
extern void func_020341a4(void);
extern void func_02034430(void);

extern unsigned char data_020fe46c;
extern unsigned char data_020fe478;

int func_0203444c(void *p) {
    void *ctx;
    int r;
    char *r4;
    int result;

    ctx = func_0203268c();
    r = func_020330e4(ctx, 0x3c, func_02034194, func_020341a4);
    if (r < 0) {
        func_02093bfc();
        return -1;
    }

    ctx = func_0203268c();
    func_020335c8(ctx, 0, 0);

    ctx = func_0203268c();
    func_02032e80(ctx, 0x4159584a);

    ctx = func_0203268c();
    func_020335b8(ctx, 0x2a0f, &data_020fe46c, &data_020fe478);

    ctx = func_0203268c();
    func_02032f74(ctx, func_02034430);

    ctx = func_0203268c();
    *(int *)((char *)ctx + 0xeb0) = 0x7530;
    r4 = (char *)p + 0x84 + 0x400;
    result = func_02032644(ctx, (char *)p + 0x84);
    *(unsigned short *)((char *)p + 0x400 + 0x84) = result << 11;
    *(unsigned short *)(r4 + 2) = 0;
    *(unsigned short *)(r4 + 4) = 0;
    *(unsigned char *)(r4 + 6) = 3;

    ctx = func_0203268c();
    func_02033a48(ctx, 8, r4);

    ctx = func_0203268c();
    r = func_020335d4(ctx, 2, 0x400);
    if (r >= 0) {
        return 0;
    }

    func_02093bfc();
    return -1;
}
