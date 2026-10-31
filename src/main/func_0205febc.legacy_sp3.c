typedef struct { int a; int b; } Pair;
typedef struct Owner Owner;
typedef struct Item Item;
typedef struct { char pad[0x18]; int x18; } Src;
typedef struct { int pad[3]; Pair key; } Entry;
extern int func_020603cc(char **ctx, char *line, int check);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern void func_020585d4(void *a0, int a1, int a2);
extern int func_020453e8(int a);
extern int func_0205ffc0(int *p, int b);
extern int func_02058528(Owner **pp, Pair key, int a3, Src *src, int a5);
extern void func_0205bd58(Owner **pp, Item *item);
extern unsigned char data_021011ec[];
extern char data_021011f4[];
extern char data_02101224[];

int func_0205febc(Owner **ctx, Entry *entry, char *line) {
    Pair key;
    int *p;
    int result;
    if (func_020603cc((char **)ctx, line, 1) != 0) return 4;
    if (func_020ab054((unsigned char *)line, data_021011ec, 4) != 0) {
        func_0205ffd4((int *)ctx, 1, (int)data_021011f4);
        func_020585d4(ctx, 3, 1);
        return 3;
    }
    key = entry->key;
    if (key.a != 0) {
        p = (int *)func_020453e8(4);
        if (p == 0) {
            func_0205ffc0((int *)ctx, (int)data_02101224);
            return 1;
        }
        *p = 0;
        result = func_02058528(ctx, key, (int)p, (Src *)entry, 0);
        if (result != 0) return result;
    }
    func_0205bd58(ctx, (Item *)entry);
    return 0;
}
