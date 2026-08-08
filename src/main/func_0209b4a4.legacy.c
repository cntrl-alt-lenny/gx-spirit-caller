extern int data_021a83e4;
extern int func_020937fc(void);
extern void func_02096234(void);

void func_0209b4a4(void) {
    while (data_021a83e4 != 0) {
        if (func_020937fc() == 0x80) {
            func_02096234();
        }
    }
}
