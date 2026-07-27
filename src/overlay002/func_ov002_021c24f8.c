/* func_ov002_021c24f8: sum func_ov002_021b9e00(arg0, j) over slots 0..10
 * whose id (13-bit at slot+0x30) and flag (u16 at slot+0x38) are both set. */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9e00(int player, int idx);

int func_ov002_021c24f8(int arg0) {
    int j;
    int sum = 0;
    char *row = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    char *r6 = row + 0x30;
    char *r7 = row;
    for (j = 0; j <= 10; j++, r6 += 0x14, r7 += 0x14) {
        unsigned int id13 = ((struct Ov002Slot *)r6)->id;
        if (id13 != 0 && *(unsigned short *)(r7 + 0x38) != 0) {
            sum += func_ov002_021b9e00(arg0, j);
        }
    }
    return sum;
}
