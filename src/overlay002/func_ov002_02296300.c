typedef unsigned short u16;

struct Obj6300 {
    u16 f0;
    u16 player : 1;
    u16 _pad : 15;
};

struct Data16c {
    char pad[0xcf8];
    int mode;
};

extern struct Data16c data_ov002_022d016c;

extern int func_ov002_02257ab8(struct Obj6300 *obj, int p);
extern int func_ov002_02281760(struct Obj6300 *obj, int p, int arg);
extern int func_ov002_02259f74(int player);
extern int func_ov002_02280980(int player);
extern int func_ov002_02285dd0(int player, int arg);

int func_ov002_02296300(struct Obj6300 *obj)
{
    if (!func_ov002_02257ab8(obj, 1 - obj->player)) {
        return 0;
    }
    if (data_ov002_022d016c.mode == 4) {
        return 1;
    }
    if (func_ov002_02281760(obj, 1 - obj->player, 0)) {
        return 1;
    }
    if (!func_ov002_02259f74(obj->player)) {
        return 1;
    }
    if (func_ov002_02280980(obj->player) < 0) {
        return 1;
    }
    return func_ov002_02285dd0(obj->player, 0) == 0;
}
