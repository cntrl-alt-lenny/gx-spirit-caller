typedef struct { char pad[0x260]; int items[386]; } Row;
typedef struct { int count; char pad[0x864]; } Counts;
extern Counts data_ov002_022cf17c[];
extern Row data_ov002_022cf16c[];
extern void func_ov002_021b91c4(int *dst, const int *src);
void func_ov002_021ba11c(int player, const int *value) {
    int i;
    player &= 1;
    for (i = data_ov002_022cf17c[player].count; i > 0; i--) {
        func_ov002_021b91c4(&data_ov002_022cf16c[player].items[i], &data_ov002_022cf16c[player].items[i - 1]);
    }
    data_ov002_022cf17c[player].count++;
    func_ov002_021b91c4(data_ov002_022cf16c[player].items, value);
}
