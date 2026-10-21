extern char data_02105904[];
extern char data_021040ac[];
extern void *func_02000cb4(void);

void func_02000cc4(void)
{
    unsigned int base = (unsigned int)data_02105904;
    unsigned int count = *(unsigned int *)(base + 0x80);
    char *rec;
    *(unsigned int *)(base + 0x80) = count + 1;
    rec = (char *)(count * 0x10 + base);
    *(void **)(count * 0x10 + base) = func_02000cb4();
    *(int *)(rec + 4) = *(int *)(data_021040ac + 0x3c);
    *(int *)(rec + 8) = *(int *)(data_021040ac + 0x40);
    *(int *)(rec + 0xc) = *(int *)(data_021040ac + 0x44);
}
