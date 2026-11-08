extern char data_0210141c[];
extern char data_02101424[];
extern int func_02055330(void);
extern void func_020a6d54(const char *expr, const char *file, const char *func, int line);
extern int func_020a991c(void);
extern void func_020a9950(void *p);

unsigned char *func_02061150(unsigned char *s) {
    int i;
    int state;


    if (s == 0) func_020a6d54(data_0210141c, data_02101424, 0, 0x2b);
    /* The existing seed setter takes void * and stores that word unchanged. */
    func_020a9950((void *)func_02055330());
    s[0] = func_020a991c() % 93 + 33;
    state = 0;
    for (i = 1; i < 32; i++) {
        state = state ^ ((i ^ s[i - 1]) & 1) ^ (s[0] & 1) ^
            ((unsigned int)s[0] < 0x4f ? 1 : 0) ^
            ((unsigned int)s[i - 1] < (unsigned int)s[0] ? 1 : 0);
        s[i] = func_020a991c() % 93 + 33;
        if ((state != 0 && (s[i] & 1) == 0) || (state == 0 && (s[i] & 1) == 1)) s[i]++;
    }
    return s;
}





















