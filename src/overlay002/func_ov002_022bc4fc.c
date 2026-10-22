typedef struct { int active; int id; } Pair;
extern Pair data_ov002_022d28fc[];
extern int data_ov002_022d1af8[];
extern int data_ov002_022d0f2c[];
extern char data_ov002_022ccfd8[];
extern char data_ov002_022ccfec[];
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_02036590(unsigned int id, int arg);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_02037dc0(int modeArg, void *arg1, void *arg2);
extern int func_020a978c(char *dest, const char *format, ...);
extern int func_ov002_022bc2b4(int value);
extern int func_ov002_022bdb88(Pair *array, int id, int flags, void *position, void *end);
extern char *func_ov002_022bdf30(int arg0);
int func_ov002_022bc4fc(char *self) {
    switch (*(int *)(self + 0xc60)) {
    case 0:
        data_ov002_022d1af8[1] = 0;
        *(int *)(self + 0xc48) = 0;
        *(int *)(self + 0xc60) = 1;
        *(int *)(self + 0xc64) = 0;
        break;
    case 1: {
        int id;
        char *entry;
        int sound;
        if (*(int *)(self + 0xc64) == 1 && *(int *)(self + 0xc5c) == 0)
            func_02037208(0x8f, -1, 0, 1);
        if (*(int *)(self + 0xc64) < 30) break;
        if (*(int *)(self + 0xc5c) == 0) id = 0;
        else {
            func_ov002_022bdb88(data_ov002_022d28fc, 0x3c, 0, 0, 0);
            id = *(int *)(self + 0xc5c);
            func_020a978c(self + 0x99c, data_ov002_022ccfd8, id);
            func_020a978c(self + 0x9c4, data_ov002_022ccfec);
        }
        entry = func_ov002_022bdf30(id);
        if (entry == 0) entry = func_ov002_022bdf30(0);
        sound = *(short *)(entry + 2);
        *(int *)(self + 0xca4) = sound;
        func_02022234(8, sound);
        sound = func_ov002_022bc2b4(*(int *)(self + 0xc4c));
        if (sound != 0) {
            func_02036590(sound, 15);
            if (*(int *)(self + 0xc50) == 0) {
                if (func_ov002_022bc2b4(*(int *)(self + 0xc5c)) != 0)
                    func_02037dc0(data_ov002_022d0f2c[0x36], 0, (void *)15);
            }
            *(int *)(self + 0xc50) = 0;
        } else func_02037dc0(data_ov002_022d0f2c[0x36], 0, (void *)15);
        if (*(int *)(self + 0xc5c) != 0) func_02037208(0x8f, -1, 0, 1);
        *(int *)(self + 0xc60) = 2;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 2: {
        int delay = *(int *)(self + 0xc5c) == 0 ? 30 : 90;
        int sound;
        if (*(int *)(self + 0xc5c) != 0 && *(int *)(self + 0xc64) == 45)
            func_02037208(0x90, -1, 0, 1);
        if (*(int *)(self + 0xc64) < delay) break;
        *(int *)(self + 0xc4c) = *(int *)(self + 0xc5c);
        sound = func_ov002_022bc2b4(*(int *)(self + 0xc4c));
        if (sound != 0) {
            func_02037208(sound, -1, 30, 1);
            *(int *)(self + 0xc50) = 0xf0;
        } else func_02037dc0(data_ov002_022d0f2c[0x36], (void *)0x7f, (void *)15);
        *(int *)(self + 0xc60) = 3;
        *(int *)(self + 0xc64) = 0;
        break;
    }
    case 3:
        if (*(int *)(self + 0xc64) < 30) break;
        *(int *)(self + 0xc60) = 4;
        *(int *)(self + 0xc64) = 0;
        break;
    case 4:
        data_ov002_022d1af8[1] = 1;
        *(int *)(self + 0xc48) = 1;
        *(int *)(self + 0xcc8) = 12;
        *(int *)(self + 0xc54) = 0;
        return 0;
    }
    *(int *)(self + 0xc64) += 1;
    return 1;
}

