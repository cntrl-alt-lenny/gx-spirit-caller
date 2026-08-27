extern char *GetSystemWork(void);
extern int func_020190b8(void);
extern int func_02013990(void);
extern void func_0201aa7c(int a);
extern int func_02019630(void);
extern void func_0201aab4(int a);
extern void func_0201b774(void);
extern int func_0201b7a0(void *obj);

typedef struct {
    char pad_0[0x8d8];
    unsigned int f8d8 : 1;
    char pad_8dc[0x900 - 0x8dc];
    unsigned int f900;
    char pad_904[0x920 - 0x904];
    int f920;
} SysWork;

void func_02017dbc(void *self) {
    SysWork *sys = (SysWork *)GetSystemWork();

    if (sys->f8d8 == 0) return;

    switch (sys->f920) {
    case 1:
        if (func_020190b8() == 0) return;
        if (func_02013990() != 5) return;
        *(int *)((char *)self + 0x8) = 0x00280100;
        func_0201aa7c(0x7b);
        sys->f900 |= 0x1000000;
        break;
    case 2:
        if (func_0201b7a0(self) != 3) return;
        if (func_02019630() != 0x7b) return;
        *(int *)((char *)self + 0x8) = 0x00280200;
        func_0201aab4(0x7b);
        func_0201b774();
        sys->f900 &= ~0x1000000;
        break;
    }
}
