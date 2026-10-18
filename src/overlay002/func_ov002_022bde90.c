typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 key;
    u16 pad[17];
} Rec;

extern Rec data_020c8e84[];
extern u32 data_020c8e80;
extern void Fill32(u32 v, void *dst, u32 n);
extern u16 func_0202bcb0(int a);
extern int func_020059b0(void *key, void *table, u32 count, u32 stride, void *cmp);
extern int func_ov002_022bdf20(void);

Rec *func_ov002_022bde90(int a)
{
    Rec *tbl = data_020c8e84;
    int idx;
    Rec buf;

    Fill32(0, &buf, 0x24);
    buf.key = func_0202bcb0(a);
    idx = func_020059b0(&buf, tbl, (u16)data_020c8e80, 0x24, func_ov002_022bdf20);
    if (idx >= 0 && (u32)idx < data_020c8e80) {
        return &tbl[idx];
    }
    return 0;
}
