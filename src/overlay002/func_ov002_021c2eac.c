extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_ov002_021b91f8(void *a, int b);

int func_ov002_021c2eac(int player, int id) {
    int off = (player & 1) * 0x868;
    unsigned int i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf180 + off)) {
        char *p;
        char *base = data_ov002_022cf16c + off;
        p = base + 0x418;
        do {
            if (func_ov002_021b91f8(p, id) != 0)
                return i + 1;
            i++;
            p += 4;
        } while (i < *(unsigned int *)(base + 0x14));
    }
    return 0;
}
