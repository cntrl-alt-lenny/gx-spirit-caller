typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef int s32;

typedef struct {
    u32 pad0[2];
    s32 index;
    u32 count;
    u8 pad10[0x400];
    u16 vals[1];
} Data022cdc78;

extern Data022cdc78 data_ov002_022cdc78;

void func_ov002_021afffc(s32 id)
{
    u32 i;
    for (i = 0; i < data_ov002_022cdc78.count; i++) {
        if (id == (data_ov002_022cdc78.vals[i] >> 8)) {
            data_ov002_022cdc78.index = i;
            return;
        }
    }
    data_ov002_022cdc78.index = -1;
}
