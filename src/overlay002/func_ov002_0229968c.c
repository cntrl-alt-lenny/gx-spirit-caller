extern int data_ov002_022cd524[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cf288[];
extern int func_ov002_0227c630(int a);
extern int func_ov002_021c9e14(int a);
extern int func_ov002_021c9c94(int arg0);
extern int func_ov002_022864d0(int a, int *out);
extern int func_ov002_02298dcc(int a, int b, int c);

int func_ov002_0229968c(void)
{
    int a = *(int *)(data_ov002_022d016c + 0xcec);
    int out;
    int b;
    switch (data_ov002_022cd524[2]) {
    case 0:
        if (!func_ov002_0227c630(a) ||
            ((*(unsigned int *)(data_ov002_022cf288 + (a & 1) * 0x868) >> 17) & 1) ||
            (!func_ov002_021c9e14(a) && !func_ov002_021c9c94(a))) {
            data_ov002_022cd524[2]++;
            return 0;
        }
        b = func_ov002_022864d0(a, &out);
        if (b > -1) {
            if (func_ov002_02298dcc(a, b, out)) {
                data_ov002_022cd524[2]++;
            }
            return 0;
        }
        data_ov002_022cd524[2]++;
        return 0;
    default:
        return 1;
    }
}
