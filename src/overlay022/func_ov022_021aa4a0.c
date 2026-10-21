typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    int index;
    u16 first, last, previous, other, pad0c, saved;
    int pad10;
    int active;
} State;
typedef struct {
    State state;
    char gap18[0x404];
} Entry;
typedef struct {
    char gap0[0x10];
    Entry entries[2];
    char gap848[0x43c];
    char buffer0[0x200];
    char buffer1[0x200];
    char gap1084[0xcc];
    unsigned int flags;
} OverlayData;
typedef struct {
    char gap0[0x198];
    unsigned int enabled : 1;
    unsigned int rest : 31;
} OverlayState;
extern OverlayData data_ov022_021abae8;
extern OverlayState data_ov022_021acaa0;
extern void func_0207ed94(State *);
extern void func_0207ec68(State *);
extern void func_0208f5ac(void);
extern void func_0208f52c(void *, int, int);
extern void func_0208f4c8(void);
extern void func_0208f368(void);
extern void func_0208f2f4(void *, int, int);
extern void func_0208f2a8(void);
void func_ov022_021aa4a0(void) {
    OverlayData *data = &data_ov022_021abae8;
    int i;
    Entry *entry;
    if (data_ov022_021acaa0.enabled == 1) {
        data->flags &= ~1;
        func_0208f5ac();
        func_0208f52c(data->buffer0, 0x4000, 0x200);
        func_0208f4c8();
        func_0208f368();
        func_0208f2f4(data->buffer1, 0x4000, 0x200);
        func_0208f2a8();
    }
    entry = data->entries;
    for (i = 0; i < 2; entry++, i++) {
        func_0207ed94(&entry->state);
        func_0207ec68(&entry->state);
    }
}


