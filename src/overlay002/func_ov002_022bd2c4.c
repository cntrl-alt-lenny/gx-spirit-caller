typedef struct { int active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022cd73c[];
extern char data_ov002_022ccfec[];
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern int func_020a978c(char *dest, const char *format, ...);
static inline int contains(Pair *p, int i) {
    for (; i < 16; i++, p++) {
        if (p->active && p->id == 0x4a) return 1;
    }
    return 0;
}
int func_ov002_022bd2c4(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0: {
        Pair *p = data_ov002_022d28fc;
        *(int *)(self + 0xce8) = (unsigned short)*(unsigned int *)(self + 0xc58);
        *(int *)(self + 0xce4) = (unsigned short)(*(unsigned int *)(self + 0xc58) >> 16);
        func_ov002_022bdb88(p, 0x4a,
            (*(int *)(self + 0xce4) & 0xff) | (*(int *)(self + 0xce8) == data_ov002_022cd73c[1] ? 0 : 0x100), self + 0xc80, 0);
        func_020a978c(self + 0x924, data_ov002_022ccfec);
        *(int *)(self + 0xcec) = 1;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 1: {
        Pair *p = data_ov002_022d28fc;
        if (*(int *)(self + 0xc64) == 60) {
            *(int *)(self + 0xcec) = 0;
            func_02037208(0x33, -1, 0, 1);
        }
        if (contains(p, 0)) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2:
        *(int *)(self + 0xcec) = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}



