struct F022afb8c_Self {
    char pad0[0x18];
    int f18;
    char pad1c[0x14];
    int f30;
    int f34;
    int f38;
    int f3c;
    int f40;
    int f44;
};

extern int func_020b3870(int a, int b);

void func_ov002_022afb8c(struct F022afb8c_Self *self, int n) {
    int span;
    int base;
    if (n <= 0) {
        self->f18 = 0;
        self->f3c = self->f40;
        return;
    }
    span = self->f34 - self->f30;
    if (n >= span) {
        self->f18 = span;
        self->f3c = self->f44;
        return;
    }
    self->f18 = n;
    base = self->f40;
    self->f3c = base + func_020b3870(n * (self->f44 - base) + (self->f34 - self->f30) / 2, self->f34 - self->f30);
}
