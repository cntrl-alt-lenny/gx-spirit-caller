struct func_02033488_struct;
typedef struct Obj02033554 Obj02033554;
extern void *func_0203268c(void);
extern int func_02033488(struct func_02033488_struct *p);
extern int func_02033544(void *p);
extern int func_0203354c(void *p);
extern void func_02033554(Obj02033554 *obj);
extern int func_02034114(int p, int b);
extern int func_02034160(unsigned int x);
extern void func_ov004_021ce1bc(int idx);
extern void func_ov004_021d3b74(void *rec, int arg1, int arg2, int arg3, int arg5);
extern void func_ov004_021d8cd0(void *rec);
extern int data_ov004_0220b500[];
extern int data_ov004_022915e8[];
extern int data_021040ac[];

static inline unsigned int busy(void) {
    int result;
    if (data_ov004_022915e8[0] != 0) result = 1; else result = 0;
    return result;
}
static inline void state(int *self, int value) {
    self[0xc] = value;
    self[0xe] = 1;
    self[0xf] = 0;
}
void func_ov004_021d5838(void *self_) {
    int *self = self_;
    int *global = data_ov004_0220b500;
    int a, b, flag;
    if (self[0xe] != 0) {
        self[0xe] = 0;
        flag = 1;
    } else flag = 0;
    if (flag) {
        a = func_0203354c(func_0203268c());
        b = func_02033544(func_0203268c());
        self[0x12] = func_02034114(a, b);
        if (global[0x19] != 0) {
            func_ov004_021d8cd0(data_ov004_022915e8);
            global[0x19] = 0;
        } else {
            func_ov004_021d3b74(self, b, 0, self[0x12], 0);
        }
    }
    flag = busy();
    if (flag) return;
    if (func_02034160(self[0x12]) != 0) {
        func_02033488(func_0203268c());
        state(self, 0x29);
    } else {
        if (global[0x13] == 0) global[0x22] = -1;
        data_021040ac[0x2eb] = -1;
        func_ov004_021ce1bc(0);
        func_ov004_021ce1bc(1);
        switch (func_0203354c(func_0203268c())) {
        case 0: state(self, 0x18); break;
        case 1:
        case 2: state(self, 0x18); break;
        case 3: state(self, 0x22); break;
        case 4: break;
        case 5: break;
        case 6: state(self, 0x29); break;
        case 7: state(self, 0x28); break;
        }
    }
    func_02033554(func_0203268c());
}

