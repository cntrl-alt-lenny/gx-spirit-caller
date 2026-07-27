extern int func_ov002_0225929c(void);
extern char data_ov002_022cd73c[];
extern int func_ov002_02259f74(int x);
extern int func_ov002_0225a0e0(int x);
extern int func_ov002_02266220(int x);

int func_ov002_0225984c(void) {
    int flags = 0;
    int state = func_ov002_0225929c();

    switch (state) {
    case 2:
        if (func_ov002_02259f74(*(int *)(data_ov002_022cd73c + 4)) != 0) {
            flags |= 8;
        }
        if (func_ov002_0225a0e0(*(int *)(data_ov002_022cd73c + 4)) != 0) {
            flags |= 0x20;
        }
        break;
    case 3:
        if (func_ov002_0225a0e0(*(int *)(data_ov002_022cd73c + 4)) != 0) {
            flags |= 0x10;
            if (func_ov002_02266220(*(int *)(data_ov002_022cd73c + 4)) != 0) {
                flags |= 0x20;
            }
        }
        break;
    }
    return flags;
}
