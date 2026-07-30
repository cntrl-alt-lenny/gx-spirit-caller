extern int func_ov002_022591b4(void);
extern char data_ov002_022cd65c[];
extern int func_ov002_02259e8c(int x);
extern int func_ov002_02259ff8(int x);
extern int func_ov002_02266138(int x);

int func_ov002_02259764(void) {
    int flags = 0;
    int state = func_ov002_022591b4();

    switch (state) {
    case 2:
        if (func_ov002_02259e8c(*(int *)(data_ov002_022cd65c + 4)) != 0) {
            flags |= 8;
        }
        if (func_ov002_02259ff8(*(int *)(data_ov002_022cd65c + 4)) != 0) {
            flags |= 0x20;
        }
        break;
    case 3:
        if (func_ov002_02259ff8(*(int *)(data_ov002_022cd65c + 4)) != 0) {
            flags |= 0x10;
            if (func_ov002_02266138(*(int *)(data_ov002_022cd65c + 4)) != 0) {
                flags |= 0x20;
            }
        }
        break;
    }
    return flags;
}
