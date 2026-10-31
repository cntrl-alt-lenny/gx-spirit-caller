typedef struct {
    int pad[4];
    int state;
} Shared;

typedef struct {
    int pad;
    Shared *shared;
} Context;

extern void *func_0209dca8(void);
extern int func_0209db88(int count, ...);
extern void func_020928cc(void *ptr, int size);
extern void func_020928e8(void *ptr, int size);
extern void func_0209de5c(int idx, int b);
/* The original supplies four arguments; the fifth definition parameter is unused. */
extern int func_0209dd30();

int func_0209f7fc(int arg0, void *buffer, unsigned int size) {
    Context *ctx = func_0209dca8();
    int result = func_0209db88(1, 8);
    if (result != 0) {
        return result;
    }
    func_020928cc(&ctx->shared->state, 4);
    if (ctx->shared->state == 1) {
        return 3;
    }
    if (size < 0x10) {
        return 6;
    }
    if (buffer == 0) {
        return 6;
    }
    func_020928e8(buffer, size);
    func_0209de5c(0x11, arg0);
    result = func_0209dd30(0x11, 2, buffer, size);
    if (result == 0) {
        result = 2;
    }
    return result;
}
