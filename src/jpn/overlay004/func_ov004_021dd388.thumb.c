#pragma thumb on
extern char data_ov004_022913bc[];
extern char data_ov004_022913b4[];
extern char data_ov004_022913d0[];
extern void func_ov004_021dbc48(void *p, int v, int n);
void func_ov004_021dd388(unsigned char *a) {
    char *p;
    func_ov004_021dbc48(data_ov004_022913bc, 0, 8);
    *(int *)data_ov004_022913b4 = 1;
    func_ov004_021dbc48(data_ov004_022913d0, 0, 28);
    p = data_ov004_022913d0;
    *(unsigned char **)(p + 0) = a + 6;
    *(int *)(p + 4) = *(unsigned short *)(a + 4);
    *(int *)(p + 8) = *(unsigned short *)a & 15;
    *(unsigned char *)(p + 25) = a[2];
    *(int *)(p + 12) = 0;
    *(int *)(p + 16) = 0xC0A80B01;
    *(unsigned char *)(p + 24) = 0;
}
