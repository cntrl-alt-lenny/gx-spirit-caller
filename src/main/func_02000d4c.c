extern char data_02105904[];
extern char data_021040ac[];
int func_02000d4c(void)
{
    int count = *(int *)(data_02105904 + 0x80);
    char *rec;
    if (count == 0) return -1;
    --count;
    rec = data_02105904 + count * 0x10;
    *(int *)(data_021040ac + 0x3c) = *(int *)(rec + 4);
    *(int *)(data_021040ac + 0x40) = *(int *)(rec + 8);
    *(int *)(data_021040ac + 0x44) = *(int *)(rec + 0xc);
    *(int *)(data_02105904 + 0x80) = count;
    return *(int *)rec;
}
