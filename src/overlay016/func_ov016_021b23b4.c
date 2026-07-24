extern char data_ov016_021b9740[];   /* record array, stride 0x54, +0x8c field */
extern char data_ov016_021b9784[];   /* sort base arg */
extern int  func_ov016_021b22d8(char *base);

int func_ov016_021b23b4(void) {
    int   i = 0;
    char *r = data_ov016_021b9740;
    do {
        if (*(int *)(r + 0x8c) == 0) break;
        i++;
        r += 0x54;
        if (i >= 0x3c) break;
    } while (1);
    return func_ov016_021b22d8(data_ov016_021b9784);
}
