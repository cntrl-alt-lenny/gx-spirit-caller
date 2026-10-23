struct Player { char pad[0xc]; unsigned int count; char pad2[0x110]; int slots[466]; };
struct Count { unsigned int count; char pad[0x864]; };
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[];
extern void func_ov002_021b91c4(int *dst, const int *src);
extern int func_ov002_021b91f8(int *a, int *b);
/* Original call supplies only the first two arguments of this four-argument thunk. */
extern int func_ov002_0229cd5c();
int func_ov002_021c37f4(int player, int *value) {
    unsigned int index = 0;
    player &= 1;
    if (index < data_ov002_022cf178[player].count) {
        do {
            if (func_ov002_021b91f8(&data_ov002_022cf16c[player].slots[index], value)) {
                --data_ov002_022cf178[player].count;
                if (index < data_ov002_022cf178[player].count) {
                    do {
                        func_ov002_021b91c4(&data_ov002_022cf16c[player].slots[index], &data_ov002_022cf16c[player].slots[index + 1]);
                        ++index;
                    } while (index < data_ov002_022cf16c[player].count);
                }
                func_ov002_0229cd5c((int)&data_ov002_022cf16c[player].slots[data_ov002_022cf178[player].count], 4);
                return 1;
            }
            ++index;
        } while (index < data_ov002_022cf16c[player].count);
    }
    return 0;
}

