extern char data_020ffa24;
extern char data_020ffa30;
extern void func_020a6c60(void *file, void *msg, int zero, int line);
extern void func_020542a0(void *self, int idx);
extern void func_02053e40(void *self, int idx);

struct Self02053e58 { int count; };

void func_02053de4(struct Self02053e58 *self, int idx) {
    if (idx < 0 || idx >= self->count)
        func_020a6c60(&data_020ffa30, &data_020ffa24, 0, 0xca);

    func_020542a0(self, idx);
    func_02053e40(self, idx);
}
