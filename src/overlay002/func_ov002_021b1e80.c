typedef unsigned short u16;
struct Entry0650 {
    u16 f_0;
    u16 kind : 4;
    u16 sub : 4;
    u16 : 8;
    u16 f_4;
    u16 next;
};
extern char data_ov002_022cf16c[];
extern struct Entry0650 data_ov002_022d0650[];
extern void func_ov002_021b1d84(int index);

void func_ov002_021b1e80(int a0, int a1) {
    int i, j;
    unsigned int key;
    unsigned int index, next;
    char *p;
    struct Entry0650 *e;
    i = 0;
    key = (unsigned char)a0 | ((unsigned char)a1 << 8);
    do {
        p = data_ov002_022cf16c + (i & 1) * 0x868;
        for (j = 0; j <= 11; j++, p += 0x14) {
            index = *(u16 *)(p + 0x3a);
            while (index != 0) {
                e = &data_ov002_022d0650[index];
                next = e->next;
                if (e->kind >= 6 && e->f_0 == (u16)key)
                    func_ov002_021b1d84(index);
                index = next;
            }
        }
        i++;
    } while (i < 2);
}





