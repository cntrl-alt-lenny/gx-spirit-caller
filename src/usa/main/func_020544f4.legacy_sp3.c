extern char data_020ffaac[];
extern char data_020ffaa0[];
extern void func_020a6c60(char *file, char *expr, int zero, int line);
extern int func_02053c9c(int *p, int a1, int a2, int a3, int a5);
extern void func_02054008(void *self, void *val);
extern void func_02053d88(void *self, int arg1, int idx);

typedef struct {
    void **items;                     /* +0x0 */
    void *ctx;                        /* +0x4 */
    char pad8[4];                     /* +0x8 */
    int (*cb)(int param1, void *ctx); /* +0xc */
    int a2;                           /* +0x10 */
} Self02054568;

void func_020544f4(Self02054568 *self, int param1) {
    int slot;
    int result;

    if (self == 0) func_020a6c60(data_020ffaac, data_020ffaa0, 0, 0x71);
    if (self == 0) return;

    slot = self->cb(param1, self->ctx);

    result = func_02053c9c((int *)self->items[slot], param1, self->a2, 0, 0);
    if (result == -1) {
        func_02054008(self->items[slot], (void *)param1);
    } else {
        func_02053d88(self->items[slot], param1, result);
    }
}
