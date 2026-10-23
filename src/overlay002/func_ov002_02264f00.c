extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern unsigned short data_ov002_022cf282[];
typedef struct {
    unsigned short code;
    unsigned short kind : 4;
    unsigned short pad : 1;
    unsigned short amount : 3;
    unsigned short rest : 8;
    unsigned short unused;
    unsigned short next;
} Entry;
extern Entry data_ov002_022d0650[];
int func_ov002_02264f00(int player, int code, int value) {
    unsigned int index;
    if (func_ov002_021b3ecc(player, 11, code) != 0) {
        index = *(unsigned short *)((char *)data_ov002_022cf282 + (player & 1) * 0x868);
        while (index != 0) {
            Entry *entry = &data_ov002_022d0650[index];
            index = entry->next;
            if (entry->kind == 1 && entry->code == code) {
                func_ov002_021d479c((player ? 0x8000 : 0) | 0x3b, code, 1, value - entry->amount);
            }
        }
    }
    return 1;
}
