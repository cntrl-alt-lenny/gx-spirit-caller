extern char data_020ffb04;
extern char data_020ffb10;
extern void func_020a6d54(void *file, void *msg, int zero, int line);
extern void func_02054314(void *self, int idx);
extern void func_02053eb4(void *self, int idx);

struct Self02053e58 { int count; };

void func_02053e58(struct Self02053e58 *self, int idx) {
    if (idx < 0 || idx >= self->count)
        func_020a6d54(&data_020ffb10, &data_020ffb04, 0, 0xca);

    func_02054314(self, idx);
    func_02053eb4(self, idx);
}
