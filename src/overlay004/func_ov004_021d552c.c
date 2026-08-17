/* func_ov004_021d552c: if self->f38, clear it, play a sfx and maybe stop
 * a voice track. Then if func_02046ae0() < 2, transition self to state
 * 0x27 and return; else if data_ov004_0220b500->f78 == 0, bail; else
 * fire a second transition via func_ov004_021d8cd0/func_ov004_021d3a58. */
extern int data_ov004_022915e8[];
extern int data_ov004_0220b500[];
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *rec, int b, int c);
extern int func_02046ac4(void);
extern void func_ov004_021d62b8(int a);
extern int func_02046ae0(void);
extern void func_ov004_021d8cd0(void *rec);
extern void func_ov004_021d3a58(int *p, int a1, int a2);

void func_ov004_021d552c(void *selfv) {
    char *self = (char *)selfv;
    int flag;
    if (*(int *)(self + 0x38) != 0) {
        *(int *)(self + 0x38) = 0;
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        int r = func_0202c0c0(0xde);
        func_ov004_021d8798(data_ov004_022915e8, r, 0);
        if (func_02046ac4() != 0) {
            func_ov004_021d62b8(0);
        }
    }
    if (func_02046ae0() < 2) {
        *(int *)(self + 0x30) = 0x27;
        *(int *)(self + 0x38) = 1;
        *(int *)(self + 0x3c) = 0;
        return;
    }
    if (*(int *)((char *)data_ov004_0220b500 + 0x78) == 0) return;
    func_ov004_021d8cd0(data_ov004_022915e8);
    func_ov004_021d3a58((int *)self, 0x25, 0x78);
}
