extern int func_0204bd8c(void);
extern void func_0204525c(void *a0, void *a1);
extern void func_02049038(int a0, void *a1, int a2);
extern void *func_020498f0(void);
extern int func_02049120(int v);
extern void func_0204f280(void);
extern int data_020ff9c4;

typedef void (*FnPtr)(void *, int, int, int, int, int);

void func_02050054(void *a0, void *a1) {
    void *obj;
    int r7, r8;
    void *saved;
    int r5v;

    obj = func_020498f0();
    if (obj == 0) {
        return;
    }
    if (a0 == 0) {
        return;
    }
    func_0204bd8c();
    func_0204525c(a0, a1);
    func_02049038(1, &data_020ff9c4, 0);
    obj = func_020498f0();
    r7 = (*(unsigned char *)((char *)obj + 0x15) == 2) ? 1 : 0;
    obj = func_020498f0();
    r8 = (*(int *)((char *)obj + 0x20c) == 0) ? 1 : 0;
    saved = func_020498f0();
    obj = func_020498f0();
    r5v = func_02049120(*(int *)((char *)obj + 0x20c));
    obj = func_020498f0();
    ((FnPtr)(*(void **)((char *)saved + 0x464)))(a0, 0, r8, r7, r5v, *(int *)((char *)obj + 0x468));
    func_0204f280();
}
