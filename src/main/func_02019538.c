extern char *GetSystemWork(void);
extern int func_02019210(int id);

void func_02019538(int id, int slot, int delta) {
    char *sw = GetSystemWork();
    int idx = func_02019210(id) - 1;
    unsigned char *p = (unsigned char *)(sw + idx * 0x18 + 0x14);
    int v = p[slot] + delta;

    if (v > 255) {
        p[slot] = 255;
    } else if (v < 0) {
        p[slot] = 0;
    } else {
        p[slot] = v;
    }
}
