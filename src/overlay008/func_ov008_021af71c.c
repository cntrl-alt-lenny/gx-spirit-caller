typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { char pad[6]; u16 mode; char pad8[176]; int active; } State;
typedef union { u32 raw; struct { u32 low:2; u32 rest:30; } bits; } Flags;
typedef struct { char pad[56]; Flags flags; } Row;
extern char data_ov008_021b2780[];
extern State data_ov008_021b2de4;
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021af4c4(int arg);
extern int func_ov008_021af588(int index, int *out, int flags);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202bb20(int a);
extern int Ov008_Rand(void);
/* The division routine returns quotient in the low word, remainder in the high word. */
extern long long func_020b3870(int numerator, int denominator);
void func_ov008_021af71c(u16 *out, int arg) {
    int normal[60], rare[60];
    int row = func_ov008_021aedfc(arg);
    u8 mode = func_ov008_021af4c4(arg);
    u8 specials = 0;
    u16 nr, nn;
    int i, j;
    int retry, choose;
    u8 counter;
    Row *p;
    if (data_ov008_021b2de4.active == 0) func_02022234(2, mode);
    nr = func_ov008_021af588(row, rare, 17);
    nn = func_ov008_021af588(row, normal, 1);
    p = (Row *)(data_ov008_021b2780 + row * 52);
    for (i = 0; i < 5; i++) {
        retry = 1;
        choose = 0;
        switch (i) {
        case 4:
            nr = (1 << mode) | 16;
            nr = func_ov008_021af588(row, rare, nr);
            nn = 1 << mode;
            nn = func_ov008_021af588(row, normal, nn);
            counter = (p->flags.raw >> (mode * 2)) & 3;
            if (nr != 0 && counter >= 2) {
                choose = 1;
                p->flags.raw &= ~(3 << (mode * 2));
            }
            if (choose) out[i] = rare[(int)(func_020b3870(Ov008_Rand(), nr) >> 32)];
            else {
                out[i] = normal[(int)(func_020b3870(Ov008_Rand(), nn) >> 32)];
                if (func_0202bb20(out[i])) {
                    p->flags.raw &= ~(3 << (mode * 2));
                    counter++;
                    p->flags.raw |= (counter & 3) << (mode * 2);
                } else p->flags.raw &= ~(3 << (mode * 2));
            }
            break;
        case 3:
            if (specials == 3) {
                if (nr) {
                    counter = p->flags.raw & 3;
                    if (counter >= 2) {
                        p->flags.bits.low = 0;
                        choose = 1;
                    } else p->flags.bits.low = (u8)(counter + 1);
                }
            } else p->flags.bits.low = 0;
            if (choose) {
                out[i] = rare[(int)(func_020b3870(Ov008_Rand(), nr) >> 32)];
                break;
            }
        case 0:
        case 1:
        case 2:
            do {
                out[i] = normal[(int)(func_020b3870(Ov008_Rand(), nn) >> 32)];
                for (j = 0; j < i; j++) {
                    if (out[i] == out[j]) break;
                }
                if (j == i) retry = 0;
            } while (retry);
            if (func_0202bb20(out[i])) specials++;
            break;
        }
    }
    data_ov008_021b2de4.mode = mode;
}





