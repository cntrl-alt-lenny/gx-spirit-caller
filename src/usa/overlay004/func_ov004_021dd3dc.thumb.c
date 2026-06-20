#pragma thumb on
extern char data_ov004_022913b0[];
extern char data_ov004_022913a8[];
extern void func_ov004_021de028(int x);
void func_ov004_021dd3dc(void) {
    if (*(int *)data_ov004_022913b0 != 0) {
        func_ov004_021de028(*(int *)data_ov004_022913b0);
        *(int *)data_ov004_022913b0 = 0;
    }
    if (*(int *)data_ov004_022913a8 != 0) {
        func_ov004_021de028(*(int *)data_ov004_022913a8);
        *(int *)data_ov004_022913a8 = 0;
    }
}
