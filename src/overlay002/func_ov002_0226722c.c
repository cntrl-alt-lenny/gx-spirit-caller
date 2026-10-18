typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int pad : 7;
    unsigned int skip : 1;
    unsigned int hi : 8;
    unsigned int pad2 : 2;
} Ent;

typedef struct {
    char pad[0x14];
    unsigned int cnt;
    Ent ent[1];
} Row;

extern char data_ov002_022cf180[];
extern char data_ov002_022cf16c[];

extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021e30b4(unsigned int a, unsigned int b, int c);

int func_ov002_0226722c(unsigned int a, int b) {
    unsigned int i;
    Ent *e;
    unsigned int key;
    Row *row;
    int off;
    if (func_ov002_021b3ecc(a, 0xb, b) == 0) {
        off = (a & 1) * 0x868;
        i = 0;
        if (*(unsigned int *)(data_ov002_022cf180 + off) > i) {
            row = (Row *)(data_ov002_022cf16c + off);
            e = (Ent *)((char *)row + 0x18 + 0x400);
            key = ((a << 31) & 0x80000000) | 0x4e0000 | 0x4000000;
            a = i;
            do {
                if (e->id == b && e->skip == 0) {
                    if (func_ov002_021e30b4(key | (unsigned short)e->id, (unsigned short)(e->hi * 2 + e->lo), a) != 0) {
                        return 0;
                    }
                }
                i++;
                e++;
            } while (i < row->cnt);
        }
    }
    return 1;
}
