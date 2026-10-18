typedef unsigned short u16;
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];
extern int func_ov002_021b9ecc(int a, int b);

struct Ov002D0650Entry {
    u16 val;
    u16 kind : 4;
    u16 _pad2 : 12;
    u16 _unused4;
    u16 next;
};

u16 func_ov002_021b3864(int arg0, int arg1, int arg2, int arg3) {
    int player = arg0 & 1;
    u16 v = *(u16 *)(data_ov002_022cf1a6 + player * 0x868 + arg1 * 20);
    if (v != 0) {
        do {
            struct Ov002D0650Entry *e = (struct Ov002D0650Entry *)(data_ov002_022d0650 + v * 8);
            u16 next = e->next;
            if (e->kind >= 6) {
                int val = e->val;
                int lo, hi;
                hi = (val >> 8) & 0xff;
                lo = val & 0xff;
                if (arg2 == func_ov002_021b9ecc(lo, hi)) {
                    char *p = data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 0x14;
                    u32 fl = *(u32 *)(p + 0x40);
                    u32 h = *(u16 *)(p + 0x38);
                    if ((h & ~((fl >> 6) & 1)) & ~(((fl >> 1) | (fl >> 2)) & 1)) {
                        if (arg3 == ((fl >> 5) & 1)) {
                            return val;
                        }
                    }
                }
            }
            v = next;
        } while (v != 0);
    }
    return 0xffff;
}
