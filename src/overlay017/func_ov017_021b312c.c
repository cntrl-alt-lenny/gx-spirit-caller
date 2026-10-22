typedef struct { unsigned short x, y; unsigned char w, h; } Rect;
typedef struct { unsigned short f0, f2, f4, f6, f8, fa; } Box;
extern int func_ov017_021b2ce4(Rect *r);
extern void func_ov017_021b4090(int a1, int a2, int a3, Box *src, int dx, int dy);
extern void func_ov017_021b41fc(int a0, int x, int flags);
extern int func_ov017_021b7dac(void *p);
extern int func_ov017_021b4df8(void *p);
extern char data_ov017_021b8a9c[];
extern char data_ov017_021b80c8[], data_ov017_021b80a0[], data_ov017_021b80aa[];
extern char data_ov017_021b80b4[], data_ov017_021b80be[], data_ov017_021b8610[];
extern unsigned char data_ov017_021b8894[];
extern char data_02104f4c[];
int func_ov017_021b312c(int *p) {
    int state;
    char *box;
    if (*(int *)(data_ov017_021b8a9c + 8) != 0)
        func_ov017_021b7dac(data_ov017_021b8a9c);
    box = data_ov017_021b80c8;
    state = 0;
    if (func_ov017_021b2ce4((Rect *)box) != 0) {
        if (*(int *)(data_ov017_021b8a9c + 8) == 0) {
            p[3] = 4;
            state = 1;
        }
    }
    func_ov017_021b4090((int)p, 14, state, (Box *)box, -1, -1);
    switch (p[1]) {
    case 0:
        box = data_ov017_021b80a0;
        state = 0;
        if (func_ov017_021b2ce4((Rect *)box) != 0) {
            if (*(int *)(data_ov017_021b8a9c + 8) == 0) {
                p[3] = 0;
                state = 1;
            }
        }
        func_ov017_021b4090((int)p, 15, state, (Box *)box, -1, -1);
        state = 1;
        box = data_ov017_021b80aa;
        if (data_ov017_021b8894[0x1ce] == 6 || data_ov017_021b8894[0x1ce] == 11) {
            state = 0;
        } else if (func_ov017_021b2ce4((Rect *)box) != 0) {
            if (*(int *)(data_ov017_021b8a9c + 8) == 0) {
                p[3] = 1;
                state = 2;
            }
        }
        func_ov017_021b4090((int)p, 16, state, (Box *)box, -1, -1);
        box = data_ov017_021b80b4;
        if (((*(unsigned int *)(data_02104f4c + 0xa64) & 0x1f00000) >> 20) != 0 || *(int *)(data_02104f4c + 0xa74) != 0) {
            state = 0;
            if (func_ov017_021b2ce4((Rect *)box) != 0) {
                if (*(int *)(data_ov017_021b8a9c + 8) == 0) {
                    p[3] = 2;
                    state = 1;
                }
            }
            func_ov017_021b4090((int)p, 17, state, (Box *)box, -1, -1);
        } else {
            func_ov017_021b4090((int)p, 27, state, (Box *)box, -1, -1);
        }
        box = data_ov017_021b80be;
        state = 0;
        if (func_ov017_021b2ce4((Rect *)box) != 0) {
            if (*(int *)(data_ov017_021b8a9c + 8) == 0) {
                p[3] = 3;
                state = 1;
            }
        }
        func_ov017_021b4090((int)p, 18, state, (Box *)box, -1, -1);
        if (*(int *)(data_ov017_021b8a9c + 8) == 0)
            func_ov017_021b4090((int)p, 11, -1, (Box *)(data_ov017_021b80a0 + p[3] * 10), -1, -1);
        break;
    case 1:
        if (p[2] == 0) func_ov017_021b4df8(data_ov017_021b8610);
        break;
    }
    func_ov017_021b41fc((int)p, 248, 148);
    return 1;
}
