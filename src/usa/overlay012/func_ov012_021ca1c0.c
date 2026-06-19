/* func_ov012_021ca1c0: (re)spawn the overlay's main task. Snapshots the task
 * template (data_ov012_021cbff8), tears down any running instance
 * (func_ov000 Task_InvokeLocked on data_ov012_021cc5fc[0x180]) when armed
 * (data_ov012_021cc5c0[0x1bc]), then picks the entry point by mode
 * (data_ov012_021cc5fc[0x15c]): mode 0 the default, mode 1 the saved slot's
 * nibble — and starts it (func_02006bf0), caching the task + its work pointer
 * (func_0201d6bc) back into data_ov012_021cc5fc. (ov012_core.h) */
extern void Task_InvokeLocked(int);
extern int func_02006bf0(int, int, int);
extern int func_0201d6bc(void);
extern char data_ov012_021cbff8[];
extern char data_ov012_021cc5c0[];
extern char data_ov012_021cc5fc[];
struct ov012_blk {
    int w[6];
};
struct ov012_nib4c {
    unsigned f : 4;
};
void func_ov012_021ca1c0(void) {
    char *d = data_ov012_021cc5fc;
    struct ov012_blk s = *(struct ov012_blk *)data_ov012_021cbff8;
    int sel;
    if (*(int *)(data_ov012_021cc5c0 + 0x1bc) != 0)
        Task_InvokeLocked(*(int *)(d + 0x180));
    switch (*(int *)(d + 0x15c)) {
    case 0:
        sel = s.w[0];
        break;
    case 1:
        sel = s.w[((struct ov012_nib4c *)(d + 0x160))->f];
        break;
    }
    *(int *)(d + 0x180) = func_02006bf0(sel, 4, 0);
    *(int *)(d + 0x17c) = func_0201d6bc();
}
