typedef unsigned char u8;
typedef struct {
    u8 pad0[0xd];
    u8 count;
    u8 pad1[0x7];
    u8 mode;
    u8 pad2[0xcd];
    void *list;
    u8 pad3[0xc];
    int ids[1];
} Ctx;
typedef struct {
    u8 pad0[0x474];
    int (*cb)(int, int);
    int cbarg;
} Ctx2;
extern void *func_020498f0(void);
extern int func_02068cb8(void *list);
extern void *func_02068cc8(void *list, int i);
extern int func_02068a20(void *obj, void *d, int z);
extern void func_02068d24(void *list, void *obj);
extern void func_02068b1c(void *obj, void *d, int v);
extern void func_02068ca8(void *list, int a, void *d, int b);
extern int func_020459f0(int v);
extern char data_020ff974[];
extern char data_020ff980[];

#define C ((Ctx *)func_020498f0())
#define C2 ((Ctx2 *)func_020498f0())

int func_0204a2ec(int arg) {
    int found;
    int d;
    int flag = 0;
    int i = 0;
    int k;
    void *obj;
    for (; i < func_02068cb8(C->list); i++) {
        obj = func_02068cc8(C->list, i);
        if (C->mode == 0) {
            d = func_02068a20(obj, data_020ff980, 0);
            found = 0;
            for (k = 1; k <= C->count; k++) {
                if (d == C->ids[k]) {
                    func_02068d24(C->list, obj);
                    found = 1;
                    i--;
                    break;
                }
            }
            if (found) continue;
        }
        if (C2->cb != 0) {
            Ctx2 *p = C2;
            int v = p->cb(i, ((Ctx2 *)func_020498f0())->cbarg);
            if (v > 0) {
                if (v > 0x7fffff) v = 0x7fffff;
                func_02068b1c(obj, data_020ff974, func_020459f0(0x100) | (v << 8));
            } else {
                func_02068d24(C->list, obj);
                flag = 1;
                i--;
            }
        } else {
            func_02068b1c(obj, data_020ff974, func_020459f0(0x80));
        }
    }
    if (arg != 0 && func_02068cb8(C->list) != 0) {
        func_02068ca8(C->list, 0, data_020ff974, 0);
    }
    if (flag != 0 && func_02068cb8(C->list) == 0) return 0;
    return 1;
}
