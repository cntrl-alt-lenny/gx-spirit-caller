extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
typedef struct { unsigned a:13; unsigned flag:1; unsigned b:8; unsigned id:8; unsigned c:2; } Flags;
typedef struct { Flags flags; char pad[16]; } Entry;
typedef struct { char pad[0x30]; Entry entry[5]; char tail[0x7d4]; } Bank;
extern Bank data_ov002_022cf16c[];
extern struct State { char pad[0xcec]; int player; char gap[0x38]; unsigned counter; } data_ov002_022d016c;
int func_ov002_02263298(int arg1) {
    while (data_ov002_022d016c.counter < 10) {
        int id;
        unsigned slot = data_ov002_022d016c.counter % 5 + 5;
        id = data_ov002_022d016c.player ^ (data_ov002_022d016c.counter / 5);
        if (func_ov002_021baca8(id, slot, arg1)) {
            Flags *f = &data_ov002_022cf16c[id & 1].entry[slot].flags;
            unsigned packed = ((unsigned)(id << 31) & 0x80000000) | 0xa200000 | ((slot << 16) & 0x1f0000) | (unsigned short)arg1;
            if (func_ov002_021e30b4(packed, (unsigned short)(f->id * 2 + f->flag), 0)) {
                data_ov002_022d016c.counter++;
                return 0;
            }
        }
        data_ov002_022d016c.counter++;
    }
    return 1;
}


