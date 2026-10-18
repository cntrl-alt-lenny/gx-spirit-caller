typedef unsigned short u16;
typedef int s32;
typedef short s16;

typedef struct {
    u16 id;
    u16 b : 1;
    u16 rest : 15;
} Unit;

typedef struct {
    char pad[0x5a8];
    s32 state;
} State;

typedef struct {
    char pad[0xb0];
    u16 val;
} Data;

extern State data_ov002_022ce288;
extern Data data_ov002_022d0e6c;
extern s32 func_ov002_021bbf50(s32 a);
extern int func_ov002_021de4b0(Unit *u, s32 a, s32 b);
extern void func_ov002_021e96a0();
extern s32 func_ov002_02257878();
extern void func_ov002_0226b034(s32 a, s32 b, s32 c);

s32 func_ov002_022274d8(Unit *u)
{
    s32 a = func_ov002_021bbf50(1 - u->b);
    if (a <= func_ov002_021bbf50(u->b)) {
        return 0;
    }
    switch (data_ov002_022ce288.state) {
    case 0x80:
        return 0x7f;
    case 0x7f:
        if (func_ov002_02257878(u, func_ov002_021e96a0) == 0) {
            return 0;
        }
        func_ov002_0226b034(1 - u->b, u->id, 0);
        return 0x7e;
    case 0x7e: {
        s32 v = data_ov002_022d0e6c.val;
        func_ov002_021de4b0(u, v & 0xff, (v >> 8) & 0xff);
        return 0x7f;
    }
    default:
        return 0;
    }
}
