struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
/* The original call supplies only r0 and r1 to the four-parameter thunk. */
extern int func_ov002_021c8940();
int func_ov002_021bbbc0(int a0, int a1, int a2) {
    int i;
    int count;
    struct Ov002Slot *slot;
    char *entry;
    entry = data_ov002_022cf16c + (a0 & 1) * 0x868;
    count = 0;
    slot = (struct Ov002Slot *)(entry + 0x30);
    for (i = 0; i < 5; i++, slot = (struct Ov002Slot *)((char *)slot + 20), entry += 20) {
        if (i == a2) continue;
        if (slot->id != 0 && *(unsigned short *)(entry + 0x38) != 0) {
            unsigned int flags = *(unsigned int *)(entry + 0x40);
            if (!(((flags >> 1) | (flags >> 2)) & 1)) {
                if (a1 == func_ov002_021c8940(a0, i)) count++;
            }
        }
    }
    return count;
}


