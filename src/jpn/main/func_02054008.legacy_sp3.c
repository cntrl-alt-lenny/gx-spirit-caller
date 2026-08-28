extern char data_020ffa24;
extern char data_020ffa7c;
extern void func_020a6c60(void *file, void *msg, int zero, int line);
extern void func_02053f50(void *arr, void *val, int idx);

typedef struct { int count; } Self0205407c;

void func_02054008(Self0205407c *self, void *val) {
    if (self == 0) {
        func_020a6c60(&data_020ffa7c, &data_020ffa24, 0, 0xa0);
    }
    if (self == 0) return;
    func_02053f50(self, val, self->count);
}
