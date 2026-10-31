typedef struct {
    int field_0;
    char *field_4;
} Context;

extern void *func_0209dca8(void);
extern int func_0209db88(int count, ...);
extern void func_020928cc(void *ptr, int size);
extern void func_020928e8(void *ptr, int size);
extern void func_0209de5c(int idx, int b);
extern void func_02094688(const void *src, void *dst, unsigned int size);
/* The callee reads count trailing words; this caller supplies six arguments. */
extern int func_0209dd30(int arg0, unsigned short count, int arg2, int arg3, int unused4, ...);

int func_0209f720(int a0, const void *a1, void *a2, unsigned int a3)
{
    Context *ctx = func_0209dca8();
    int result;
    int words[2];

    result = func_0209db88(1, 11);
    if (result != 0) return result;
    func_020928cc(ctx->field_4 + 0x10, 4);
    if (*(int *)(ctx->field_4 + 0x10) == 0) return 3;
    if (a3 > 0x5e4) return 6;
    func_020928e8(a2, a3);
    func_0209de5c(0x12, a0);
    func_02094688(a1, words, 6);
    result = func_0209dd30(0x12, 4, words[0], words[1], (int)a2, a3);
    return result == 0 ? 2 : result;
}
