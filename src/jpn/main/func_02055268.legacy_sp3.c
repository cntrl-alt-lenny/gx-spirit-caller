extern int  func_020aace8(void);
extern int  func_02045398(int arg);
extern void func_020aad04(int val, void *self);

int func_02055268(void *self) {
    int result;

    if (self == 0) return 0;

    result = func_02045398(func_020aace8() + 1);
    if (result != 0) {
        func_020aad04(result, self);
    }
    return result;
}
