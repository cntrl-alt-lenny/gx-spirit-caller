/* func_ov002_021bc608: scan a fixed 5-entry table; return the first entry
 * for which func_ov002_021bc47c(arg0, entry)!=0, else -1. */
extern int data_ov002_022bdeb4[];
extern int func_ov002_021bc47c(int a, int b);

int func_ov002_021bc608(int arg0) {
    int i;
    for (i = 0; i < 5; i++) {
        int v = data_ov002_022bdeb4[i];
        if (func_ov002_021bc47c(arg0, v) != 0)
            return v;
    }
    return -1;
}
