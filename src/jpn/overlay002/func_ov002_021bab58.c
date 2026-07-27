/* func_ov002_021bab58: scan kinds 5..10 via func_ov002_021b9dec, gated by a
 * per-kind u16 flag at row+kind*0x14+0x38; return kind on a value match. */
extern char data_ov002_022cf08c[];
extern int func_ov002_021b9dec(int player, int kind);

int func_ov002_021bab58(int arg0, int arg1) {
    char *row = data_ov002_022cf08c + (arg0 & 1) * 0x868;
    int i;
    char *cur = row + 5 * 0x14;
    for (i = 5; i <= 10; i++, cur += 0x14) {
        int r = func_ov002_021b9dec(arg0, i);
        if (r <= 0) continue;
        if (*(unsigned short *)(cur + 0x38) == 0) continue;
        if (r == arg1) return i;
    }
    return -1;
}
