typedef void *(*fn_02032e38_t)(void *a, int b);
typedef struct { char _pad[0xebc]; fn_02032e38_t fn; } ctx_02032e38_t;
extern void *func_02032e38(ctx_02032e38_t *ctx, void *arg1, int arg2);
extern void func_020945f4(void *dst, int val, unsigned int size);
typedef struct { char pad[0xc80]; void *entries[1]; } state_t;
int func_020326d4(ctx_02032e38_t *obj, int count) {
    state_t *state = (state_t *)((char *)obj + 0x1fc);
    void **entries = state->entries;
    int size;
    if (*entries != 0) return -1;
    size = count * 12;
    *entries = func_02032e38(obj, (void *)size, 4);
    if (*entries == 0) return -1;
    func_020945f4(*entries, 0, size);
    return 0;
}
