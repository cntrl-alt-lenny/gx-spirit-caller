typedef struct { char pad0[0x108]; int busy; char pad1[0x324]; int count; } State;
typedef struct { int unk0; int value; char *first; char *second; int a; int b; } Info;
typedef struct { int id; int unk4; Info *info; } Item;
typedef struct { int id; int value; char first[0x100]; char second[0x100]; int a; int b; } Output;
extern int func_0205d504(int a0, int a1);
extern int func_0205ffc0(int *p, int b);
extern void func_020604b0(char *dst, char *src, int n);
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_020a73d4(int x, int unused1, int unused2);
extern char data_020ffcd0[], data_020ffce0[], data_020ffcf0[], data_020ffcfc[];
int func_020557b8(int *self, int index, Output *out) {
    State *state;
    Item *item;
    Info *info;
    int count;
    if (self == 0 || (state = (State *)*self) == 0) return 2;
    if (state->busy != 0) {
        func_020a73d4((int)out, 0, 0x210);
        return 0;
    }
    if (out == 0) {
        func_0205ffc0(self, (int)data_020ffcd0);
        return 2;
    }
    count = state->count;
    if (index < 0 || index >= count) {
        func_0205ffc0(self, (int)data_020ffce0);
        return 2;
    }
    item = (Item *)func_0205d504((int)self, index);
    if (item == 0) {
        func_0205ffc0(self, (int)data_020ffce0);
        return 2;
    }
    info = item->info;
    if (info == 0) func_020a6d54((int)data_020ffcf0, (int)data_020ffcfc, 0, 0x5cf);
    out->id = item->id;
    out->value = info->value;
    if (info->first == 0) *info->first = 0;
    else func_020604b0(out->first, info->first, 0x100);
    if (info->second == 0) *info->second = 0;
    else func_020604b0(out->second, info->second, 0x100);
    out->a = info->a;
    out->b = info->b;
    return 0;
}

