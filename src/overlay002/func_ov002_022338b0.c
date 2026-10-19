typedef unsigned short u16;
struct Node0223def4;
struct Self02257cfc;
typedef struct {
    u16 f0;
    u16 player : 1;
    u16 rest2 : 15;
    u16 f4;
    u16 low6 : 8;
    u16 high6 : 8;
} Arg;
typedef struct { u16 id : 13; u16 rest : 3; u16 other; } Entry;
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern Entry data_ov002_022d0250[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_02257cfc(struct Self02257cfc *self, int arg1);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
int func_ov002_022338b0(Arg *self, int arg1)
{
    int id = func_ov002_0223def4((struct Node0223def4 *)self, 0);
    int index;
    int result;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (self->high6 != 0) {
            if (func_ov002_021b99b4(self->player, id) >= 0) {
                (data_ov002_022ce288.state)++;
                return 1;
            }
        }
        return 0;
    case 1:
        self->f0 = data_ov002_022d0250[id].id;
        result = func_ov002_02257cfc((struct Self02257cfc *)self, arg1);
        self->f0 = 0x1935;
        if (result != 0) return result;
        (data_ov002_022ce288.state)++;
        return 1;
    case 2:
        index = func_ov002_021b99b4(self->player, id);
        if (index >= 0) {
            func_ov002_021d8128(self->player, data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x418 + index * 4, 0);
        }
        data_ov002_022ce288.state = 0;
        return 0;
    default:
        return 0;
    }
}

