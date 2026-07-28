struct S022abf88 {
    char _pad0[4];
    int f4;
    char _pad1[0x60];
    int *f68;
    char _pad2[4];
    int *f70;
};

extern int func_ov002_021afaf4(int v);

int func_ov002_022abe4c(struct S022abf88 *self, int idx)
{
    int v = -self->f4;
    switch (v) {
    case 0x4b:
    case 0x4c:
    case 0x4d:
        return self->f70[idx];
    }
    return func_ov002_021afaf4(self->f68[idx]);
}
