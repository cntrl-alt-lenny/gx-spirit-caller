extern int data_021a6730;
extern int data_021a6734;
extern void func_02092844(void *p);
extern void func_02095a50(void);
extern void func_02095c18(void);

void func_020952f8(void) {
    if (data_021a6730 != 0) {
        return;
    }
    data_021a6730 = 1;
    func_02092844(&data_021a6734);
    func_02095a50();
    func_02095c18();
}
