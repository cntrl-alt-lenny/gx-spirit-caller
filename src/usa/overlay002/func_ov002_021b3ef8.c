typedef unsigned short u16;

extern char data_ov002_022cf0c6[];
extern char data_ov002_022d0570[];

struct Ov002D0650Entry {
    u16 key0;
    u16 tag : 4;
    u16 _pad2 : 12;
    u16 key1;
    u16 next;
};

int func_ov002_021b3ef8(int arg0, int arg1, int arg2, int arg3) {
    int player = arg0 & 1;
    u16 v = *(u16 *)(data_ov002_022cf0c6 + player * 0x868 + arg1 * 20);
    if (v == 0) {
        goto not_found;
    }
    do {
        struct Ov002D0650Entry *e = (struct Ov002D0650Entry *)(data_ov002_022d0570 + v * 8);
        u16 tag = e->tag;
        u16 next = e->next;
        if (tag < 6) {
            if (e->key0 == arg2 && e->key1 == arg3) {
                return 1;
            }
        }
        v = next;
    } while (v != 0);
not_found:
    return 0;
}
