struct State {
    char pad0[4];
    int f4;
    char pad1[0x60];
    int *f68;
    char pad2[4];
    int *f70;
};
extern void Task_InvokeLocked(void *p);
extern void *Task_PostLocked(int size, int align, int flags);
extern unsigned int func_0202b0e0(int id);
extern int func_0202bb20(int a);
extern int func_0202bb30(int a);
extern int func_0202e234(int x);
extern int func_0202e2c8(int unused0);
extern int func_0202e2f8(int unused0);
extern void *func_ov002_021afbc4(void);
extern int data_020b4768;
extern char data_ov002_022cdc78[];

void func_ov002_022ac0c0(struct State *self)
{
    int j;
    int count;
    int out;
    unsigned int card;
    int i;
    if (self->f68 != 0) {
        Task_InvokeLocked(self->f68);
        self->f68 = 0;
    }
    if (self->f70 != 0) {
        Task_InvokeLocked(self->f70);
        self->f70 = 0;
    }
    switch (-self->f4) {
    case 0x4b:
    case 0x4c:
    case 0x4d:
        count = data_020b4768;
        self->f70 = Task_PostLocked((count * 4), 4, 0);
        break;
    default:
        self->f68 = Task_PostLocked(((int)func_ov002_021afbc4() * 4), 4, 0);
        for (j = 0; j < (int)func_ov002_021afbc4(); j++) {
            self->f68[j] = j;
        }
        return;
    }
    out = 0;
    switch (-self->f4) {
    case 0x4b: {
        int i;
        unsigned int card;
        for (i = 1; i < count; i++) {
            card = func_0202b0e0(i);
            if (func_0202e2f8(card) == 0 &&
                (func_0202bb20(card) != 0 || func_0202bb30(card) != 0)) {
                self->f70[out++] = card;
            }
        }
        break;
    }
    case 0x4c: {
        int i;
        unsigned int card;
        for (i = 1; i < count; i++) {
            card = func_0202b0e0(i);
            if (func_0202e2f8(card) == 0 && func_0202e2c8(card) == 0 &&
                (func_0202bb20(card) != 0 || func_0202bb30(card) != 0)) {
                self->f70[out++] = card;
            }
        }
        break;
    }
    case 0x4d: {
        int i;
        unsigned int card;
        for (i = 1; i < count; i++) {
            card = func_0202b0e0(i);
            if (func_0202e234(card) != 0 && func_0202e2f8(card) == 0 && func_0202e2c8(card) == 0 &&
                (func_0202bb20(card) != 0 || func_0202bb30(card) != 0)) {
                self->f70[out++] = card;
            }
        }
        break;
    }
    }
    *(int *)(data_ov002_022cdc78 + 0xc) = out;
}





