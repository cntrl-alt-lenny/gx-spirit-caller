extern char data_02104bac[];
typedef struct { char pad[0x4c]; int field4c; char pad50[0x38]; int field88; } State;
extern State data_ov004_0220b500;
extern char data_ov004_022915e8[];
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *rec, int b, int c);
extern void func_ov004_021d8cd0(void *rec);
extern void func_ov004_021ce1bc(int idx);

void func_ov004_021d5318(void *selfv) {
    char *self = selfv;
    int flag;
    if (*(int *)(self + 0x38) != 0) {
        *(int *)(self + 0x38) = 0;
        flag = 1;
    } else {
        flag = 0;
    }
    if (flag) {
        int r = func_0202c0c0(0x66e);
        func_ov004_021d8798(data_ov004_022915e8, r, 0);
        { State *state = &data_ov004_0220b500; int value = state->field4c; if (value == 0) state->field88 = -1; }
    }
    if (*(unsigned int *)(self + 0x3c) < 0x78) {
        if ((*(unsigned short *)(data_02104bac + 0x54) & 1) == 0) return;
    }
    func_ov004_021d8cd0(data_ov004_022915e8);
    func_ov004_021ce1bc(0);
    *(int *)(self + 0x30) = 0x18;
    *(int *)(self + 0x38) = 1;
    *(int *)(self + 0x3c) = 0;
}





