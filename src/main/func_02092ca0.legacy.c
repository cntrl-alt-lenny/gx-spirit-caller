extern int func_02092b48(int a);
extern void func_02092a48(int a, int b);
extern int func_02092a5c(int a);
extern void func_02092a34(int a, int b);
extern int func_02092368(void);
extern void OS_SetProtectionRegion1(unsigned int val);
extern void OS_SetProtectionRegion2(unsigned int val);
extern int data_021a662c;

void func_02092ca0(void) {
    func_02092a48(2, func_02092b48(2));
    func_02092a34(2, func_02092a5c(2));

    if (data_021a662c != 0) {
        if ((func_02092368() & 0x3) != 1) {
            return;
        }
    }

    OS_SetProtectionRegion1(0x0200002b);
    OS_SetProtectionRegion2(0x023e0021);
}
