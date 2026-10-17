typedef unsigned int u32;
typedef int s32;

typedef struct {
    s32 unk0;
    u32 unk4;
} Data;

extern Data data_02104f4c;
extern Data data_ov002_022cd73c;

s32 func_ov002_022a6fec(s32 a, s32 b, s32 c)
{
    s32 v;
    if (((data_02104f4c.unk4 << 27) >> 30) & 1) {
        c += 0x18;
    }
    v = (c - 0x46) / 28;
    if (v <= 0) {
        v = 0;
    }
    if (v > 4) {
        v = 4;
    }
    if (b == (data_ov002_022cd73c.unk4 ^ 1)) {
        return 9 - v;
    }
    return v + 5;
}
