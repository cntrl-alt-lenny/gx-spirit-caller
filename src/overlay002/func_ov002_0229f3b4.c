struct S {
    int f0;
    int f4;
    int f8;
    char _pad[0xc];
    int f18;
};

void func_ov002_0229f3b4(struct S *self) {
    if (self->f0 == 0) return;
    self->f4 = 0;
    if (self->f8 >= 0x10) {
        if (self->f18 == 0x10) self->f18 = 0;
    }
    if (self->f18 == 0) return;
    self->f18 = (self->f18 + 1) % 17;
}
