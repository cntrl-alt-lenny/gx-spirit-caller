extern char data_020ffb04;
extern char data_020ffb5c;
extern void func_020a6d54(void *file, void *msg, int zero, int line);
extern void func_02053fc4(void *arr, void *val, int idx);

typedef struct { int count; } Self0205407c;

void func_0205407c(Self0205407c *self, void *val) {
    if (self == 0) {
        func_020a6d54(&data_020ffb5c, &data_020ffb04, 0, 0xa0);
    }
    if (self == 0) return;
    func_02053fc4(self, val, self->count);
}
