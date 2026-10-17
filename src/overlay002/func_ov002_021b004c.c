typedef unsigned int u32;
typedef unsigned short u16;

typedef struct {
    u32 pad0[3];
    u32 count;
    u16 ids[1];
} Tbl;

extern Tbl data_ov002_022cdc78;
extern u32 data_ov002_022cdc88[];

u32 *func_ov002_021b004c(int id)
{
    Tbl *t = &data_ov002_022cdc78;
    u32 i;
    for (i = 0; i < t->count; i++) {
        if (id == (((u16 *)((char *)t + 0x410))[i] >> 8)) {
            return &data_ov002_022cdc88[i];
        }
    }
    return &data_ov002_022cdc88[i];
}
