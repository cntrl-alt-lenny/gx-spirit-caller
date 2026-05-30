/* func_ov021_021aa848: C-23 uniform MMIO family (ov006-class). gotcha 19. */
extern void func_02021158(void);
extern void func_0200e9c4(void);
extern int data_020c3e48, data_02103da0;
extern char data_ov021_021ace80[];
int func_ov021_021aa848(void) {
    func_02021158();
    if (*(int *)(data_ov021_021ace80 + 8) != 0) {
        func_0200e9c4();
        *(int *)0x04000540 = (data_020c3e48 << 1) | data_02103da0;
    }
    return 1;
}
