typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 rest:15; };
/* These thunks are called with only r0 and r1 set here. */
extern int func_ov002_021bbd04();
extern int func_ov002_02257878();
extern int func_ov002_021e96a0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021eb8c8(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021bae7c(int player, int id, int except);
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022d016c[];
int func_ov002_02209aac(struct Ov002Self *self) {
    if (!func_ov002_021bbd04(self->b0, 3) && !func_ov002_021bbd04(1-self->b0, 3)) return 0;
    if (!func_ov002_021bbd04(self->b0, 4) && !func_ov002_021bbd04(1-self->b0, 4)) return 0;
    if (!func_ov002_021bbd04(self->b0, 5) && !func_ov002_021bbd04(1-self->b0, 5)) return 0;
    if (!func_ov002_021bbd04(self->b0, 6) && !func_ov002_021bbd04(1-self->b0, 6)) return 0;
    if (func_ov002_02257878(self, func_ov002_021e96a0)) return 1;
    if (func_ov002_02257878(self, func_ov002_021eb8c8)) return 1;
    {
        int player = self->b0;
        int other = 1-player;
        if (*(int *)(data_ov002_022cf178 + (other & 1)*0x868)) return 1;
        if (*(unsigned int *)(data_ov002_022cf17c + (player & 1)*0x868) >= 2) {
            if (*(int *)(data_ov002_022d016c + 0xcf8) == 0 || func_ov002_021bae7c(other, 0x178b, -1) == 0) return 1;
        }
    }
    return 0;
}
