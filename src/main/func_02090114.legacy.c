extern unsigned short data_020c3188[];
extern int data_021a6344;
extern int data_021a6340;
extern int func_0208ced4(void);

void func_02090114(void) {
    int result = func_0208ced4();
    int idx = result >> 4;

    data_021a6344 = result;
    data_021a6340 = data_020c3188[idx] << 12;
}
