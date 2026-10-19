typedef struct {
    char pad[2];
    unsigned short state;
} Obj_0207a1dc_t;

typedef struct {
    char pad0[0x2260];
    int state;
    char pad1[7];
    unsigned char flag;
    char pad2[0x14];
    unsigned short result;
} GxState;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_0207b038(int mode);
extern int func_0209f698(int a0);
extern int func_0207a1dc(Obj_0207a1dc_t *a);
extern GxState *data_021a088c;

int func_0207b888(void) {
    int mask = OS_DisableIrq();
    GxState *g = data_021a088c;
    if (g == 0) {
        OS_RestoreIrq(mask);
        return 1;
    }
    switch (g->state) {
    case 10:
        OS_RestoreIrq(mask);
        return 2;
    case 3:
        OS_RestoreIrq(mask);
        return 0;
    default:
        OS_RestoreIrq(mask);
        return 1;
    case 9:
        break;
    }
    if (g->flag == 1) {
        func_0207b038(10);
        data_021a088c->result = 6;
    } else {
        switch (func_0209f698((int)func_0207a1dc)) {
        case 2:
            func_0207b038(10);
            data_021a088c->result = 6;
            break;
        case 8:
            OS_RestoreIrq(mask);
            return 4;
        case 3:
        default:
            func_0207b038(11);
            OS_RestoreIrq(mask);
            return 7;
        }
    }
    OS_RestoreIrq(mask);
    return 3;
}
