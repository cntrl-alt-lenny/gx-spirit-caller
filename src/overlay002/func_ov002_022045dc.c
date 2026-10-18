typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 bit0 : 1;
    u16 idx : 5;
    u16 kind : 6;
    u16 pad : 4;
    int pad1[4];
    void *ptr;
} Obj;

typedef struct {
    int pad[12];
    u32 id : 13;
    u32 b13 : 1;
    u32 flag : 1;
    u32 rest : 17;
    int pad2[2];
} Entry;

typedef struct {
    int side;
    int pad[6];
    int idx;
} St;

extern St data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];
extern int func_0203058c(int id);
extern int func_0202e2f8(int id);

int func_ov002_022045dc(Obj *self) {
    u32 id;

    if (self->kind != 18) {
        return 0;
    }
    if (self->ptr == 0) {
        return 0;
    }
    if (data_ov002_022cd3f4.side != 1 - self->bit0) {
        return 0;
    }
    id = ((Entry *)(data_ov002_022cf16c + (data_ov002_022cd3f4.side & 1) * 0x868 + data_ov002_022cd3f4.idx * 0x14))->id;
    if (id == 0) {
        return 0;
    }
    if (func_0203058c(id) == 0 && func_0202e2f8(id) == 0) {
        if (((Entry *)(data_ov002_022cf16c + (data_ov002_022cd3f4.side & 1) * 0x868 + data_ov002_022cd3f4.idx * 0x14))->flag) {
            return 1;
        }
    }
    return 0;
}
