typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 f0; u16 bit0:1; u16 rest:15; };
struct Entry { u32 lo:9; u32 player:1; u32 slot:4; u32 hi:18; };
struct Card { u32 id:13; u32 rest:19; u32 other; u16 active; u16 pad; u32 tail[2]; };
extern unsigned char data_ov002_022ce288[];
extern struct Entry data_ov002_022ce884[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(struct Self *self, int player, int slot);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021ba6cc(int self, int arg1);
int func_ov002_022877f0(struct Self *self) {
    unsigned int i;
    for (i = 0; i < *(u32 *)(data_ov002_022ce288 + 0x5d4); i++) {
        switch (data_ov002_022ce288[0x5dc+i]) { case 6: case 7: case 8:
            if (self->bit0 != data_ov002_022ce884[i].player &&
                ((struct Card *)(data_ov002_022cf16c + (data_ov002_022ce884[i].player & 1) * 0x868 + 0x30))[data_ov002_022ce884[i].slot].active != 0 &&
                func_ov002_021c1ef0(self, data_ov002_022ce884[i].player, data_ov002_022ce884[i].slot) != 0 &&
                func_ov002_021c8470(data_ov002_022ce884[i].player, data_ov002_022ce884[i].slot) <= 2000 &&
                func_ov002_021ba6cc(data_ov002_022ce884[i].player, (u16)((struct Card *)(data_ov002_022cf16c + (data_ov002_022ce884[i].player & 1) * 0x868 + 0x30))[data_ov002_022ce884[i].slot].id) != 0)
                return 1;
            break;
        }
    }
    return 0;
}


