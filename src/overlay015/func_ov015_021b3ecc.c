typedef struct {
    unsigned short kind : 8;
    unsigned short rest : 8;
    char pad[4];
} Entry_0200a2f4;

typedef struct {
    unsigned short kind : 8;
    unsigned short rest : 8;
    unsigned short unknown;
    unsigned short flag0 : 1;
    unsigned short flag1 : 1;
    unsigned short flags : 14;
} EntryFlags;

extern char data_ov015_021b5e28[];
extern int func_ov005_021ab3a0(void *obj, int idx);
extern int func_ov005_021ab3b4(void *obj, int idx);
extern Entry_0200a2f4 *func_0200a2f4(int a0);
extern int func_ov015_021b35d0(int idx);

int func_ov015_021b3ecc(int idx, int *out0, int *out1) {
    Entry_0200a2f4 *entry;
    EntryFlags *flags;
    int result;
    func_ov005_021ab3a0(*(void **)(data_ov015_021b5e28 + 0x890), idx);
    func_ov005_021ab3b4(*(void **)(data_ov015_021b5e28 + 0x890), idx);
    if (idx == 0) return 0;
    entry = func_0200a2f4(idx - 1);
    flags = (EntryFlags *)entry;
    result = func_ov015_021b35d0(entry->kind);
    if (out0) {
        if (flags->flag0 == 1) *out0 = 0;
        else *out0 = 0x3fff;
    }
    if (out1) {
        if (flags->flag1 == 1) *out1 = 1;
        else *out1 = 2;
    }
    return result;
}
