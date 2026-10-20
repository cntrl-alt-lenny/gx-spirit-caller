struct Slot13 { unsigned int id : 13; char pad[16]; };
struct Entry { char data[0x2c]; };
extern int data_ov002_022cd524;
extern struct Entry data_ov002_022cd538[2][5];
extern char data_ov002_022cf16c[];
extern void func_ov002_0227b090(int arg, int a, int b);
void func_ov002_0228387c(int arg) {
    int player, idx;
    struct Entry *base = &data_ov002_022cd538[0][0];
    data_ov002_022cd524 = arg;
    for (player = 0; player < 2; player++, base += 5) {
        struct Slot13 *slot = (struct Slot13 *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        struct Entry *entry;
        idx = 0;
        entry = base;
        for (; idx < 5; idx++, slot++, entry++) {
            if (slot->id) func_ov002_0227b090(player, idx, (int)entry);
        }
    }
}
