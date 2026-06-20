#pragma thumb on
extern void func_ov004_021dbc54(unsigned char *p, int q, int n);
extern int func_ov004_021dba78(void);
extern int func_ov004_021dbb58(int x);
void func_ov004_021dd030(int count, unsigned char *array, int arg2) {
    int i;
    for (i = 0; i < count; i++) {
        func_ov004_021dbc54(array, arg2, 6);
        *(unsigned short *)(array + 6) = func_ov004_021dba78();
        *(unsigned short *)(array + 6) = func_ov004_021dbb58(*(unsigned short *)(array + 6));
        array += 8;
    }
}
