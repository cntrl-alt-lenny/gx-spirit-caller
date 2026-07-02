extern char *GetSystemWork(void);
extern int func_02019034(void);
extern int func_020195ec(void);
extern int func_02019664(void);
extern int func_ov000_021ae4ac(void);

struct Bit02014814 {
    unsigned int b0 : 1;
};

void func_02014814(int *o) {
    char *sw = GetSystemWork();
    int x;

    if (((struct Bit02014814 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }
    if (*(int *)(sw + 0x920) != 1) {
        return;
    }

    switch (*(int *)(sw + 0x924)) {
    case 0:
        break;
    case 1:
        *(int *)(sw + 0x924) = 4;
    case 4:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) {
            return;
        }
        if (func_02019664() != 0x6c) {
            return;
        }
        o[2] = 0x00090100;
        x = *(int *)(sw + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(sw + 0x8e0) = x;
        break;
    case 3:
        if (func_ov000_021ae4ac() == 2) {
            *(int *)(sw + 0x91c) = 0xa;
            *(int *)(sw + 0x920) = 1;
            *(int *)(sw + 0x924) = 1;
            *(int *)(sw + 0x8e0) |= 4;
            break;
        }
        if (((struct Bit02014814 *)(sw + 0x8e0))->b0 != 0) {
            return;
        }
        if (func_020195ec() == 0) {
            o[2] = 0x00090101;
        } else {
            o[2] = 0x00090102;
        }
        break;
    case 2:
        o[2] = 0x00090103;
        break;
    default:
        break;
    }
}
