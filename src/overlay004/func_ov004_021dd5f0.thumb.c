#pragma thumb on
extern char data_ov004_02291610[];
extern char data_ov004_02291608[];
extern void func_ov004_021de23c(int x);
void func_ov004_021dd5f0(void) {
    if (*(int *)data_ov004_02291610 != 0) {
        func_ov004_021de23c(*(int *)data_ov004_02291610);
        *(int *)data_ov004_02291610 = 0;
    }
    if (*(int *)data_ov004_02291608 != 0) {
        func_ov004_021de23c(*(int *)data_ov004_02291608);
        *(int *)data_ov004_02291608 = 0;
    }
}
