extern char *GetSystemWork(void);
extern int func_02019630(void);
extern int func_02019668(void);
extern void func_0201ab70(int v);
extern void func_0201ab94(int v);
extern void func_02018a04(int v);
extern void func_02018a30(void);
extern int func_0201b7a0(int *dst);

struct Bit02017d18 {
    unsigned int b0 : 1;
};

void func_02017ce4(int *o) {
    char *sw = GetSystemWork();
    int x;

    if (((struct Bit02017d18 *)(sw + 0x8d8))->b0 == 0) {
        return;
    }

    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_02019630() != 0x66) {
            return;
        }
        o[2] = 0x00270100;
        x = *(int *)(sw + 0x900);
        x |= 0x1000000;
        *(int *)(sw + 0x900) = x;
        break;
    case 2:
        if (func_0201b7a0(o) != 4) {
            return;
        }
        o[2] = 0x00270200;
        func_0201ab70(2);
        func_02018a04(0x13);
        break;
    case 3:
        if (func_02019630() != 0x65) {
            return;
        }
        if (func_02019668() != 2) {
            return;
        }
        o[2] = 0x00270300;
        func_0201ab94(2);
        x = *(int *)(sw + 0x900);
        x &= ~0x1000000;
        *(int *)(sw + 0x900) = x;
        func_02018a30();
        break;
    default:
        break;
    }
}
