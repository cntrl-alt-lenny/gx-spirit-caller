struct Slot {
    unsigned short id : 13;
    unsigned short rest : 3;
    unsigned short other;
};

extern struct Slot data_ov002_022d0250[];
extern int func_0202e234(int x);

struct Hdr {
    unsigned short pad : 6;
    unsigned short kind : 6;
    unsigned short rest : 4;
};

struct Word {
    unsigned int idx : 9;
    unsigned int pad : 10;
    unsigned int type : 4;
    unsigned int rest : 9;
};

struct Obj {
    unsigned short pad0;
    struct Hdr hdr;
    unsigned char pad4[0x10];
    struct Word w;
};

int func_ov002_02207a70(struct Obj *obj, int unused1) {
    if (obj->hdr.kind == 0x16) {
        if (obj->w.type != 0xe) {
            return 0;
        }
        return func_0202e234(data_ov002_022d0250[obj->w.idx].id) != 0;
    }
    return 0;
}
