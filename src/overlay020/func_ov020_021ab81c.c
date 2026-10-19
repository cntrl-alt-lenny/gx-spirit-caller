extern char data_ov020_021ae060[];
extern char data_ov020_021ae0a8[];
extern int func_020b3870(int numerator, int denominator);
extern int func_0207e638(int *o, unsigned a1);
extern int func_ov020_021aa8f0(int a0, int *a1, int a2, int *a3, int a4, int a5);

int func_ov020_021ab81c(int a0, int *a1) {
    char *base = data_ov020_021ae0a8;
    int count;
    int i;
    int total;
    int pos[2];
    int kind;
    if (*(int *)(data_ov020_021ae060 + 0x8c8) == 0)
        count = 16;
    else
        count = func_020b3870((*(int *)(base + 0x880) - *(int *)(base + 0x884)) << 4, *(int *)(base + 0x880));
    pos[0] = 0xc6000;
    pos[1] = 0x4000;
    total = 0;
    for (i = 0; i < count; i++) {
        if (i == 0) kind = 4;
        else if (i == 15) kind = 6;
        else kind = 5;
        total += func_ov020_021aa8f0(a0, a1, func_0207e638(*(int **)(base + 0x924), (unsigned short)kind), pos, 0, -1);
        pos[0] -= 0xa000;
    }
    return total;
}


