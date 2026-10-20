extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021be384(int a0, int a1, int a2);
extern void func_ov002_0227b090(int arg, int a, int b);
extern int func_ov002_022815a4(int id, int flag);
extern int func_ov002_0228c584(int player, unsigned int mask, int attack, int defense);
extern int func_ov002_0228cba8(int player, unsigned int mask);
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
typedef struct { unsigned int id:13; unsigned int rest:19; } CardBits;
int func_ov002_0228cdc0(int player, unsigned int mask, int flag)
{
    int list[11];
    int info[11];
    int i, shift, j, temp, slot;
    int count = 0;
    int *listPtr;
    unsigned char *entry;
    unsigned int valid;


    i = 0;

    for (; i <= 10; i++) {
        if (mask & (1u << (i + (player << 4)))) {
            list[count] = i;
            count++;
        }
    }
    for (shift = count - 1; shift > 0; shift--) {
        int random = func_ov002_021b00d0(shift + 1);
        temp = list[shift];
        list[shift] = list[random];
        list[random] = temp;
    }
    for (i = 0; i < count; i++) {
        slot = list[i];
        entry = data_ov002_022cf16c + (player & 1) * 0x868 + slot * 20;
        if ((*(unsigned int *)(entry + 0x40) >> 8) & 1) {
            if (func_ov002_022815a4(((CardBits *)(entry + 0x30))->id, flag))
                return slot;
        }
    }
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 3 && *(int *)(data_ov002_022d016c + 0xcec) == player) {
        valid = 0;
    
        for (i = 0; i <= 10; i++) {
            if (mask & (1u << (i + (player << 4)))) {
                if (func_ov002_021be384(player, i, 1)) valid |= 1u << (i + (player << 4));
            }
        }
        slot = func_ov002_0228c584(player, valid, 1, 0);
        if (slot >= 0) {
            func_ov002_0227b090(player, slot, (int)info);
            if (info[5] >= *(int *)(data_ov002_022cf16c + ((1 - player) & 1) * 0x868)) return slot;
        }
    }
    slot = func_ov002_0228c584(player, mask, 1, 1);
    if (slot >= 0) return slot;
    return func_ov002_0228cba8(player, mask);
}











