extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_0207b230(void);
extern void func_0207cd7c(void);
extern unsigned int func_020931e8(void);
extern void func_020931f8(void);
extern unsigned int func_0209361c(void);
extern void func_0209362c(void);
extern void func_0209360c(int *p);
extern char *data_021a088c;

int func_0207c280(void *buffer, unsigned int size) {
    int saved = OS_DisableIrq();
    if (data_021a088c != 0) {
        OS_RestoreIrq(saved);
        return 1;
    }
    if (buffer == 0) {
        OS_RestoreIrq(saved);
        return 1;
    }
    if ((unsigned int)buffer & 0x1f) {
        OS_RestoreIrq(saved);
        return 1;
    }
    if (size < 0x2300) {
        OS_RestoreIrq(saved);
        return 6;
    }
    data_021a088c = buffer;
    *(int *)(data_021a088c + 0x2260) = 1;
    *(unsigned short *)(data_021a088c + 0x2280) = 0;
    *(unsigned short *)(data_021a088c + 0x2268) = 0;
    *(unsigned char *)(data_021a088c + 0x226a) = 0;
    *(unsigned char *)(data_021a088c + 0x226b) = 0;
    *(unsigned short *)(data_021a088c + 0x2282) = 0;
    *(unsigned short *)(data_021a088c + 0x22f8) = 0;
    func_0207b230();
    func_0207cd7c();
    if (func_020931e8() == 0) func_020931f8();
    if (func_0209361c() == 0) func_0209362c();
    func_0209360c((int *)(data_021a088c + 0x22cc));
    OS_RestoreIrq(saved);
    return 0;
}
