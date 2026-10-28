typedef unsigned int u32;
typedef struct { u32 low:13; u32 side:1; u32 middle:8; u32 index:8; u32 high:2; } Entry;
typedef struct { char pad[0xd50]; int status; char pad2[0x14]; int phase; } State;
extern State data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern void func_ov002_02259ee8(int arg0, int arg1, int arg2, int arg3);

void func_ov002_02258500(int unused, int player, int arg)
{
    Entry *a, *b, *c;
    switch (data_ov002_022d016c.phase) {
    case 0:
        func_ov002_021ae400(player, 0x114);
        data_ov002_022d016c.phase++;
        break;
    case 1:
        func_ov002_021af9d0(player, 6, 0xfffe, arg);
        data_ov002_022d016c.phase++;
        break;
    case 2:
        a = (Entry *)func_ov002_021afb74();
        b = (Entry *)func_ov002_021afb74();
        c = (Entry *)func_ov002_021afb74();
        func_ov002_02259ee8(player, arg, a->low, c->index * 2 + b->side);
        data_ov002_022d016c.status = 0;
        break;
    }
}
