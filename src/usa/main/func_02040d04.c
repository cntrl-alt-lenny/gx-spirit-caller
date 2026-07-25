extern int func_02040d98(int, int);
extern int func_020aace8(void);
extern void func_020aad04(int, int);

int func_02040d04(int arg0, int arg1, int arg2, int arg3) {
    int result1 = func_02040d98(arg0, arg1);
    if (result1 == 0) {
        return 0;
    }
    if (func_020aace8() >= arg3) {
        return 0;
    }
    func_020aad04(arg2, result1);
    return 1;
}
