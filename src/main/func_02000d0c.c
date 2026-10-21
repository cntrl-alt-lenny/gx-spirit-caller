extern char data_02105904[];
extern char data_021040ac[];
extern void *func_02000cb4(void);

void func_02000d0c(void)
{
    int count = *(int *)(data_02105904 + 0x80);
    char *rec = data_02105904 + count * 0x10;
    *(void **)(data_02105904 + count * 0x10) = func_02000cb4();
    *(int *)(rec + 4) = *(int *)(data_021040ac + 0x3c);
    *(int *)(rec + 8) = *(int *)(data_021040ac + 0x40);
    *(int *)(rec + 0xc) = *(int *)(data_021040ac + 0x44);
}
