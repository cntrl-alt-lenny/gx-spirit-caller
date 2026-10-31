typedef struct { int a; int b; } Pair;
typedef struct Node Node;
struct Node { Pair key; int x8; int xc; int x10; Node *next; };
typedef struct { char pad0[0x1a4]; Pair key; char pad1[0x26c]; int x418; int x41c; char pad2[0x18]; Node *head; Node *tail; } Owner;
typedef struct { char pad[0x18]; int x18; } Src;
typedef struct { int arg; int x4; Owner *owner; int kind; } Data;
extern int func_020453e8(int a);
extern int func_02058528(Owner **pp, Pair key, int a3, Src *src, int a5);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_021002b4[], data_02100280[], data_021002c8[], data_021002e0[];
void func_020585d4(Owner **pp, int arg, int kind) {
    Owner *o = *pp;
    Pair key;
    Data *data;
    if (o == 0) func_020a6d54((int)data_021002b4, (int)data_02100280, 0, 0x23);
    if (arg == 0) func_020a6d54((int)data_021002c8, (int)data_02100280, 0, 0x24);
    if (kind != 1 && kind != 0) func_020a6d54((int)data_021002e0, (int)data_02100280, 0, 0x25);
    if (kind == 1) o->x41c = 1;
    key = o->key;
    if (key.a == 0) return;
    data = (Data *)func_020453e8(0x10);
    if (data != 0) {
        data->arg = arg;
        data->kind = kind;
        data->x4 = o->x418;
        data->owner = o;
    }
    func_02058528(pp, key, (int)data, 0, 1);
}
