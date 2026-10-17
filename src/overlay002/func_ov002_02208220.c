extern char data_ov002_022cf178[];
extern int func_ov002_021bb91c(int a);

typedef struct {
    unsigned short pad;
    unsigned short side : 1;
} Card;

extern int func_ov002_0220803c(Card *p, int b);

int func_ov002_02208220(Card *p, int b) {
    if (func_ov002_021bb91c(0x175e) == 0) {
        return 0;
    }
    if (func_ov002_0220803c(p, b) != 0) {
        int player = (1 - p->side) & 1;
        if (*(int *)(data_ov002_022cf178 + player * 0x868) != 0) {
            return 2;
        }
        return 1;
    }
    return 0;
}
