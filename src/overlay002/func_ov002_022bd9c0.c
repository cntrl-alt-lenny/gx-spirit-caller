typedef struct { int active; int id; } Pair;
extern char data_ov002_022d016c[];
extern char data_ov002_022d1af8[];
extern Pair data_ov002_022d28fc[];
extern int func_ov002_022bc2b4(int id);
extern int func_02036590(int id, int arg);
extern int func_020373cc(int a, int b, int c, int d);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, int arg);
extern void func_ov002_022b3898(void *self);
int func_ov002_022bd9c0(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        *(int *)(self + 0xc48) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1:
        if (*(int *)(self + 0xc64) == 10) {
            int mode = *(int *)(self + 0xc58);
            int sound;
            func_02036590(func_ov002_022bc2b4(*(int *)(data_ov002_022d016c + 0xdc)), 0);
            if (mode == 1) sound = 0x2a;
            else if (mode == 2) sound = 0x2b;
            else sound = 0x2c;
            func_020373cc(sound, 1, 0, -1);
        }
        if (*(int *)(self + 0xc64) == 40) {
            int mode = *(int *)(self + 0xc58);
            Pair *array = data_ov002_022d28fc;
            func_ov002_022bdb88(array, 0x4c, mode == 1 ? 0 : mode == 2 ? 1 : 2, 0, 0);
        }
        if (*(int *)(self + 0xc64) < 300 + 20 * ((*(int *)(self + 0xc58) == 2) - (*(int *)(self + 0xc58) == 1))) break;
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    case 2:
        func_ov002_022b3898(data_ov002_022d1af8);
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}



