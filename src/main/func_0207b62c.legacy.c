extern int OS_DisableIrq(void); /* The IRQ primitive returns the saved mask in r0. */
extern void OS_RestoreIrq(int saved);
extern void func_0207b038(int a0);
extern int func_0209d758(void);
extern void func_020928cc(void *p, int size);
extern int func_0209de74(void);
extern int func_0209f168(int a0);
extern int func_0209f0d8(int a0);
extern int func_0209f030(int a0);
extern void func_0207ab68(void *event);
extern void func_02079e78(void *event);
extern unsigned char *data_021a088c;

int func_0207b62c(void) {
    int irq = OS_DisableIrq();
    unsigned short *p;
    int result;
    if (data_021a088c == 0) {
        OS_RestoreIrq(irq);
        return 1;
    }
    switch (*(unsigned int *)(data_021a088c + 0x2260)) {
    case 13:
        OS_RestoreIrq(irq);
        return 2;
    case 1:
        OS_RestoreIrq(irq);
        return 0;
    case 6:
        func_0207b038(13);
        *(unsigned short *)(data_021a088c + 0x2280) = 9;
        OS_RestoreIrq(irq);
        return 3;
    default:
        OS_RestoreIrq(irq);
        return 1;
    case 3:
    case 9:
    case 12:
        break;
    }
    if (data_021a088c[0x226b] == 1) {
        func_0207b038(13);
        *(unsigned short *)(data_021a088c + 0x2280) = 9;
    } else {
        p = (unsigned short *)func_0209d758();
        func_020928cc(p, 2);
        switch (*p) {
        case 0:
            result = func_0209de74();
            if (result == 0) {
                func_0207b038(1);
                *(unsigned short *)(data_021a088c + 0x2280) = 0;
                OS_RestoreIrq(irq);
                return 0;
            }
            break;
        case 1:
            result = func_0209f168((int)func_0207ab68);
            break;
        case 2:
            result = func_0209f0d8((int)func_0207ab68);
            break;
        default:
            data_021a088c[0x226b] = 1;
            result = func_0209f030((int)func_02079e78);
            break;
        }
        switch (result) {
        case 2:
            func_0207b038(13);
            *(unsigned short *)(data_021a088c + 0x2280) = 9;
            break;
        case 8:
            OS_RestoreIrq(irq);
            return 4;
        case 3:
        default:
            func_0207b038(11);
            OS_RestoreIrq(irq);
            return 7;
        }
    }
    OS_RestoreIrq(irq);
    return 3;
}
