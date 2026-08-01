extern char *GetSystemWork(void);
extern int func_020195ec(void);
extern int func_02019640(int v);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abd4(int v);
extern void func_0201b7b4(void);

struct Bit0 { unsigned int b : 1; };
struct Bits8e0 { unsigned int bit0 : 1; unsigned int bit1 : 1; };

void func_02017be0(void *o) {
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
        if (func_02019664() != 0x65) {
            return;
        }
        if (func_0201969c() != 7) {
            return;
        }
        *(int *)((char *)o + 8) = 0x00260100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 3:
        if (((struct Bits8e0 *)(w + 0x8e0))->bit0 != 0) {
            return;
        }
        if (func_020195ec() != 0) {
            goto L_a18;
        }
        *(int *)((char *)o + 8) = 0x00260104;
        if (((struct Bits8e0 *)(w + 0x8e0))->bit1 == 0) {
            *(int *)(w + 0x924) -= 1;
        }
        func_0201b7b4();
        func_0201abd4(7);
        return;
L_a18:
        *(int *)((char *)o + 8) = 0x00260102;
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x00260103;
        if (((struct Bits8e0 *)(w + 0x8e0))->bit1 == 0) {
            *(int *)(w + 0x920) = 1;
            *(int *)(w + 0x924) = 5;
        }
        if (((struct Bits8e0 *)(w + 0x8e0))->bit1 != 0) {
            return;
        }
        func_02019640(0);
        return;
    }
}
