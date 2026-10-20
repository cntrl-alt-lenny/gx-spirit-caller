struct S022abf88 {
    int f0;
    int f4;
    int f8;
    int fc;
    char pad10[0x10];
    int f20;
    char pad24[0x28];
    int f4c;
    char pad50[0x18];
    void **f68;
};
extern char data_ov002_022d016c[];
extern int func_ov002_021afaf0(void);
extern void func_ov002_021afb64(void *p);
extern void func_ov002_021aff4c(int index, int value);
extern void func_ov002_0229f788(void *self);
extern int func_ov002_022abf88(struct S022abf88 *self, int idx);
void func_ov002_022a28a0(struct S022abf88 *self)
{
    int v;
    void *entry;
    switch (self->f4) {
    case 5:
        *(int *)(data_ov002_022d016c + 0xd44) = self->f20 + 1;
        func_ov002_0229f788(self);
        break;
    case 6:
    case 9:
        self->fc |= 1 << (self->f20 + 1);
        self->f4c++;
        if (self->f4c >= (unsigned short)self->f8) {
            *(int *)(data_ov002_022d016c + 0xd44) = self->fc;
            func_ov002_0229f788(self);
        }
        break;
    default:
        *(int *)(data_ov002_022d016c + 0xd44) = self->f20;
        func_ov002_0229f788(self);
        break;
    }
    if (self->f4 >= 0) return;
    v = -self->f4;
    if (v <= 5) {
        func_ov002_0229f788(self);
        return;
    }
    if (v >= 0x4b) {
        *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_022abf88(self, self->f20);
        func_ov002_0229f788(self);
        return;
    }
    if (v >= 0x48) {
        *(int *)(data_ov002_022d016c + 0xd44) = self->f4c;
        func_ov002_0229f788(self);
        return;
    }
    if (v > 6 && v < 0x49) {
        if (func_ov002_021afaf0() == 1) {
            int index = (int)self->f68[self->f20];
            self->f4c++;
            func_ov002_021aff4c(index, self->f4c);
        }
        *(int *)(data_ov002_022d016c + 0xd44) = self->f4c;
        func_ov002_0229f788(self);
        return;
    }
    if (v >= 6) {
        entry = self->f68[self->f20];
        *(int *)(data_ov002_022d016c + 0xd44) = 1;
        func_ov002_021afb64(entry);
        func_ov002_021aff4c((int)entry, ++self->f4c);
        func_ov002_0229f788(self);
    }
}







