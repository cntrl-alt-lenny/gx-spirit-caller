extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf17c[];
extern void func_ov002_021b91c4(int *dst, const int *src);
int func_ov002_021ba38c(int player, unsigned int index, int *out) {
    int offset = (player & 1) * 0x868;
    int *slot;
    if (index < *(unsigned int *)((char *)data_ov002_022cf17c + offset)) {
        slot = (int *)(data_ov002_022cf16c + offset + 0x260) + index;
        func_ov002_021b91c4(out, slot);
        --*(unsigned int *)((char *)data_ov002_022cf17c + offset);
        if (index < *(unsigned int *)((char *)data_ov002_022cf17c + offset)) {
            do {
                func_ov002_021b91c4((int *)(data_ov002_022cf16c + offset + 0x260) + index, (int *)(data_ov002_022cf16c + offset + 0x260) + (index + 1));
                ++index;

            } while (index < *(unsigned int *)(data_ov002_022cf16c + offset + 0x10));
        }
        return 1;
    }
    return 0;
}

