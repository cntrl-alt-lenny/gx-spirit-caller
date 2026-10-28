typedef struct { int a, b; } Pair;
typedef struct { char pad[0x100]; int enabled; } Owner;
typedef struct { char pad[0x18]; int x18; } Src;
typedef struct {
    char *s0, *s4, *s8, *sc, *s10, *s14;
    int f18; char s1c[0xb]; char s27[3]; int f2c, f30;
    char s34[0x80]; int fb4, fb8, fbc, fc0, fc4; char *sc8;
    int fcc, fd0, fd4, fd8, fdc, fe0, fe4, fe8, fec;
} CopySrc;
typedef struct {
    int f0, f4;
    char s8[0x1f], s27[0x15], s3c[0x33], s6f[0x1f], s8e[0x1f], sad[0x4c];
    int ffc; char s100[0xb], s10b[3]; int f110, f114;
    char s118[0x80]; int f198, f19c, f1a0, f1a4, f1a8;
    char s1ac[0x33]; int f1e0, f1e4, f1e8, f1ec, f1f0, f1f4, f1f8, f1fc, f200;
} Dst;
typedef struct Item Item;
struct Item { char pad[0x18]; int id; int status; Item *next; };
typedef struct { char pad[0xc]; CopySrc *src; } Found;
extern int func_020453e8(int a);
extern int func_020560a8(Owner **pp, int wait);
extern int func_02058528(Owner **pp, Pair key, int a3, Src *src, int a5);
extern int func_0205a0ec(void *self, int arg1, int arg2);
extern void func_0205b7a8(CopySrc *src, Dst *dst);
extern void func_0205bd58(Owner **pp, Item *item);
extern int func_0205be60(void *obj, int a1, int a2, void **out, int a4, int a5, int a6);
extern int func_0205d6bc(void **pp, int val, int *out);
extern int func_0205ffc0(int *p, int b);
extern char data_02100780[];
int func_02059f38(Owner **pp, int value, int mode, int wait, int a, int b) {
    Owner *o = *pp;
    Found *found;
    Item *item = 0;
    Pair key;
    Dst *copy;
    int enabled = mode == 1;
    int result;
    int id;
    if (o->enabled == 0) enabled = 0;
    if (a != 0 && enabled != 0 && func_0205d6bc((void **)pp, value, (int *)&found) != 0 && found->src != 0) {
        copy = (Dst *)func_020453e8(0x204);
        if (copy == 0) {
            func_0205ffc0((int *)pp, (int)data_02100780);
            return 1;
        }
        func_0205b7a8(found->src, copy);
        copy->f0 = 0;
        copy->f4 = value;
        key.a = a;
        key.b = b;
        result = func_0205be60(pp, 2, 0, (void **)&item, 1, a, b);
        if (result != 0) return result;
        id = item->id;
        result = func_02058528(pp, key, (int)copy, (Src *)item, 0);
        if (result != 0) return result;
        func_0205bd58(pp, item);
    } else {
        result = func_0205be60(pp, 2, 0, (void **)&item, wait, a, b);
        if (result != 0) return result;
        id = item->id;
        result = func_0205a0ec(pp, value, id);
        if (result != 0) return result;
    }
    if (wait != 0) {
        result = func_020560a8(pp, id);
        if (result != 0) return result;
    }
    return 0;
}

