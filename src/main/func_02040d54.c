extern int func_02040de8(int, int);
extern int func_020aaddc(void);
extern void func_020aadf8(int, int);

int func_02040d54(int arg0, int arg1, int arg2, int arg3) {
    int result1 = func_02040de8(arg0, arg1);
    if (result1 == 0) {
        return 0;
    }
    if (func_020aaddc() >= arg3) {
        return 0;
    }
    func_020aadf8(arg2, result1);
    return 1;
}
