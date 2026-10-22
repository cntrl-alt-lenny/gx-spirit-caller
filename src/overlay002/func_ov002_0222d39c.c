typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
    u16 w0;
    u16 bit0 : 1;
    u16 pad1 : 13;
    u16 bit14 : 1;
    u16 pad15 : 1;
    char pad4[16];
    u32 key : 9;
    u32 rest : 23;
} S021ff3bc;
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
extern char data_ov002_022cf16c[];
/* Original caller supplies only r0 to the two-argument definition. */
extern int func_ov002_021ff3bc();
extern int func_ov002_021b947c(u32 key);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_0222d39c(S021ff3bc *p) {
    u32 result;
    int player, high;
    u16 upper, low;
    u8 kind;
    if (func_ov002_021ff3bc(p) == 0) return 0;
    result = func_ov002_021b947c(p->key);
    low = result;
    upper = result >> 16;
    kind = low >> 8;
    player = (u8)result;
    high = upper;
    if (kind == 14) {
        if (func_ov002_021c33e4(p->bit0, player, high) != 0) {
            func_ov002_0227ac64(p->bit0, (struct Record *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x418) + high, 1, 1, 0);
        }
    }
    return 0;
}



