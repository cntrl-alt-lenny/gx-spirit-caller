typedef struct { int a; int b; } Pair;
typedef struct Node Node;
struct Node { Pair key; int x8; int xc; int x10; Node *next; };
typedef struct { char pad[0x438]; Node *head; Node *tail; } Owner;
typedef struct { char pad[0x18]; int x18; } Src;
typedef struct Item Item;
struct Item { char pad[0xc]; Pair key; char more[0xc]; Item *next; };
typedef struct { int zero; int value; } Data;
extern int func_020453e8(int a);
extern int func_02058528(Owner **pp, Pair key, int a3, Src *src, int a5);
extern void func_020585d4(Owner **pp, int arg, int kind);
extern void func_0205bd58(Owner **pp, Item *item);
extern int func_0205ffc0(int *p, int b);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern int func_020602c4(char *line, char *key, char *out, int size);
extern int func_020603cc(char **ctx, char *line, int check);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
/* The thunk has four parameters, but this original call supplies only r0. */
extern int func_020ace00();
extern char data_02100d8c[], data_02100d94[], data_02100dc4[], data_02100dd0[];
int func_0205d7e4(Owner **pp, Item *item, char *line) {
    char buf[0x10];
    Pair key;
    int value;
    Data *data;
    int result;
    if (func_020603cc((char **)pp, line, 1) != 0) return 4;
    if (func_020ab054((unsigned char *)line, (unsigned char *)data_02100d8c, 5) != 0) {
        func_0205ffd4((int *)pp, 1, (int)data_02100d94);
        func_020585d4(pp, 3, 1);
        return 3;
    }
    if (func_020602c4(line, data_02100dc4, buf, 0x10) == 0) {
        func_0205ffd4((int *)pp, 1, (int)data_02100d94);
        func_020585d4(pp, 3, 1);
        return 3;
    }
    value = func_020ace00((int)buf);
    key = item->key;
    if (key.a != 0) {
        data = (Data *)func_020453e8(8);
        if (data == 0) {
            func_0205ffc0((int *)pp, (int)data_02100dd0);
            return 1;
        }
        data->value = value;
        data->zero = 0;
        result = func_02058528(pp, key, (int)data, (Src *)item, 0);
        if (result != 0) return result;
    }
    func_0205bd58(pp, item);
    return 0;
}
