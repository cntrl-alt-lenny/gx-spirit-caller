typedef struct { unsigned short flags, kind, id, count; unsigned char pad[0x804]; int active; int state; } State;
typedef struct { unsigned short player:1, kind:4, id:9, type:2; } Record;
typedef struct { unsigned char pad[0x494]; volatile int index; } History;
extern State data_ov002_022ce950;
extern char data_ov002_022cf180[];
extern char data_ov002_022cf188[];
typedef struct { unsigned short id:13, type:2, rest:1; unsigned short extra; } Card;
extern Card data_ov002_022d0250[];
extern History data_ov002_022ce288;
extern unsigned short data_ov002_022ce720[];
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021b9a30(unsigned int a, unsigned int b);
extern int func_ov002_021b9aa8(unsigned int a, unsigned int b);
extern void func_ov002_021c2c54(int player, unsigned short id);
extern void func_ov002_021c2d34(int player, unsigned short id);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021cdb64(void) {
    int f = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int t = data_ov002_022ce950.kind;
    int v = data_ov002_022ce950.id;
    int u = data_ov002_022ce950.count;
    Record rec;
    int a;
    switch (data_ov002_022ce950.state) {
    case 0:
        if (t == 14) {
            if (func_ov002_021b99b4(f, v) != *(int *)(data_ov002_022cf180 + (f & 1) * 0x868) - 1) {
                func_ov002_021c2c54(f, (unsigned short)v);
                func_ov002_0229ade0(0x16, f, t, v);
            }
        }
        if (t == 15) {
            if (func_ov002_021b9a30(f, v) != *(int *)(data_ov002_022cf188 + (f & 1) * 0x868) - 1) {
                func_ov002_021c2d34(f, (unsigned short)v);
                func_ov002_0229ade0(0x16, f, t, v);
            }
        }
        data_ov002_022ce950.state++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x16) != 0) return;
        if (u >= 6) {
            rec.player = (unsigned short)f;
            rec.kind = (unsigned short)t;
            rec.id = (unsigned short)v;
            rec.type = data_ov002_022d0250[rec.id].type;
            data_ov002_022ce720[data_ov002_022ce288.index] = *(unsigned short *)&rec;
            data_ov002_022ce288.index = (data_ov002_022ce288.index + 1) & 0x7f;
        }
        if (t != 11) a = 0;
        else a = func_ov002_021b9aa8(f, v);
        func_ov002_0229ade0(0x17, f, (unsigned short)((unsigned char)t | ((unsigned char)a << 8)), t == 13 ? 1 : 0);
        data_ov002_022ce950.state++;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x17) == 0) data_ov002_022ce950.active = 0;
        break;
    }
}


