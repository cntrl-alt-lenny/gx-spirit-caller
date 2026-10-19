extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_022815a4(int a, int b);
extern int func_ov002_0228c584(int a, unsigned int b, int c, int d);
extern int func_ov002_0228cb48(int a, unsigned int mask);
typedef struct { unsigned int id : 13; unsigned int rest : 19; } CardBits;
extern unsigned char data_ov002_022cf16c[];

int func_ov002_0228cf94(int a, unsigned int mask) {
    int buf[11];
    int i;
    unsigned int rejected = 0;

    int v;
    int count = 0;
    int shift;
    i = 0;
    shift = a * 16;
    for (; i <= 10; i++, shift++) {
        if (mask & (1u << shift)) {
            buf[count] = i;
            count++;
        }
    }
    for (i = count - 1; i > 0; i--) {
        int r = func_ov002_021b00d0(i + 1);
        int t = buf[i];
        buf[i] = buf[r];
        buf[r] = t;
    }
    for (i = 0; i < count; i++) {
        v = buf[i];
        unsigned int card = ((CardBits *)(data_ov002_022cf16c + (a & 1) * 0x868 + v * 20 + 0x30))->id;
        if (func_ov002_022815a4(card, 0)) {
            rejected |= 1u << (v + a * 16);
        }
    }
    {
        int result = func_ov002_0228c584(a, mask ^ rejected, -1, -1);
        if (result >= 0) return result;
    }
    return func_ov002_0228cb48(a, mask);
}





