typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad;
    u16 b0 : 1;
    u16 b1 : 5;
    u16 rest : 10;
} Arg;

typedef struct {
    char pad[0x5a8];
    u32 mode;
} Data;

extern Data data_ov002_022ce288;
extern void func_ov002_021d6c98(Arg *a, u32 b, u32 c);
extern void func_ov002_021d8840(u32 a, u32 b);

u32 func_ov002_02223d78(Arg *a)
{
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        func_ov002_021d6c98(a, a->b0, a->b1);
        return 0x7f;
    case 0x7f:
        func_ov002_021d8840(a->b0, 0x1f);
        return 0;
    }
    return 0;
}
