typedef struct {
    char pad[0xc];
} Entry;

typedef struct {
    char _pad0[0x3c];
    void (*on_clear)(int index, int arg, int user); /* +0x3c */
    int user;                                       /* +0x40 */
} State;

extern State *data_0219dc80;
extern void func_020945f4(void *dst, int val, int n);

void func_02048bc0(Entry *table, int index, int arg) {
    if (data_0219dc80 == 0) {
        return;
    }
    func_020945f4(&table[index], 0, 0xc);
    if (data_0219dc80->on_clear != 0) {
        data_0219dc80->on_clear(index, arg, data_0219dc80->user);
    }
}
