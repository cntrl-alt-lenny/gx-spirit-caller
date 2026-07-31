extern int data_ov004_02209f84;
extern int data_ov004_022915e8;
extern int func_0202c0c0(int arg0);
extern void func_0203268c(void);
extern int func_0203353c(void);
extern void func_02033554(void);
extern void func_ov004_021d8798(void *arg0, int arg1, int arg2);

void func_ov004_021d3bc0(void *arg0) {
    int result;
    int tmp;

    func_0203268c();
    result = func_0203353c();
    switch (result) {
    case 10:
        func_ov004_021d8798(&data_ov004_022915e8, (int)&data_ov004_02209f84, 0x12);
        break;
    case 11:
        tmp = func_0202c0c0(0x672);
        func_ov004_021d8798(&data_ov004_022915e8, tmp, 0x12);
        break;
    case 12:
        tmp = func_0202c0c0(0x672);
        func_ov004_021d8798(&data_ov004_022915e8, tmp, 0x12);
        break;
    case 13:
        tmp = func_0202c0c0(0x673);
        func_ov004_021d8798(&data_ov004_022915e8, tmp, 0x12);
        break;
    default:
        break;
    }
    *(int *)((char *)arg0 + 0x30) = 0x26;
    *(int *)((char *)arg0 + 0x38) = 1;
    *(int *)((char *)arg0 + 0x3c) = 0;
    func_0203268c();
    func_02033554();
}
