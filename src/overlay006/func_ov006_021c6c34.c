/* func_ov006_021c6c34: if a precondition and a global mode bit both hold, run
 * a pass; always bump the object's tick counter; return 1. */
extern int  func_ov006_021c6f24(void);
extern void func_ov006_021c6f40(int *obj);
extern char data_02104bac[];
int func_ov006_021c6c34(int *obj) {
    if (func_ov006_021c6f24() != 0 && (*(unsigned short *)(data_02104bac + 84) & 0x800))
        func_ov006_021c6f40(obj);
    obj[18]++;
    return 1;
}
