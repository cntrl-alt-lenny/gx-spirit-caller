typedef unsigned short u16;

struct Self0222c8dc {
    u16 f0;
    u16 b0 : 1;
    u16 f1_5 : 5;
    u16 rest : 10;
};

extern char data_ov002_022d016c[];
extern int func_ov002_0223df38(void *self, int flag, int *out1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021c4c9c(int arg0, int arg1, void *out2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, u16 arg4);

int func_ov002_0222c8dc(struct Self0222c8dc *self) {
    int local1;
    int local2[11];

    if (func_ov002_0223df38(self, 0, &local1) == 0) {
        goto end;
    }

    {
        u16 v16 = (u16)local1;
        int byte0 = local1 & 0xff;
        unsigned char byte1 = (unsigned char)(v16 >> 8);

        if (func_ov002_0225764c((int)self, byte0, byte1) == 0) {
            goto end;
        }

        func_ov002_021c4c9c(byte0, byte1, local2);

        {
            int cf0 = *(int *)(data_ov002_022d016c + 0xcf0);
            unsigned char bit0 = (unsigned char)self->b0;
            unsigned char field5 = (unsigned char)self->f1_5;
            u16 packed = (u16)(bit0 | (field5 << 8));
            u16 cf0_16 = (u16)cf0;

            func_ov002_021d59cc(byte0, byte1, packed, 7, cf0_16);
        }

        {
            int v1 = *(int *)((char *)local2 + 0x18);
            u16 v1c;
            if (v1 > 0xffff) v1 = 0xffff;
            v1c = (u16)v1;
            func_ov002_021d59cc(byte0, byte1, self->f0, 0x12, v1c);
        }

        {
            int v2 = *(int *)((char *)local2 + 0x14);
            u16 v2c;
            if (v2 > 0xffff) v2 = 0xffff;
            v2c = (u16)v2;
            func_ov002_021d59cc(byte0, byte1, self->f0, 0x12, v2c);
        }
    }

end:
    return 0;
}
