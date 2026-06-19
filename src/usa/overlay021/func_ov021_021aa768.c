/* func_ov021_021aa768: C-23 uniform MMIO family (ov006-class). gotcha 19. */
extern void func_02021104(void);
extern void func_0200e9a8(void);
extern int data_020c3d68, data_02103cc0;
extern char data_ov021_021acda0[];
int func_ov021_021aa768(void) {
    func_02021104();
    if (*(int *)(data_ov021_021acda0 + 8) != 0) {
        func_0200e9a8();
        *(int *)0x04000540 = (data_020c3d68 << 1) | data_02103cc0;
    }
    return 1;
}
