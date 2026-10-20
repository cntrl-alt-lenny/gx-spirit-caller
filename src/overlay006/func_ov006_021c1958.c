typedef struct {
    short id, a, b, c, d, e, f, g, h, i;
    unsigned char pad14[3];
    unsigned char kind;
} Record;
extern Record data_020c9694[];
extern int func_0202bcb0(int value);
Record *func_ov006_021c1958(void *s, int selection) {
    Record *record = data_020c9694;
    selection = func_0202bcb0(selection);
    while (record->id >= 0) {
        if (record->id == selection) return record;
        record++;
    }
    return 0;
}
