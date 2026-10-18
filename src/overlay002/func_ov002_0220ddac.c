extern char data_ov002_022ce288[];
extern int func_ov002_0220dd34(int a, int b);
extern int func_ov002_021ff400(int a, int b);

int func_ov002_0220ddac(int a, int b) {
    if (*(int *)(data_ov002_022ce288 + 0x484) + 1 < 4) return 0;
    if (func_ov002_0220dd34(a, b) == 0) return 0;
    return func_ov002_021ff400(a, b);
}
