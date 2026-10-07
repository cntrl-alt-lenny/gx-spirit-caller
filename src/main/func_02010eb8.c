typedef struct Obj {
    int m[12];
    int mtx2[12];
    char _pad[0xac - 0x60];
    void (*onInit)(struct Obj *);
} Obj;

extern void func_0208ecd8(int a, int b, int c, int d, int e, int f, int g, int h, int *out);
extern void func_02011178(Obj *self, int *m2);

int func_02010eb8(Obj *self) {
    int buf[16];

    if (self->onInit != 0) {
        self->onInit(self);
    }
    func_0208ecd8(-0x70000, 0x70000, -0x80000, 0x80000, -0x400000, 0x400000, 0x400000, 1, buf);
    self->m[0] = buf[0];
    self->m[1] = buf[1];
    self->m[2] = buf[2];
    self->m[3] = buf[4];
    self->m[4] = buf[5];
    self->m[5] = buf[6];
    self->m[6] = buf[8];
    self->m[7] = buf[9];
    self->m[8] = buf[10];
    self->m[9] = buf[12];
    self->m[10] = buf[13];
    self->m[11] = buf[14];
    func_02011178(self, self->mtx2);
    return 1;
}
