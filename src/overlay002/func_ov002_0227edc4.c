typedef unsigned int u32;

typedef struct {
    u32 lo : 13;
    u32 bit : 1;
    u32 rest : 18;
} Entry;

extern struct { char _pad0[12]; u32 count; } data_ov002_022cdc78;
extern Entry data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int idx);

int func_ov002_0227edc4(u32 bit, u32 lo)
{
    u32 i;
    for (i = 0; i < data_ov002_022cdc78.count; i++) {
        if (func_ov002_0227e76c(i) == 0 && lo == data_ov002_022cdc88[i].lo && bit == data_ov002_022cdc88[i].bit) {
            return i;
        }
    }
    return -1;
}
