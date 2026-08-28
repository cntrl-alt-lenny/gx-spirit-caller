/* func_ov002_021bbb88: for each i=0..4 (excluding i==a2), if the
 * Ov002Slot at row+i*20+0x30 is occupied and *(u16*)(row+i*20+0x38) is
 * nonzero, and neither bit1 nor bit2 of *(int*)(row+i*20+0x40) is set,
 * call func_ov002_021c92ec(a0,i,a1) and count nonzero results.
 */
struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf08c[];
extern int func_ov002_021c92ec(int player, int idx, int val);

int func_ov002_021bbb88(int a0, int a1, int a2) {
    int i;
    int count;
    struct Ov002Slot *slot;
    char *entry;

    entry = (char *)data_ov002_022cf08c + (a0 & 1) * 0x868;
    slot = (struct Ov002Slot *)(entry + 0x30);
    count = 0;

    for (i = 0; i < 5; i++, slot = (struct Ov002Slot *)((char *)slot + 20), entry += 20) {
        if (i == a2) {
            continue;
        }
        if (slot->id != 0 && *(unsigned short *)(entry + 0x38) != 0) {
            unsigned int flags = *(unsigned int *)(entry + 0x40);
            if (!(((flags >> 1) | (flags >> 2)) & 1)) {
                if (func_ov002_021c92ec(a0, i, a1) != 0) {
                    count++;
                }
            }
        }
    }

    return count;
}
