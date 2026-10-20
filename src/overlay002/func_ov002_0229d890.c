typedef struct {
    unsigned short a:1;
    unsigned short b:5;
    unsigned short c:8;
    unsigned short d:1;
    unsigned short e:1;
} bits_t;
typedef struct {
    unsigned char f_0, _p1, f_2, f_3;
    unsigned short _p4, f_6, f_8;
    bits_t f_a;
    int f_c, f_10;
} obj_t;
typedef struct {
    obj_t entries[8];
    int side, count, base;
    char pad[0x10];
    unsigned int bits[4];
} state_t;
typedef struct { unsigned int card:13; unsigned int rest:19; } card_t;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c988c(int side, int kind, int index);
extern void func_ov002_0229d184(obj_t *p, int arg1, bits_t *arg2);
void func_ov002_0229d890(state_t *s, int index, int clear) {
    int i;
    int requested = index;
    obj_t *p;
    bits_t flags;
    int n;
    int card;
    unsigned short active;
    index = s->count - 8;
    if (requested <= index) index = requested;
    if (index <= 0) index = 0;
    if (clear) {
        int j; for (j = 0; j < 4; j++) s->bits[j] = 0;
    }
    for (i = 0; i < 8; i++) {
        p = &s->entries[i];

        if (index + i >= s->count) p->f_0 = 0;
        else {
            card = ((card_t *)(data_ov002_022cf16c + (s->side & 1) * 0x868 + (index + i) * 4 + 0x120))->card;
            n = index + i;
            active = func_ov002_021c988c(s->side, 11, n) || ((s->bits[(unsigned int)n >> 5] >> (n & 31)) & 1);
            flags.a = (unsigned short)s->side;
            flags.b = 11;
            flags.c = (unsigned short)n;
            flags.d = active;
            flags.e = 0;
            func_ov002_0229d184(p, card, &flags);
        }
    }
    s->base = index;
}










