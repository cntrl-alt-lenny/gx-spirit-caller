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
typedef union {
    unsigned int words[6];
    struct {
    unsigned short id;
    unsigned short side : 1;
    unsigned short type : 5;
    unsigned short value : 6;
    unsigned short kind : 2;
    unsigned short pad : 2;
    unsigned short pad2 : 6;
    unsigned short slot : 9;
    unsigned short pad3 : 1;
    unsigned short unused;
    unsigned int rest[4];
    } f;
} Request;
extern char data_ov002_022cf180[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021feb08(Request *req);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02267338(unsigned int a) {
    unsigned int i;
    Ent *e;
    unsigned int key;
    Row *row;
    int off;
    off = (a & 1) * 0x868;
    i = 0;
    if (*(unsigned int *)(data_ov002_022cf180 + off) > i) {
        row = (Row *)(data_ov002_022cf16c + off);
        e = (Ent *)((char *)row + 0x418);
        key = ((a << 31) & 0x80000000) | 0x4e0000 | 0x4000000;
        do {
            if (e->id == 0x1775 && e->skip == 0) {
                Request req = {0};
                req.f.id = 0x1775;
                req.f.side = (unsigned short)a;
                req.f.kind = 2;
                req.f.type = 14;
                req.f.value = 2;
                req.f.slot = (unsigned short)(e->hi * 2 + e->lo);
                if (func_ov002_021feb08(&req) == 0) {
                    if (func_ov002_021e30b4(key | (unsigned short)e->id, (unsigned short)(e->hi * 2 + e->lo), 0) != 0)
                        return 0;
                }
            }
            i++;
            e++;
        } while (i < row->cnt);
    }
    return 1;
}

