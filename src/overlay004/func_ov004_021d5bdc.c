extern void *func_0203268c(void);
extern void func_02032fc8(void *obj, int value);
extern void func_02032fe4(void *obj, int value);
extern void func_0203301c(void *obj, int value);
extern int func_02045678(void);
extern void func_02093bfc(void);
extern void func_ov004_021d38a4(void *p);
/* Original caller supplies a context pointer; existing callee C omits it. */
extern int func_ov004_021d3c8c(void *context);
extern void func_ov004_021d3dc8(void);
extern int func_ov004_021d3ddc(void);
extern int func_ov004_021d3de4(int arg0);
extern int data_020fe468;
static inline unsigned int flag(void) {
    int result;
    if (*(unsigned int *)((char *)func_0203268c() + 0xeb4) & 1) result = 1; else result = 0;
    return result;
}
static inline void state(int *self, int value) {
    self[0xc] = value;
    self[0xe] = 1;
    self[0xf] = 0;
}
int func_ov004_021d5bdc(void *self_) {
    int *self = self_;
    func_ov004_021d38a4(self);
    if (func_02045678() == 4) {
        if (flag()) state(self, 0x18);
        else state(self, 0xf);
    } else {
        func_ov004_021d3c8c(self);
        if (data_020fe468 < 0) {
            func_02093bfc();
            return -1;
        }
        if (data_020fe468 == 3) state(self, 0);
        else state(self, 1);
        data_020fe468 = 0;
    }
    func_0203301c(func_0203268c(), (int)func_ov004_021d3dc8);
    func_02032fc8(func_0203268c(), (int)func_ov004_021d3ddc);
    func_02032fe4(func_0203268c(), (int)func_ov004_021d3de4);
    return 0;
}


