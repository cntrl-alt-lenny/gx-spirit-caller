extern void *func_0203268c(void);
/* The thunk preserves func_02051e94's int return, read by this caller. */
extern int func_020337fc(void *p);
extern int data_ov004_022915e8;

static inline int active(void) { return data_ov004_022915e8 ? 1 : 0; }
static inline int pressed(unsigned int mask) { return (*(unsigned int *)((char *)func_0203268c() + 0xeb4) & mask) ? 1 : 0; }
int func_ov004_021d3f44(char *p) {
    int flag;
    flag = active();
    if (flag == 0) {
        if (func_020337fc(func_0203268c()) != 0) return 0;
    }
    if (*(int *)(p + 0x258) == 0) return 0;
    flag = pressed(0x1000);
    if (flag == 1) {
        flag = pressed(0x2000);
        if (flag == 1) {
            *(int *)(p + 0x30) = 0x20;
            *(int *)(p + 0x38) = 1;
            *(int *)(p + 0x3c) = 0;
            return 1;
        } else {
            *(int *)(p + 0x30) = 0x1f;
            *(int *)(p + 0x38) = 1;
            *(int *)(p + 0x3c) = 0;
            return 1;
        }
    }
    return 0;
}



