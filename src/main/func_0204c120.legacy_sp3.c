extern void func_02049038(int a0, void *a1, int a2);
extern int func_0204ab88(void);
extern void func_0204f280(void);
extern void *func_020498f0(void);
extern int func_02049120(int v);
extern int data_020ff9c4;

typedef void (*FnPtr)(int, int, int, int, int, int);

void func_0204c120(void) {
    void *obj;
    int r6, r7;
    void *saved;
    int a4;

    func_02049038(1, &data_020ff9c4, 0);
    if (func_0204ab88() != 0) {
        return;
    }
    func_0204f280();
    obj = func_020498f0();
    if (*(int *)((char *)obj + 0x20c) != 0) {
        r6 = 1;
    } else {
        obj = func_020498f0();
        if (*(unsigned char *)((char *)obj + 0x15) == 2) {
            r6 = 1;
        } else {
            r6 = 0;
        }
    }
    obj = func_020498f0();
    if (*(int *)((char *)obj + 0x20c) == 0) {
        r7 = 1;
    } else {
        r7 = 0;
    }
    saved = func_020498f0();
    obj = func_020498f0();
    a4 = func_02049120(*(int *)((char *)obj + 0x20c));
    obj = func_020498f0();
    ((FnPtr)(*(void **)((char *)saved + 0x464)))(0, 1, r7, r6, a4, *(int *)((char *)obj + 0x468));
    obj = func_020498f0();
    *(unsigned char *)((char *)obj + 0x1a9) = 0;
}
