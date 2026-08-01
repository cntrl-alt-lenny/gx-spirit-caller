typedef unsigned char u8;

typedef struct {
    u8  _pad0[0x2260];
    int state;              /* +0x2260 */
    u8  _pad1[0x2280 - 0x2264];
    unsigned short f2280;   /* +0x2280 */
} GxState;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern GxState *data_021a088c;
extern void func_0207b038(int s);

int func_0207bc20(void) {
    int mask = OS_DisableIrq();
    GxState *g = data_021a088c;

    if (g == 0) {
        OS_RestoreIrq(mask);
        return 1;
    }

    switch (g->state) {
    case 6:
        func_0207b038(7);
        data_021a088c->f2280 = 4;
        goto ret3;
    case 7:
        OS_RestoreIrq(mask);
        return 2;
    case 3:
        OS_RestoreIrq(mask);
        return 0;
    default:
        OS_RestoreIrq(mask);
        return 1;
    }

ret3:
    OS_RestoreIrq(mask);
    return 3;
}
