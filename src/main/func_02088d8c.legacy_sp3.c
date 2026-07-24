extern void *data_021a5204;
extern int data_021a520c;
extern int data_021a5340;
extern void func_0209256c(int *, int, int);
extern void func_02091af4(int *);

void func_02088d8c(void) {
    if (data_021a5204 == 0) {
        return;
    }
    data_021a5204 = 0;
    func_0209256c(&data_021a520c, 0, 1);
    func_02091af4(&data_021a5340);
}
