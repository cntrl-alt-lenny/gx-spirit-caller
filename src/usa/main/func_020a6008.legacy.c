typedef struct {
    short field0;
    short field2;
} Data_021a9938;

extern Data_021a9938 data_021a9858;
extern void CpuSet(const void *src, void *dst, unsigned int lenMode);
extern int func_02090780(void);

void func_020a6008(void) {
    int zero = 0;

    CpuSet(&zero, &data_021a9858, 0x05000001);
    data_021a9858.field2 = (short)func_02090780();
}
