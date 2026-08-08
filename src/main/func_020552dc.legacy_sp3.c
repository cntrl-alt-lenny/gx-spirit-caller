extern int  func_020aaddc(void);
extern int  func_020453e8(int arg);
extern void func_020aadf8(int val, void *self);

int func_020552dc(void *self) {
    int result;

    if (self == 0) return 0;

    result = func_020453e8(func_020aaddc() + 1);
    if (result != 0) {
        func_020aadf8(result, self);
    }
    return result;
}
