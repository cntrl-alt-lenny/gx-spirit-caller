typedef unsigned int u32;
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; u32 rest[4]; };
struct Player { char pad[0x30]; struct Record records[5]; char tail[0x7d4]; };
struct State { char pad[0xd28]; u32 index; };
extern struct Player data_ov002_022cf16c[];
extern struct State data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_0226666c(int player, int arg) {
    while (data_ov002_022d016c.index < 5) {
        u32 i = data_ov002_022d016c.index;
        if (func_ov002_021baca8(player, i, arg)) {
            struct Record *rec = &data_ov002_022cf16c[player & 1].records[i];
            if (func_ov002_021e30b4(((u32)player << 31 & 0x80000000) | 0x4200000 | ((i << 16) & 0x1f0000) | (unsigned short)arg,
                (unsigned short)(rec->value * 2 + rec->bit), 0)) {
                data_ov002_022d016c.index++;
                return 0;
            }
        }
        ++data_ov002_022d016c.index;
    }
    return 1;
}

