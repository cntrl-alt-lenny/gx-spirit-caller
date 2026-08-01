extern void func_ov002_0228090c(int arg0, int *out1, int *out0, int flag);

extern char data_ov002_022cf08c[];

struct SelfBits2 {
    unsigned short b0 : 1;
};

int func_ov002_02287238(void *self) {
    int local1, local0;
    int bit0 = ((struct SelfBits2 *)((char *)self + 2))->b0;

    func_ov002_0228090c(1 - bit0, &local1, &local0, 1);
    if (local1 > -1) {
        int mybit = ((struct SelfBits2 *)((char *)self + 2))->b0;
        int myrow = *(int *)(data_ov002_022cf08c + (mybit & 1) * 0x868);
        if (local1 < myrow) {
            int otherrow = *(int *)(data_ov002_022cf08c + ((1 - mybit) & 1) * 0x868);
            if (local1 >= otherrow) {
                return 1;
            }
            if (local1 >= 0x868 - 0x28c) {
                int diff = otherrow - local1;
                if (diff < myrow) {
                    return 1;
                }
            }
        }
    }

    {
        int bit0b = ((struct SelfBits2 *)((char *)self + 2))->b0;
        func_ov002_0228090c(bit0b, &local1, &local0, 1);
        if (local1 > -1) {
            int mybit = ((struct SelfBits2 *)((char *)self + 2))->b0;
            int myrow = *(int *)(data_ov002_022cf08c + (mybit & 1) * 0x868);
            if (local1 < myrow) {
                int otherrow = *(int *)(data_ov002_022cf08c + ((1 - mybit) & 1) * 0x868);
                if (local1 >= otherrow) {
                    return 1;
                }
            }
        }
    }

    return 0;
}
