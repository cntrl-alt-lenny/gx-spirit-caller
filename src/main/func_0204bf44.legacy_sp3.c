extern void *func_020498f0(void);
extern int func_02049120(int key);
extern int func_0204aaf4(int code);
extern void func_0204c120(void);
extern int func_0204cf7c(int, int, int);
extern int func_0204f0a8(int);
extern void func_0204f3c0(int mode);
typedef void (*Callback)(int, int, int, int, int, int);
typedef struct {
    char pad0[0x15];
    unsigned char mode;
    char pad1[0x1f6];
    int key;
    char pad2[0x254];
    Callback callback;
    int arg;
} Context;
void func_0204bf44(int action) {
    int empty;
    Context *saved;
    int index;
    if (action == 0) {
        func_0204c120();
        return;
    }
    func_0204f3c0(action);
    if (((Context *)func_020498f0())->mode == 2 || ((Context *)func_020498f0())->mode == 3) {
        empty = ((Context *)func_020498f0())->key == 0;
        saved = func_020498f0();
        index = func_02049120(((Context *)func_020498f0())->key);
        saved->callback(0, 1, empty, 0, index, ((Context *)func_020498f0())->arg);
        return;
    }
    if (((Context *)func_020498f0())->mode == 0) {
        if (action != 1) return;
        if (func_0204aaf4(func_0204f0a8(0)) != 0) return;
    } else {
        if (((Context *)func_020498f0())->mode != 1) return;
        if (action != 1) return;
        func_0204cf7c(0, 0, 0);
    }
}
