extern int func_0207ec28(void *);
extern int func_0207f934(void *, unsigned short, void *, void *, int *, unsigned short, int);

int func_ov022_021aa6e0(void *arg0, char **arg1, void *arg2, int x, int y, int arg5) {
    int pos[2];
    int count = func_0207ec28(arg0);
    int result;
    pos[0] = x << 12;
    pos[1] = y << 12;
    result = func_0207f934(*arg1, (unsigned short)count, arg2, 0, pos, (unsigned short)arg5, 1);
    *arg1 += result * 8;
    return result;
}
