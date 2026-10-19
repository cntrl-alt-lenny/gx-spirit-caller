typedef struct { char _pad_8[8]; int f_8; char _pad_10[4]; int f_10, f_14, f_18; } state_4zero_t;
typedef struct Item Item;
struct Item { char _pad0[0x20]; Item *next; };
typedef struct { char **lists; int count; } Set;
typedef struct { char _pad0[0x428]; Set *set; } Owner;
extern int func_020453b4();
extern int func_020566d8(int unused, state_4zero_t *p);
extern void func_0205bd58(Owner **pp, Item *item);
extern int func_0205d560(Owner **pp, void (*fn)(int a, int b, int c), int arg);
#define I(o) (*(int *)(p + (o)))
#define B(o) (*(unsigned char *)(p + (o)))
int func_02056594(Owner **pp) {
    char *p = (char *)*pp;
    int zero;
    int minus;
    B(0x110) = 0; B(0x12f) = 0; B(0x144) = 0;
    I(0x1d4) = -1;
    I(0x1d8) = 0; I(0x1e4) = 0; I(0x1e8) = 0; I(0x1e0) = 0;
    func_020453b4(I(0x1dc));
    I(0x1dc) = 0; I(0x1dc) = 0; I(0x1f0) = 0;
    func_020453b4(I(0x1ec));
    I(0x1ec) = 0; I(0x1ec) = 0;
    I(0x1fc) = 0; I(0x200) = 0; I(0x1f8) = 0;
    func_020453b4(I(0x1f4));
    I(0x1f4) = 0; I(0x1f4) = 0;
    I(0x448) = 0; I(0x44c) = 0; I(0x444) = 0;
    func_020453b4(I(0x440));
    I(0x440) = 0; I(0x440) = 0;
    I(0x458) = 0; I(0x45c) = 0; I(0x454) = 0;
    func_020453b4(I(0x450));
    I(0x450) = 0; I(0x450) = 0;
    I(0x204) = -1; I(0x20c) = 2;
    while (I(0x424) != 0) func_0205bd58(pp, (Item *)I(0x424));
    I(0x424) = 0; I(0x430) = 0;
    func_0205d560(pp, (void (*)(int, int, int))func_020566d8, 0);
    zero = 0;
    I(0x19c) = zero; I(0x1a0) = zero; I(0x198) = zero;
    I(0x210) = zero; I(0x41c) = zero; I(0x434) = zero;
    minus = -1; I(0x214) = minus; B(0x218) = zero; B(0x318) = zero;
    return zero;
}



