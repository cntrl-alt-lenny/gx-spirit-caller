extern char *GetSystemWork(void);
/* These forwarding definitions are marked void, but the original caller
 * consumes their r0 results, as do other matched callers. */
extern int func_020139b4(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern int func_020190fc(void);
extern unsigned int func_020191cc(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit02013c64 { unsigned int b0 : 1; };
void func_02013c64(int *dst) {
    char *sw = GetSystemWork();
    if (((struct Bit02013c64 *)(sw + 0x8d8))->b0 == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 0: break;
    case 1:
        switch (*(int *)(sw + 0x924)) {
        case 1:
            *(int *)(sw + 0x924) = 3;
        case 3:
            if (func_020190ec() != 0) {
                if (func_0201b7e0(dst) == 4) {
                    if (func_020139c4() == 0) dst[2] = 0x30100;
                }
            }
            break;
        case 2:
            if (func_0201b7e0(dst) == 5) dst[2] = 0x30101;
            break;
        }
        break;
    case 2:
        if (func_02019664() == 0x6a) {
            if (func_0201969c() == 4) dst[2] = 0x30200;
        }
        break;
    case 3:
        switch (*(int *)(sw + 0x924)) {
        case 1:
            *(int *)(sw + 0x924) = 3;
        case 3:
            if ((int)func_020191cc() >= 4) {
                if (func_020139b4() == 2) {
                    if (func_0201b7e0(dst) == 8) {
                        dst[2] = 0x30300;
                        ((struct Bit02013c64 *)(sw + 0x8e0))->b0 = 1;
                    }
                }
            }
            break;
        case 2:
            if (((struct Bit02013c64 *)(sw + 0x8e0))->b0 == 0) {
                if (func_020195ec() == 0) dst[2] = 0x30301;
                else dst[2] = 0x30302;
            }
            break;
        }
        break;
    case 4:
        if (func_0201b7e0(dst) == 4) {
            if (func_020139c4() == 0) {
                if (func_020190fc() != 0) dst[2] = 0x30400;
            }
        }
        break;
    case 5:
        if (func_0201b7e0(dst) == 5) dst[2] = 0x30500;
        break;
    case 6:
        dst[2] = 0x30600;
        break;
    }
}
