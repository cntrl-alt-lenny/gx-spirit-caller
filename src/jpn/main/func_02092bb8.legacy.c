extern int func_02092a60(int a);
extern void func_02092960(int a, int b);
extern int func_02092974(int a);
extern void func_0209294c(int a, int b);
extern int func_02092280(void);
extern void OS_SetProtectionRegion1(unsigned int val);
extern void OS_SetProtectionRegion2(unsigned int val);
extern int data_021a654c;

void func_02092bb8(void) {
    func_02092960(2, func_02092a60(2));
    func_0209294c(2, func_02092974(2));

    if (data_021a654c != 0) {
        if ((func_02092280() & 0x3) != 1) {
            return;
        }
    }

    OS_SetProtectionRegion1(0x0200002b);
    OS_SetProtectionRegion2(0x023e0021);
}
