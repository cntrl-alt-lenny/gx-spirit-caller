extern char *GetSystemWork(void);
extern int *func_0201b75c(void);
extern int func_0201b7e0(int *dst);

struct Bit02013b4c {
    unsigned int b0 : 1;
};

void func_02013b4c(int *dst) {
    char *sw = GetSystemWork();
    int *p;

    if (((struct Bit02013b4c *)(sw + 0x8d8))->b0 == 0) {
        return;
    }

    switch (*(int *)(sw + 0x920)) {
    case 0:
        break;
    case 1:
        dst[2] = 0x00020100;
        break;
    case 2:
        dst[2] = 0x00020200;
        p = func_0201b75c();
        *p &= ~0x2000;
        break;
    case 3:
        dst[2] = 0x00020300;
        break;
    case 4:
        dst[2] = 0x00020400;
        break;
    case 5:
        if (func_0201b7e0(dst) == 4) {
            dst[2] = 0x00020500;
        }
        break;
    case 6:
        if (func_0201b7e0(dst) == 5) {
            dst[2] = 0x00020600;
        }
        break;
    case 7:
        dst[2] = 0x00020700;
        break;
    case 8:
        dst[2] = 0x00020800;
        break;
    case 9:
        dst[2] = 0x00020900;
        break;
    case 10:
        dst[2] = 0x00020a00;
        break;
    default:
        break;
    }
}
