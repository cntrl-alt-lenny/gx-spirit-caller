extern int data_ov004_022915e8;
extern char data_ov004_0220e500[];
extern void *func_0203268c(void);
struct func_02033488_struct;
extern int func_02033488(struct func_02033488_struct *p);
extern int func_ov004_021c9d60(int a, int b);
extern int func_ov004_021d8798(void *p, int value, int flags);
static inline unsigned int take_flag(void *rec) {
    char *p = rec;
    int result;
    if (*(int *)(p + 0x38) != 0) {
        *(int *)(p + 0x38) = 0;
        result = 1;
    } else result = 0;
    return result;
}
static inline unsigned int is_busy(void) {
    int result;
    if (data_ov004_022915e8 != 0) result = 1; else result = 0;
    return result;
}
void func_ov004_021d49b4(void *rec) {
    char *p = rec;
    if (take_flag(rec) != 0) {
        func_ov004_021d8798(&data_ov004_022915e8, func_ov004_021c9d60(0, 0x15), 0x12);
    }
    if (is_busy() != 0) return;
    *(int *)(data_ov004_0220e500 + 0xccc) = 1;
    func_02033488(func_0203268c());
    *(int *)(p + 0x30) = 0x22;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}

