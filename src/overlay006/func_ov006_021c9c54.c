typedef struct {
    int unused;
    unsigned int mode : 3;
    unsigned int rest : 29;
} Global;
typedef struct {
    unsigned char pad[6];
    unsigned char columns, rows;
    int unused;
    short *values;
    int tail;
} Entry;
extern Global data_02104f4c;
extern Entry data_ov006_021ce650[];
extern Entry data_ov006_021ce8a8[];
int func_ov006_021c9c54(int *base, int x, int y) {
    Entry *entry;
    unsigned int table;
    int selection;
    short *values;
    int index;

    if (data_02104f4c.mode == 0) entry = &data_ov006_021ce650[base[29]];
    else entry = &data_ov006_021ce8a8[base[29]];

    values = entry->values;
    if (values == 0) return -1;
    index = base[30] * y + x;
    if (index >= entry->columns * entry->rows) {
        if (base[23] != 0) {
            if (index == entry->columns * entry->rows) return 5;
            if (base[24] != 0) return 6;
            else return 7;
        } else {
            if (base[24] != 0) return 6;
            else return 7;
        }
    }
    return values[index];
}









