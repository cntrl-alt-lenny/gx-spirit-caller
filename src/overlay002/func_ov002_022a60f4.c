typedef unsigned short u16;
typedef struct { u16 a:1, b:5, c:8, d:1, e:1; } Bits;
extern struct { int unk; int index; } data_ov002_022cd73c;
static inline u16 pack(u16 idx, u16 type, u16 sub, int flag) {
    Bits bits;
    bits.a = idx;
    bits.b = type;
    bits.c = sub;
    bits.d = flag;
    bits.e = 0;
    return *(u16 *)&bits;
}
void func_ov002_022a60f4(char *base, int idx, int type, int sub) {
    if ((unsigned)type >= 16) {
        int count;
        idx = data_ov002_022cd73c.index;
        count = *(int *)(base + 0x484 + idx * 0xcc);
        if (count >= 8) count = 8;
        sub = *(int *)(base + 0x488 + idx * 0xcc) + count / 2;
        *(u16 *)(base + 0x590) = pack(idx, 11, sub, 0);
    } else if (type <= 4 && (unsigned)sub >= 16) {
        *(u16 *)(base + 0x590) = pack(idx, type, 0, 0);
    } else {
        *(u16 *)(base + 0x590) = pack(idx, type, sub, 1);
    }
    *(u16 *)(base + 0x592) = pack(idx, type, sub, 0);
    *(u16 *)(base + 0x594) = *(u16 *)(base + 0x590);
}
