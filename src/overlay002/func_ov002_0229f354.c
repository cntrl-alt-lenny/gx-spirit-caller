struct Self0229f354 {
    int f_0;
    char _pad[8];
    int f_c;
    int f_10;
};

struct Pair0229f354 {
    int x;
    int y;
};

extern void func_ov002_0229f2f8(void *self, int *out1, int *out0);

void func_ov002_0229f354(struct Pair0229f354 *out, struct Self0229f354 *self) {
    struct Pair0229f354 tmp;
    int local1, local0;
    func_ov002_0229f2f8(self, &local1, &local0);
    tmp.x = self->f_c * 8 + local1 / 2;
    tmp.y = self->f_10 * 8 + local0 / 2;
    *out = tmp;
}
