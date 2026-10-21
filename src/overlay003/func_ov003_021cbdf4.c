extern int func_02034784(void);
extern int func_02034810(void);
extern void *func_02005dac(int, int);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern void func_ov003_021cd420(void *, int);
extern void func_ov003_021cd7dc(void *);
extern void func_ov003_021ce4e4(void *);
extern void func_ov003_021cec24(void *);

typedef struct { unsigned int attr01; unsigned short attr2; } Sprite;
int func_ov003_021cbdf4(void *s) {
    int attr2;
    Sprite sprite;
    if (func_02034784() != 0) {
        attr2 = func_02034810();
        sprite.attr01 = 0x40f02000;
        sprite.attr2 = (attr2 << 1) | 0x800;
        func_020944a4((int)&sprite, (int)func_02005dac(1, 0), 6);
    }
    func_ov003_021cd420(s, 0);
    func_ov003_021cd420(s, 1);
    func_ov003_021cd7dc(s);
    func_ov003_021ce4e4(s);
    if (func_02034784() == 2) {
        func_ov003_021cec24(s);
    }
    return 1;
}





