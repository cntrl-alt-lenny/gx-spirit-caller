typedef struct {
    void *f0;
    char _pad_8[0x8 - 0x4];
    void *f8;
} Target0205d614;

typedef struct {
    char _pad_c[0xc];
    Target0205d614 *fc;
} Arg1_0205d614;

typedef struct {
    void *f0;
    void *f4;
    void **f8;
    int fc;
} Arg2_0205d614;

typedef struct {
    char **lists;
    int count;
} Set;

typedef struct {
    char _pad0[0x428];
    Set *set;
} Owner;

extern int func_0205d560(Owner **pp, void (*fn)(int a, int b, int c), int arg);
extern int func_0205d614(void *unused, Arg1_0205d614 *arg1, Arg2_0205d614 *arg2);

int func_0205d5c8(Owner **pp, void *key, void *val, void **out) {
    Arg2_0205d614 ctx;

    ctx.f0 = key;
    ctx.f4 = val;
    ctx.fc = 0;
    ctx.f8 = out;
    func_0205d560(pp, (void (*)(int, int, int))func_0205d614, (int)&ctx);
    if (ctx.fc == 0) {
        *out = 0;
    }
    return 0;
}
