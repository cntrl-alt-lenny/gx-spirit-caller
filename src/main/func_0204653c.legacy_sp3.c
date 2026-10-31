typedef struct {
    char pad0[0x24];
    int mode;
    char pad1[0x74];
    int count;
} State;
extern State *data_0219daec;
extern void func_020480b4(int a0, int a1);
extern void func_0204931c(int a0, int a1);
extern void func_02050054(int a0, int a1);

int func_0204653c(int code) {
    int sub;
    int kind;
    if (code == 0) return 0;
    switch (code) {
    case 1: kind = 9; sub = -1; break;
    case 2: kind = 9; sub = -2; break;
    case 3: kind = 6; sub = -10; break;
    case 4: kind = 6; sub = -20; break;
    }
    switch (data_0219daec->mode) {
    case 1:
        sub += (int)0xffff11b8;
        func_020480b4(kind, sub);
        break;
    case 2:
        sub += (int)0xffff11b8;
        if (data_0219daec->count < 1) func_020480b4(kind, sub);
        break;
    case 5:
        sub += (int)0xfffec398;
        func_02050054(kind, sub);
        break;
    case 4:
        sub += (int)0xfffeeaa8;
        break;
    default:
        sub += (int)0xfffe9c88;
        break;
    }
    func_0204931c(kind, sub);
    return code;
}


