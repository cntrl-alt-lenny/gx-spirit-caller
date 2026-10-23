typedef unsigned short u16;
typedef unsigned int u32;
struct Flags { u16 pad; u16 player:1; u16 rest:5; u16 kind:6; u16 high:4; };
struct Slot { u32 id:13; u32 rest:19; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c23ac(int player, int index);
extern void func_ov002_021ded30(unsigned short *p, int arg1);
int func_ov002_021f92d0(unsigned short *self) {
    int i, ok, mask;
    if (((struct Flags *)self)->kind != 5) {
        ok = 1;
        mask = 0;
        for (i = 5; i < 10; i++) {
            int player = ((struct Flags *)self)->player;
            char *slot = data_ov002_022cf16c + (player & 1) * 0x868 + i * 20;
            if (*(u16 *)(slot + 0x38) != 0) {
                int id = ((struct Slot *)(slot + 0x30))->id;
                switch (id) { case 0x17ad: case 0x17ae: case 0x17af:
                    mask |= 1 << (i + (player << 4));
                    ok &= func_ov002_021c23ac(player, i); break;
                }
            }
        }
        func_ov002_021ded30(self, mask);
        self[6] = ok;
    }
    return 1;
}



