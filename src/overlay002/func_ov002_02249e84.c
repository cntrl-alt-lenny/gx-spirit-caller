struct Ov002Data {
    char pad[0x1da2];
    unsigned short v[3];
};
extern struct Ov002Data data_ov002_022cf16c;
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_02249e84(int arg0)
{
    int i;
    int p = 1 - arg0;

    for (i = 0; i < 3; i++) {
        func_ov002_02253458(p, 11, data_ov002_022cf16c.v[i]);
    }
}
