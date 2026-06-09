#pragma thumb on
extern void func_ov004_021dbe68(unsigned char *p, int q, int n);
extern int func_ov004_021dbc8c(void);
extern int func_ov004_021dbd6c(int x);
void func_ov004_021dd244(int count, unsigned char *array, int arg2) {
    int i;
    for (i = 0; i < count; i++) {
        func_ov004_021dbe68(array, arg2, 6);
        *(unsigned short *)(array + 6) = func_ov004_021dbc8c();
        *(unsigned short *)(array + 6) = func_ov004_021dbd6c(*(unsigned short *)(array + 6));
        array += 8;
    }
}
