typedef unsigned short u16;
typedef unsigned char u8;
struct Entry { unsigned id:13; unsigned rest:19; unsigned int pad4; u16 h8; char tail[10]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
struct Ctx { char pad[0xcec]; int w; };
extern struct Player data_ov002_022cf16c[];
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02255d70(void)
{
    int i, player, j;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c.w ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(player, j, 0x14fc) != 0) {
                int pair = func_ov002_021b3618(player, j);
                if (pair != 0xffff) {
                    if (data_ov002_022cf16c[(u8)pair & 1].cards[(u8)((u16)pair >> 8)].id != 0 && data_ov002_022cf16c[(u8)pair & 1].cards[(u8)((u16)pair >> 8)].h8 == 0) {
                        func_ov002_021de480(player, j, 0, 0);
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}
