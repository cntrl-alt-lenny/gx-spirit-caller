extern int data_ov004_022915e8;
static inline unsigned int is_busy(void) {
    int result; if (data_ov004_022915e8 != 0) result = 1; else result = 0; return result;
}
void func_ov004_021d4870(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    if (is_busy() != 0) return;
    *(int *)(p + 0x30) = 0x29;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
