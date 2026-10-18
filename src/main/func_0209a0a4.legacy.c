extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_02096358(int a, int b, int c);
typedef struct { unsigned int a; unsigned short b; unsigned short c; } Entry;
struct State {
    void (*callback)(int, int, int);
    unsigned char pad4[8];
    unsigned short count;
    unsigned short mode;
    Entry *entries;
    unsigned short length;
    unsigned char pad16[0x1e];
    unsigned short flags;
    unsigned short active;
};
extern struct State data_021a8394;
void func_0209a0a4(unsigned int a, unsigned int b, Entry *entries, unsigned int n) {

    int state;
    int ok;
    unsigned int i;
    {
    struct State *p = &data_021a8394;
    p->entries = entries;
    p->count = 0;
    p->mode = b;
    p->length = n;
    for (i = 0; i < n; i++) p->entries[i].b = 0;
    }
    state = OS_DisableIrq();
    if (func_02096358(6, 0x02000100 | (b & 0xff), 0) < 0) ok = 0;
    else if (func_02096358(6, a | 0x01010000, 0) < 0) ok = 0;
    else ok = 1;
    if (!(unsigned char)ok) {
        OS_RestoreIrq(state);
        data_021a8394.flags |= 2;
        if (data_021a8394.callback != 0) data_021a8394.callback(1, 4, 0);
        return;
    }
    data_021a8394.active |= 2;
    ((unsigned short *)&data_021a8394)[26] &= ~2;
    OS_RestoreIrq(state);
}





