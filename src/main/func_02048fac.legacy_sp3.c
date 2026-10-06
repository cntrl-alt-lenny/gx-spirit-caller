typedef struct {
    char pad[0xc];
} Entry;

typedef struct {
    int mode;                                                 /* +0x00 */
    char _pad04[0x14];
    Entry *entries;                                           /* +0x18 */
    char _pad1c[0x18];
    void (*on_info)(int index, int len, char *buf, int user); /* +0x34 */
    int info_user;                                            /* +0x38 */
    char _pad3c[0x8];
    void (*on_select)(int index, int user);                   /* +0x44 */
    int select_user;                                          /* +0x48 */
} State;

extern State *data_0219dc80;
extern int func_020498c4(int a, int b);

void func_02048fac(int index) {
    struct {
        char name[0x108];
        char info[0x108];
    } tmp;
    if (data_0219dc80->on_select != 0 && data_0219dc80->mode != 1) {
        data_0219dc80->on_select(index, data_0219dc80->select_user);
    }
    if (data_0219dc80->on_info != 0) {
        int len = func_020498c4((int)&data_0219dc80->entries[index], (int)tmp.info);
        data_0219dc80->on_info(index, len, tmp.info, data_0219dc80->info_user);
    }
}
