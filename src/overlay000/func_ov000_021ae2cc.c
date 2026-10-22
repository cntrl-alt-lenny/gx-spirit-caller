typedef struct { int x, y, z; } Vec;
typedef struct { char pad[0x20]; unsigned int low:12; unsigned int mode:2; unsigned int high:18; } Object;
typedef struct { unsigned int low:21; unsigned int index:2; unsigned int high:9; } Flags;
typedef struct { char pad[0x2a4]; Flags flags; } State;
typedef struct { short x, y, c, d; } Entry;
typedef struct { Entry header; Entry entries[4]; } Table;
extern State data_ov000_021c758c;
extern Table data_ov000_021b56b4[];
extern char data_ov000_021c7660[];
extern Object data_ov000_021c763c[];
extern char *func_ov000_021adf18(char *str, int n, char *out);
extern int func_ov000_021add24(int a0, int a1, int a2);
extern void func_ov000_021b33d8_unk(Object *, char *, int);
extern void func_ov000_021b33f8_unk(Object *, Vec);
extern void func_ov000_021b3474_unk(Object *);
void func_ov000_021ae2cc(int n) {
    char text[64];
    Vec pos;
    Entry *entries = data_ov000_021b56b4[data_ov000_021c758c.flags.index].entries;
    unsigned int obj = (unsigned int)data_ov000_021c763c;
    func_ov000_021adf18(data_ov000_021c7660, n - 1, text);
    func_ov000_021b33d8_unk((Object *)obj, text, 12);
    pos.x = (func_ov000_021add24((int)text, 12, 256) - 1) << 12;
    pos.y = entries[n - 1].y << 12;
    pos.z = 0;
    func_ov000_021b33f8_unk((Object *)obj, pos);
    func_ov000_021b3474_unk((Object *)obj);
    ((Object *)obj)->mode = 1;
}



