extern char *GetSystemWork(void);
extern int func_02013990(void);
extern int func_02019000(void);
extern int func_020190b8(void);
extern int func_020190c8(void);
extern int func_02019630(void);
extern void func_0201aa7c(int);
extern void func_0201aab4(int);
extern void func_0201b774(void);
extern int func_0201b7a0(void *o);

struct Bit0 { unsigned int b : 1; };

void func_02016178(void *o) {
    char *w = GetSystemWork();

    if (((struct Bit0 *)(w + 0x8d8))->b == 0) {
        return;
    }

    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_0201b7a0(o) != 4) {
            return;
        }
        if (func_020190c8() == 0) {
            return;
        }
        if ((unsigned int)func_02019000() < (unsigned int)(*(int *)(w + 0x8dc) + 2)) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00180100;
        func_0201b774();
        *(int *)(w + 0x8f8) |= 0x800;
        return;
    case 2:
        if (func_020190b8() == 0) {
            return;
        }
        if (func_02013990() != 5) {
            return;
        }
        if ((unsigned int)func_02019000() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) {
            return;
        }
        if (func_0201b7a0(o) != 5) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00180200;
        func_0201aa7c(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 3:
        if (func_0201b7a0(o) != 3) {
            return;
        }
        if (func_02019630() != 0x78) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00180300;
        func_0201aab4(0x78);
        return;
    }
}
