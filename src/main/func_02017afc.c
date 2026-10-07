extern char *GetSystemWork(void);
extern int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201b7e0(void *o);
extern void func_0201abb0(int v);
extern void func_0201b7b4(void);

struct Bit0 { unsigned int b : 1; };

void func_02017afc(void *o) {
    char *w = GetSystemWork();

    if (((struct Bit0 *)(w + 0x8d8))->b == 0) {
        return;
    }
    if (*(int *)(w + 0x920) != 1) {
        return;
    }

    switch (*(int *)(w + 0x924)) {
    case 1:
        *(int *)(w + 0x924) = 4;
        /* fallthrough */
    case 4:
        if (func_0201b7e0(o) != 5) {
            return;
        }
        if (func_02019664() != 0x68) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00250100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 3:
        if (((struct Bit0 *)(w + 0x8e0))->b != 0) {
            return;
        }
        if (func_020195ec() != 0) {
            goto L_b;
        }
        *(int *)((char *)o + 8) = 0x00250101;
        return;
L_b:
        *(int *)((char *)o + 8) = 0x00250102;
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x00250103;
        func_0201b7b4();
        func_0201abb0(7);
        return;
    }
}
