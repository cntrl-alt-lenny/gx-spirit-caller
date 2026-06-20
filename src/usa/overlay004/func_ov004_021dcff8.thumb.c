#pragma thumb on
extern char data_ov004_0220a03c[];
extern int func_ov004_021de050(void);
int func_ov004_021dcff8(int arg0) {
    if (arg0 == -1) {
        *(int *)data_ov004_0220a03c = arg0;
        return 0;
    }
    if (*(int *)data_ov004_0220a03c != arg0) {
        *(int *)data_ov004_0220a03c = arg0;
        return func_ov004_021de050();
    }
    return 0;
}
