typedef unsigned int u32;
typedef unsigned short u16;
struct Ctx { char pad[0xcec]; int w; };
struct Slot { char pad[0x38]; u16 h38; u16 pad3a; u32 w3c; u32 w40; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a0[];
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021b9ecc(int a0, int a1);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02255998(int id)
{
    int i, player, j, k, off;
    struct Slot *p;
    for (i = 0; i < 2; i++) {
        player = data_ov002_022d016c.w ^ i;
        off = (player & 1) * 0x868;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(player, j, id) != 0) {
                p = (struct Slot *)(data_ov002_022cf16c + off);
                for (k = 0; k < 5; k++) {
                    if (k != j && id == func_ov002_021b9ecc(player, k) && p->h38 != 0) {
                        u32 f = p->w40;
                        if ((((f >> 1) | (f >> 2)) & 1) == 0) {
                            if (*(u16 *)(data_ov002_022cf1a0 + off + j * 20) > *(u16 *)(data_ov002_022cf1a0 + off + k * 20)) {
                                func_ov002_021de480(player, j, 0, 0);
                                return 1;
                            } else {
                                func_ov002_021de480(player, k, 0, 0);
                                return 1;
                            }
                        }
                    }
                    p = (struct Slot *)((char *)p + 20);
                }
            }
        }
    }
    return 0;
}

