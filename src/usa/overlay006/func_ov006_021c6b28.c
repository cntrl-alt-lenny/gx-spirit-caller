/* func_ov006_021c6b28: if a precondition and a global mode bit both hold, run
 * a pass; always bump the object's tick counter; return 1. */
extern int  func_ov006_021c6e18(void);
extern void func_ov006_021c6e34(int *obj);
extern char data_02104acc[];
int func_ov006_021c6b28(int *obj) {
    if (func_ov006_021c6e18() != 0 && (*(unsigned short *)(data_02104acc + 84) & 0x800))
        func_ov006_021c6e34(obj);
    obj[18]++;
    return 1;
}
