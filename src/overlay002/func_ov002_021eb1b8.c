typedef struct { unsigned short side : 1; unsigned short slot : 5; unsigned short rest : 10; } Flags;
typedef struct {
    unsigned short id;
    Flags flags;
    unsigned short pad[4];
    unsigned short kind;
} Header;
typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
    char pad[16];
} Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(void *a0, int a1, int a2);
extern int func_ov002_021b33b0(int a1, int a2, int player, int slot);
extern int func_ov002_021b3ac0(int a1, int a2, int player, int slot);
extern int func_ov002_021ef41c(int unused0, int a1, int a2);
int func_ov002_021eb1b8(Header *a0, int a1, int a2) {
    int player;
    int slot;
    char *p;
    if (a2 < 5 || a2 >= 10) return 0;
    if (((Slot *)(data_ov002_022cf16c + (a1 & 1) * 0x868 + a2 * 20 + 0x30))->id == 0) return 0;
    if (func_ov002_021c1ef0(a0, a1, a2) == 0) return 0;
    if (a0->kind == 2) {
        for (player = 0; player < 2; player++) {
            p = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
            for (slot = 0; slot <= 4; slot++, p += 20) {
                if (((Slot *)p)->id != 0) {
                    if (func_ov002_021b33b0(a1, a2, player, slot) != 0) {
                        
                        if (player == a0->flags.side && (int)a0->flags.slot == slot) {
                        } else
                        {
                            if (func_ov002_021b3ac0(a1, a2, a0->flags.side, ((Header *)a0)->flags.slot) != 0) return 1;
                        }
                        return 0;
                    }
                }
            }
        }
    } else {
        return func_ov002_021ef41c((int)a0, a1, a2);
    }
    return 0;
}









