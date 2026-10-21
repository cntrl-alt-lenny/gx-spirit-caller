typedef struct Obj02031d0c Obj02031d0c;
extern void func_02031d0c(Obj02031d0c *node);
extern void func_0203473c(void);
extern void func_ov004_021c9d8c(int x);
extern void func_ov004_021d6468(void *node);
extern int data_ov004_022915e8;
extern char data_ov004_0220e500[];

static inline unsigned int is_busy(void) {
    int result;
    if (data_ov004_022915e8 != 0) result = 1; else result = 0;
    return result;
}

void func_ov004_021d5a90(void *self_) {
    int *self = (int *)self_;
    int flag;
    if (self[0xe] != 0) {
        self[0xe] = 0;
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        func_0203473c();
    }
    flag = is_busy();
    if (flag) {
        return;
    }
    func_ov004_021d6468(0);
    if (*(int *)(data_ov004_0220e500 + 0xccc) != 0) {
        func_ov004_021c9d8c(0xa);
    } else {
        func_ov004_021c9d8c(0xb);
    }
    func_02031d0c((Obj02031d0c *)self);
}

