typedef unsigned int u32;
typedef struct {
    char pad0[0x2260];
    int state;
    char pad1[8];
    u32 mode;
    char pad2[0x10];
    unsigned short status;
} State;
typedef struct {
    char pad[2];
    unsigned short field_2, field_4, field_6;
} func_0207ae74_t;
extern State *data_021a088c;
/* The IRQ assembly primitive returns the old mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_0207b408(u32 *p, int arg);
extern void func_0207b038(int a0);
extern int func_0209e0f0(int a0, int a1);
extern int func_0209e4f8(void);
extern int func_0209de74(void);
extern void *func_0209e8d0(void *arg);
extern int func_0209f1b0(int a0);
extern void func_0207ae74(func_0207ae74_t *self);
extern void func_0207ab68(void *arg);

int func_0207bfd4(u32 *p, int arg) {
    int mask = OS_DisableIrq();
    State *s = data_021a088c;
    if (s == 0) {
        OS_RestoreIrq(mask);
        return 1;
    }
    switch (s->state) {
    case 1:
        func_0207b408(p, arg);
        break;
    case 2:
        OS_RestoreIrq(mask);
        return 2;
    case 3:
        OS_RestoreIrq(mask);
        return 0;
    default:
        OS_RestoreIrq(mask);
        return 1;
    }
    switch (func_0209e0f0((int)data_021a088c, (unsigned short)data_021a088c->mode)) {
    case 3:
        func_0207b038(11);
        OS_RestoreIrq(mask);
        return 7;
    case 4:
        OS_RestoreIrq(mask);
        return 5;
    case 1:
    case 2:
    case 5:
    case 6:
    default:
        func_0207b038(11);
        OS_RestoreIrq(mask);
        return 7;
    case 0:
        break;
    }
    if (func_0209e4f8() == 0) {
        if (func_0209de74() != 0) {
            func_0207b038(11);
            OS_RestoreIrq(mask);
            return 7;
        }
        OS_RestoreIrq(mask);
        return 5;
    }
    if (func_0209e8d0((void *)func_0207ae74) != 0) {
        func_0207b038(11);
        OS_RestoreIrq(mask);
        return 7;
    }
    switch (func_0209f1b0((int)func_0207ab68)) {
    case 2:
        func_0207b038(2);
        data_021a088c->status = 1;
        break;
    case 8:
        func_0207b038(12);
        OS_RestoreIrq(mask);
        return 1;
    case 3:
    default:
        func_0207b038(11);
        OS_RestoreIrq(mask);
        return 7;
    }
    OS_RestoreIrq(mask);
    return 3;
}


