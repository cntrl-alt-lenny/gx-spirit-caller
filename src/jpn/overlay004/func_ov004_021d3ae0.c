extern int data_ov004_02209d24;
extern int data_ov004_02291388;
extern int func_0202c06c(int arg0);
extern void func_02032638(void);
extern int func_020334ec(void);
extern void func_02033504(void);
extern void func_ov004_021d86ac(void *arg0, int arg1, int arg2);

void func_ov004_021d3ae0(void *arg0) {
    int result;
    int tmp;

    func_02032638();
    result = func_020334ec();
    switch (result) {
    case 10:
        func_ov004_021d86ac(&data_ov004_02291388, (int)&data_ov004_02209d24, 0x12);
        break;
    case 11:
        tmp = func_0202c06c(0x672);
        func_ov004_021d86ac(&data_ov004_02291388, tmp, 0x12);
        break;
    case 12:
        tmp = func_0202c06c(0x672);
        func_ov004_021d86ac(&data_ov004_02291388, tmp, 0x12);
        break;
    case 13:
        tmp = func_0202c06c(0x673);
        func_ov004_021d86ac(&data_ov004_02291388, tmp, 0x12);
        break;
    default:
        break;
    }
    *(int *)((char *)arg0 + 0x30) = 0x26;
    *(int *)((char *)arg0 + 0x38) = 1;
    *(int *)((char *)arg0 + 0x3c) = 0;
    func_02032638();
    func_02033504();
}
