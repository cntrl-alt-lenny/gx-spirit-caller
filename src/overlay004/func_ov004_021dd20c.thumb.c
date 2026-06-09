#pragma thumb on
extern char data_ov004_0220a29c[];
extern int func_ov004_021de264(void);
int func_ov004_021dd20c(int arg0) {
    if (arg0 == -1) {
        *(int *)data_ov004_0220a29c = arg0;
        return 0;
    }
    if (*(int *)data_ov004_0220a29c != arg0) {
        *(int *)data_ov004_0220a29c = arg0;
        return func_ov004_021de264();
    }
    return 0;
}
