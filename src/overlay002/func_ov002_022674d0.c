typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int pad : 8;
    unsigned int hi : 8;
    unsigned int pad2 : 2;
    unsigned int rest[4];
} Entry;
typedef struct {
    char pad[0x30];
    Entry entries[5];
} Row;
extern char data_ov002_022cf16c[];
typedef struct { char pad[0xd28]; unsigned int cursor; } State;
extern State data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021b4054(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021b9ecc(int a0, int a1);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_022674d0(int a) {
    unsigned int i;
    i = data_ov002_022d016c.cursor;
    while (i <= 4) {
        if (func_ov002_021baca8(a, i, 0x13b2) != 0 &&
            func_ov002_021b4054(a, i, 0x13b2, 2) != 0) {
            Entry *e = &((Row *)(data_ov002_022cf16c + (a & 1) * 0x868))->entries[i];
            func_ov002_021df62c(a, i, e->hi * 2 + e->lo);
            func_ov002_021d59cc(a, i, (unsigned short)func_ov002_021b9ecc(a, i), 3, 1);
            ++data_ov002_022d016c.cursor;
            return 0;
        }
        i = ++data_ov002_022d016c.cursor;
    }
    return 1;
}

