struct Player { char pad[0x10]; unsigned int count; char pad2[0x24c]; int slots[386]; };
struct Count { unsigned int count; char pad[0x864]; };
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf17c[];
extern void func_ov002_021b91c4(int *dst, const int *src);
extern int func_ov002_021b91f8(int *a, int *b);
int func_ov002_021ba430(int player, int *value) {
    unsigned int index = 0;
    player &= 1;
    if (index < data_ov002_022cf17c[player].count) {

        do {
            if (func_ov002_021b91f8(&data_ov002_022cf16c[player].slots[index], value)) {
                --data_ov002_022cf17c[player].count;
                if (index < data_ov002_022cf17c[player].count) {
                    do {
                        func_ov002_021b91c4(&data_ov002_022cf16c[player].slots[index], &data_ov002_022cf16c[player].slots[index + 1]);
                        ++index;
                    } while (index < data_ov002_022cf16c[player].count);
                }
                return 1;
            }
            ++index;
        } while (index < data_ov002_022cf16c[player].count);
    }
    return 0;
}

