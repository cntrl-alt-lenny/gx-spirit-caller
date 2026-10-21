extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int player, int index);
/* This caller passes the card ID in r0; the current C callee ignores it. */
extern int func_0202eab0(int unused0);
extern int func_0202f620(int id, int *out);
extern int func_ov002_021c23ac(int player, int index);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc288(int player, int index);
struct Self { unsigned short f0; unsigned short side:1; unsigned short pad:5; unsigned short kind:6; };
int func_ov002_021f0848(struct Self *self, int player, int idx) {
    int id = func_ov002_021b9ecc(player, idx);
    if (self->kind == 0x23) return 1;
    if (id == 0) return 0;
    if (idx >= 5) return 0;
    if (self->side != player) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1)*0x868 + idx*20) == 0) return 0;
    if (func_0202eab0(id) == 0) return 0;
    if (func_0202f620(id, 0) == 0) return 0;
    if (func_ov002_021c23ac(player, idx) == 0) return 0;
    if (func_ov002_021bc618(self->side) == 0) {
        if (func_ov002_021bc288(player, idx) == 0) return 0;
    }
    return 1;
}

