extern int func_ov002_0223de48(void *self, int flag, int *out);
extern int func_ov002_02257564(void *self, int a, int b);
extern int func_ov002_021d58dc(int a, int b, int c, int d, unsigned short e);

typedef struct {
    unsigned short bit0 : 1;
} Field2T;

int func_ov002_0222f1c0(void *self) {
    int local;

    if (func_ov002_0223de48(self, 0, &local) == 0) {
        goto fail;
    }

    {
        int byte0 = local & 0xff;
        unsigned short lo16 = (unsigned short)local;
        int byte1 = ((int)lo16 >> 8) & 0xff;

        if (func_ov002_02257564(self, byte0, byte1) == 0) {
            goto fail;
        }

        {
            unsigned short field0 = *(unsigned short *)((char *)self + 0);
            int flag = 0;

            if (field0 == 0x1a0b) {
                flag = ((Field2T *)((char *)self + 2))->bit0;
            }

            func_ov002_021d58dc(byte0, byte1, field0, 1, (unsigned short)flag);
        }
    }

fail:
    return 0;
}
