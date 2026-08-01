extern char data_ov002_022cf16c[];

typedef struct {
    char _pad0[0x30];
    unsigned int field_30 : 13;
} Entry_t;

extern int func_ov002_022575c8(void *player, int bit, int i);
extern int func_0202b8a8(unsigned int val);

int func_ov002_02291900(char *player) {
    int i;
    for (i = 0; i <= 4; i++) {
        int bit0 = ((unsigned int)(*(unsigned short *)(player + 2) << 31)) >> 31;
        if (func_ov002_022575c8(player, bit0, i)) {
            unsigned int bit = (((unsigned int)(*(unsigned short *)(player + 2) << 31)) >> 31) & 1;
            Entry_t *entry = (Entry_t *)(data_ov002_022cf16c + bit * 0x868 + i * 0x14);
            unsigned int flags = *(unsigned int *)((char *)entry + 0x40);
            if (((flags >> 0x16) & 1) + ((flags >> 0x17) & 1)) {
                if (func_0202b8a8(entry->field_30) <= 4) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
