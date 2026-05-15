/* func_02070f40: 2-deref store at offset 0xa4 (data->f_4 → ptr → [+0xa4] = arg). */

extern char data_021a62f0[];

void func_02070f40(int v) {
    char *p = *(char **)(data_021a62f0 + 0x4);
    *(int *)(p + 0xa4) = v;
}
