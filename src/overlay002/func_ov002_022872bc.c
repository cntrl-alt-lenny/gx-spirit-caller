struct Card { unsigned short pad; unsigned short player:1; unsigned short rest:15; };
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[12]; unsigned int flags; };
struct Player { char pad[0x30]; struct Slot slots[11]; char tail[0x75c]; };
struct State { char pad[0xcf8]; int active; };
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf16c[];
int func_ov002_022872bc(struct Card *p) {
    if (data_ov002_022d016c.active == 5) {
        int i;

        for (i = 5; i <= 10; i++) {
            if (((struct Slot *)(data_ov002_022cf16c + ((1 - p->player) & 1) * 0x868 + 0x30))[i].id) {
                if ((*(unsigned int *)(data_ov002_022cf16c + ((1 - p->player) & 1) * 0x868 + i * 0x14 + 0x40) >> 20) & 1) return 1;
            }
        }
    }
    return 0;
}








