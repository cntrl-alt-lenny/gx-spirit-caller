struct S {
    char pad0[0x69c];
    int f69c;
    char pad1[4];
    int f6a4;
    char pad2[12];
    int f6b4[5];
};
extern struct S data_ov002_022ce288;
extern int func_ov002_0223b4c4(int a, int b);

void func_ov002_0223b584(void)
{
    int max;
    int i;

    i = 0;
    max = 5;
    for (; i < (data_ov002_022ce288.f6a4 > 5 ? max : data_ov002_022ce288.f6a4); i++) {
        data_ov002_022ce288.f6b4[i] = func_ov002_0223b4c4(data_ov002_022ce288.f69c, i);
    }
}
