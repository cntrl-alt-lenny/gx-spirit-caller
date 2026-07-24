extern void *data_021a5124;
extern int data_021a512c;
extern int data_021a5260;
extern void func_02092484(int *, int, int);
extern void func_02091a0c(int *);

void func_02088ca4(void) {
    if (data_021a5124 == 0) {
        return;
    }
    data_021a5124 = 0;
    func_02092484(&data_021a512c, 0, 1);
    func_02091a0c(&data_021a5260);
}
