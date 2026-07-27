struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf08c[];
extern char data_ov002_022d008c[];
extern int  func_0202e1e0(int a);
int func_ov002_0226ba68(int arg0, int arg1, int arg2) {
    int v;
    if (arg0 == *(int *)(data_ov002_022d008c + 0xd94))
        goto zero;
    if (arg1 != 0xb)
        goto zero;
    v = ((struct Ov002Slot *)(data_ov002_022cf08c + (arg0 & 1) * 0x868 +
                              arg2 * 4 + 0x120))->id;
    if (func_0202e1e0(v)) {
        return 0x800;
    }
zero:
    return 0;
}
