typedef struct {
    unsigned int pad2 : 13;
    unsigned int lo : 1;
    unsigned int pad1 : 8;
    unsigned int hi : 8;
    unsigned int pad0 : 2;
} Entry;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

int func_ov002_021b99b4(int player, int id)
{
    unsigned int i;
    int base = (player & 1) * 0x868;
    unsigned int cnt = *(unsigned int *)(data_ov002_022cf180 + base);
    i = 0;
    if (i < cnt) {
        char *b = data_ov002_022cf16c + base;
        Entry *p = (Entry *)(b + 0x418);
        do {
            if (id == p->hi * 2 + p->lo) {
                return i;
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(b + 0x14));
    }
    return -1;
}
