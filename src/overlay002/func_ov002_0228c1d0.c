typedef struct Record {
    unsigned int cardId;
    int (*handler)(void *, void *);
} Record;
struct State {
    unsigned char pad[0x5d4];
    int active;
    unsigned char pad2[4];
    unsigned char mode;
};
extern void *data_ov002_022cd524;
extern struct State data_ov002_022ce288;
extern unsigned short data_ov002_022c863e[];
extern unsigned short data_ov002_022c8610[];
extern const Record data_ov002_022c89a0[];
extern int func_ov002_02288aa0(void *, void *);
extern int func_ov002_02289dfc(void *, void *);
extern int func_ov002_0228bcd0(void *, const Record *, void *);
extern int func_ov002_02297d08(void *thing);

int func_ov002_0228c1d0(void *player, void *arg1) {
    Record rec;
    unsigned int i;
    const Record *p;
    data_ov002_022cd524 = player;
    if (data_ov002_022ce288.active != 0) {
        switch (data_ov002_022ce288.mode) {
        case 0x12:
        case 0x13:
            rec.handler = func_ov002_02288aa0;
            for (i = 0; i < 0x3d; i++) {
                rec.cardId = data_ov002_022c863e[i];
                if (func_ov002_0228bcd0(player, &rec, arg1)) return 1;
            }
            break;
        case 0x14:
            rec.handler = func_ov002_02289dfc;
            for (i = 0; i < 0x17; i++) {
                rec.cardId = data_ov002_022c8610[i];
                if (func_ov002_0228bcd0(player, &rec, arg1)) return 1;
            }
            break;
        }
    }
    p = data_ov002_022c89a0;
    for (i = 0; i < 0xca; i++, p++) {
        if (func_ov002_0228bcd0(player, p, arg1)) return 1;
    }
    if (arg1 == 0) {
        if (func_ov002_02297d08(player)) return 1;
    }
    return 0;
}
