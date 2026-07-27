/* func_ov002_021d2ca0: reads data_ov002_022ce950's f_0 bit-15 flag and f_2
 * index, looks up the per-player (flag) row's slot at +0x30 (same sub-row
 * array as func_ov002_021bcfe4's Ov002Slot), packs two of that slot's other
 * bitfields into the sink's payload, then clears f_80c. */
extern char data_ov002_022ce950[];
extern char data_ov002_022cf16c[];
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);

struct Ce950Hdr {
    unsigned short f_0;
    unsigned short f_2;
};
#define CE950 ((struct Ce950Hdr *)data_ov002_022ce950)

struct Slot {
    unsigned int id : 13;
    unsigned int f13 : 1;
    unsigned int : 8;
    unsigned int f22 : 8;
    unsigned int : 2;
};

void func_ov002_021d2ca0(void) {
    int flag = (CE950->f_0 & 0x8000) ? 1 : 0;
    int f2 = CE950->f_2;
    char *row = data_ov002_022cf16c + (flag & 1) * 0x868;
    struct Slot *slot = (struct Slot *)(row + 0x30 + f2 * 20);
    func_ov002_0229ade0(0x28, flag, f2, slot->f13 + (slot->f22 << 1));
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
