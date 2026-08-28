extern void *data_0219ebf8;
extern void func_02094500(void *arg0, int arg1, int arg2);
extern void func_02070f40(void *arg0);
extern int func_0206ee98(void *arg0);
extern void func_02070f28(void);

int func_0206e210(void *arg0) {
    unsigned char buf[0x64];
    void *ptr;
    int result;
    void *vtable;

    if (arg0 == 0) {
        return 0;
    }
    vtable = data_0219ebf8;
    ptr = ((void *(*)(int))(*(void **)((char *)vtable + 0x18)))(0xfd0);
    if (ptr == 0) {
        return 0;
    }
    func_02094500(buf, 0, 0x64);
    *(void **)(buf + 0x40) = ptr;
    *(int *)(buf + 0x3c) = 0xb68;
    *(void **)(buf + 0x4c) = (char *)ptr + 0xb68;
    *(int *)(buf + 0x48) = 0x466;
    func_02070f40(buf);
    result = func_0206ee98(arg0);
    func_02070f28();
    vtable = data_0219ebf8;
    ((void (*)(void *))(*(void **)((char *)vtable + 0x1c)))(ptr);
    return result;
}
