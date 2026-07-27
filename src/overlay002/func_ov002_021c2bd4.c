extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_ov002_021b91f8(int *a, int *b);
extern int func_ov002_021c2b4c(int player, int idx);

int func_ov002_021c2bd4(int player, int *arg1) {
    int off = (player & 1) * 0x868;
    unsigned int precheck = *(unsigned int *)(data_ov002_022cf180 + off);
    int i = precheck - 1;
    if (i >= 0) {
        char *row = data_ov002_022cf16c + off;
        int *arr = (int *)(row + 0x418);
        do {
            if (func_ov002_021b91f8(&arr[i], arg1) != 0)
                return func_ov002_021c2b4c(player, i);
            i--;
        } while (i >= 0);
    }
    return 0;
}
