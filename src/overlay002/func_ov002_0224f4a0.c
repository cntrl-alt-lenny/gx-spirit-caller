extern char data_ov002_022cf16c[];
extern char data_ov002_022ce288[];

extern int func_0202e234(int id);
extern int func_ov002_021ca5bc(int cat);
extern int func_ov002_021c38c4(int player, int cat);
extern int func_ov002_02257ab8(void *ptr, int player);
extern void func_ov002_02253458(int player, int type, int idx);

struct Ov002RowSlotAt120 {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int _unused : 8;
    unsigned int category : 8;
    unsigned int _unused2 : 2;
};

void func_ov002_0224f4a0(int player, int unused1, int idx) {
    int *p = (int *)(data_ov002_022cf16c + (player & 1) * 0x868);
    p = (int *)((char *)p + 0x120);
    struct Ov002RowSlotAt120 *entry = (struct Ov002RowSlotAt120 *)&p[idx];
    int catArg = entry->category * 2 + entry->flag;

    if (func_0202e234(entry->id) == 0) {
        return;
    }
    if (func_ov002_021ca5bc(catArg) == 0) {
        return;
    }
    int result = func_ov002_021c38c4(player, catArg);
    *(short *)(*(char **)(data_ov002_022ce288 + 0x48c) + 0xc) = (short)result;
    if (func_ov002_02257ab8(*(void **)(data_ov002_022ce288 + 0x48c), player) == 0) {
        return;
    }
    func_ov002_02253458(player, 0xb, idx);
}
