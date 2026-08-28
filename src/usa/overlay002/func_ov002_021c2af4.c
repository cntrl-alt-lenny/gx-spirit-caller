extern char data_ov002_022cf08c[];
extern char data_ov002_022cf0a0[];
extern int func_ov002_021b9118(int *a, int *b);
extern int func_ov002_021c2a6c(int player, int idx);

int func_ov002_021c2af4(int player, int *arg1) {
    int off = (player & 1) * 0x868;
    unsigned int precheck = *(unsigned int *)(data_ov002_022cf0a0 + off);
    int i = precheck - 1;
    if (i >= 0) {
        char *row = data_ov002_022cf08c + off;
        int *arr = (int *)(row + 0x418);
        do {
            if (func_ov002_021b9118(&arr[i], arg1) != 0)
                return func_ov002_021c2a6c(player, i);
            i--;
        } while (i >= 0);
    }
    return 0;
}
