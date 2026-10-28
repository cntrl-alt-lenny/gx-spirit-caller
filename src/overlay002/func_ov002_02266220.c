typedef unsigned int u32;
typedef unsigned short u16;
struct Record { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 high:2; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_ov002_021fd81c(u32 packed, u16 value, int extra);
int func_ov002_02266220(int player) {
    int i;
    char *p = data_ov002_022cf16c + (player & 1) * 0x868;
    struct Record *r = (struct Record *)(p + 0x30);
    for (i = 0; i <= 4; i++, p += 0x14, r = (struct Record *)((char *)r + 0x14)) {
        int id = func_ov002_021b9ecc(player, i);
        if (id == 0x1954 && *(u16 *)(p + 0x38) != 0) {

            if (func_ov002_021fd81c(((player << 31) & 0x80000000) | 0x600000 | ((u32)((unsigned long long)i << 16) & 0x1f0000) | (u16)id, (u16)(r->value * 2 + r->bit), 0)) return 0;
        }
    }
    return 1;
}




