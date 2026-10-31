extern int func_0205d504(int a0, int a1);
extern int func_0205ffc0(int *p, int b);
extern void func_020604b0(char *dst, char *src, int n);
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_020a73d4(int x, int unused1, int unused2);
extern char data_020ffcd0[], data_020ffce0[], data_020ffcf0[], data_020ffcfc[];

typedef struct {
    char pad0[0x108];
    int active;
    char pad1[0x324];
    int count;
} Object;
typedef struct {
    int unused;
    int value;
    char *name;
    char *description;
    int x;
    int y;
} Info;
typedef struct {
    int id;
    int unused;
    Info *info;
} Item;
typedef struct {
    int id;
    int value;
    char name[0x100];
    char description[0x100];
    int x;
    int y;
} Output;

int func_020557b8(Object **self, int index, Output *out) {
    Object *obj;
    Item *item;
    Info *info;
    char *s;
    int count;
    if (self == 0 || (obj = *self) == 0) return 2;
    if (obj->active != 0) {
        func_020a73d4((int)out, 0, 0x210);
        return 0;
    }
    if (out == 0) {
        func_0205ffc0((int *)self, (int)data_020ffcd0);
        return 2;
    }
    count = obj->count;
    if (index < 0 || index >= count) {
        func_0205ffc0((int *)self, (int)data_020ffce0);
        return 2;
    }
    item = (Item *)func_0205d504((int)self, index);
    if (item == 0) {
        func_0205ffc0((int *)self, (int)data_020ffce0);
        return 2;
    }
    info = item->info;
    if (info == 0) {
        func_020a6d54((int)data_020ffcf0, (int)data_020ffcfc, 0, 0x5cf);
    }
    out->id = item->id;
    out->value = info->value;
    s = info->name;
    if (s == 0) *s = 0;
    else func_020604b0(out->name, s, 0x100);
    s = info->description;
    if (s == 0) *s = 0;
    else func_020604b0(out->description, s, 0x100);
    out->x = info->x;
    out->y = info->y;
    return 0;
}
