extern char data_02101db0[], data_02101df8[], data_02101e18[], data_02101e28[];
extern int data_0219e3f0;
struct F0206b568;
extern void func_0206b568(struct F0206b568 *self);
/* Original caller explicitly supplies ctx to this singleton getter. */
extern void *func_02068c08(void *ctx);
extern char *func_020aadf8(char *dst, const char *src);
extern void func_020a6d54(int a, int b, int c, int d);
extern void func_0206a314(void *p, int value);
extern int func_02055330(void);
extern void func_020a9950(void *p);
extern void func_02055320();

void func_0206b31c(unsigned char *ctx, char *a, char *b, char *c,
                   int arg4, int force, int callback, int arg7) {
    if (ctx == 0)
        func_020a6d54((int)data_02101e18, (int)data_02101db0, 0, 0x11c);
    if (force == 0 && data_0219e3f0 != 1)
        return;
    *(int *)(ctx + 0) = 1;
    func_0206b568((struct F0206b568 *)ctx);
    func_02068c08(ctx);
    func_020aadf8((char *)ctx + 0xc, a);
    func_020aadf8((char *)ctx + 0x30, b);
    func_020aadf8((char *)ctx + 0x54, c);
    *(int *)(ctx + 0x488) = callback;
    *(int *)(ctx + 0x48c) = 0;
    if (callback == 0)
        func_020a6d54((int)data_02101e28, (int)data_02101db0, 0, 0x132);
    *(int *)(ctx + 0x494) = arg7;
    *(char **)(ctx + 0x498) = data_02101df8;
    *(int *)(ctx + 0x4a0) = 0;
    *(int *)(ctx + 0x4b0) = -1;
    *(int *)(ctx + 0x7c) = 0;
    *(int *)(ctx + 0x80) = 0;
    *(int *)(ctx + 8) = 0;
    *(int *)(ctx + 0x484) = -1;
    *(int *)(ctx + 0x480) = 0;
    *(int *)(ctx + 0x4a4) = 0;
    *(int *)(ctx + 0x4b8) = arg4;
    func_0206a314(ctx, (int)data_02101df8);
    *(int *)(ctx + 0x5cc) = 0;
    func_020a9950((void *)func_02055330());
    func_02055320();
}
