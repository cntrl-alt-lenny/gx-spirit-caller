extern int func_ov002_021b947c(int val);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_02226268(void *self, int a1);
extern unsigned char data_ov002_022cf1a4[];

int func_ov002_02226b4c(unsigned short *self, int unused) {
    int result;
    unsigned int b1;
    int b0;

    switch (self[6]) {
    case 2:
        result = func_ov002_021b947c(self[7]);
        b1 = (((unsigned short)result) >> 8) & 0xff;

        if (b1 <= 4) {
            b0 = result & 0xff;

            if (*(unsigned short *)(data_ov002_022cf1a4 + (b0 & 1) * 0x868 + b1 * 20) != 0) {
                func_ov002_021d59cc(b0, b1, self[0], 2, 0);
            }
        }
        return 0;
    default:
        return func_ov002_02226268(self, unused);
    }
}
