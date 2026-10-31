typedef struct { int a,b; } Pair;
typedef struct Node Node;
struct Node { int kind; int p4,p8,key; char pad[0x2c]; Node *next; };
typedef struct { char pad[0x100]; int active; char pad104[0x330]; Node *head; } Owner;
typedef struct { int a,b,c; Pair callback; int x14,x18; int status; } Item;
extern int func_02058a08(Owner **pp, Item *item, char *line);
extern int func_0205d7e4(Owner **pp, Item *item, char *line);
extern int func_0205af90(Owner **pp, Item *item, char *line);
extern int func_0205febc(Owner **pp, Item *item, char *line);
extern void func_020604a4(int a, ...);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_02100a8c[], data_02100ad4[], data_02100ad8[];
int func_0205bc24(Owner **pp, Item *item, char *line)
{
    int result = 0;
    switch (item->a) {
    case 0: result = func_02058a08(pp, item, line); break;
    case 1: result = func_0205d7e4(pp, item, line); break;
    case 2: result = func_0205af90(pp, item, line); break;
    case 4: result = func_0205febc(pp, item, line); break;
    default:
        func_020604a4((int)pp, data_02100a8c, item->a);
        func_020a6d54((int)data_02100ad4, (int)data_02100ad8, 0, 0x146);
        break;
    }
    if (result != 0) item->status = result;
    return result;
}
