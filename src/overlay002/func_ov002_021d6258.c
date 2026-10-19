extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];
extern void func_ov002_021d5ab4(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021dec2c(int p, int slot, int q, unsigned short v);
struct Node { unsigned short f0; unsigned short kind:4; unsigned short rest:12; unsigned short f4; unsigned short next; };
struct Slot { unsigned int id:13; };
void func_ov002_021d6258(int player, int slot) {
    unsigned short value = *(unsigned short *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + slot * 20);
    if (value == 0) return;
    do {
        struct Node *node = (struct Node *)(data_ov002_022d0650 + value * 8);
        value = node->next;
        switch (node->kind) {
        case 6: {
            int lo = node->f0 & 0xff;
            int hi = (node->f0 >> 8) & 0xff;
            if (((struct Slot *)(data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 20 + 0x30))->id == 0x19ed)
                func_ov002_021dec2c(lo, hi, 0, 0);
            break;
        }
        case 10: case 11: case 12: case 13: {
            int packed = node->f0;
            func_ov002_021d5ab4(player, slot, packed, 0);
            func_ov002_021de480(packed & 0xff, (packed >> 8) & 0xff, 0, 0);
            break;
        }
        }
    } while (value != 0);
}
