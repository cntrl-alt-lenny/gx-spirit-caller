extern char *GetSystemWork(void);
extern int func_020139c4(void);
extern int func_02019034(void);
extern int func_020190ec(void);
extern int func_020190fc(void);
extern int func_02019664(void);
extern void func_0201aabc(int);
extern void func_0201aaf4(int);
extern void func_0201b7b4(void);
extern int func_0201b7e0(void *o);

struct Bit0 { unsigned int b : 1; };

void func_020161ac(void *o) {
    char *w = GetSystemWork();

    if (((struct Bit0 *)(w + 0x8d8))->b == 0) {
        return;
    }

    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_0201b7e0(o) != 4) {
            return;
        }
        if (func_020190fc() == 0) {
            return;
        }
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 2)) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00180100;
        func_0201b7b4();
        *(int *)(w + 0x8f8) |= 0x800;
        return;
    case 2:
        if (func_020190ec() == 0) {
            return;
        }
        if (func_020139c4() != 5) {
            return;
        }
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) {
            return;
        }
        if (func_0201b7e0(o) != 5) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00180200;
        func_0201aabc(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 3:
        if (func_0201b7e0(o) != 3) {
            return;
        }
        if (func_02019664() != 0x78) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00180300;
        func_0201aaf4(0x78);
        return;
    }
}
