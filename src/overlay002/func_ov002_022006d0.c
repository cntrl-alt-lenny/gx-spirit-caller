/* func_ov002_022006d0: map arg0[0] to a threshold (3/2/1), derive a player
 * from bit14^bit0 of arg0[1], and compare data_ov002_022cf17c's per-player
 * count to the threshold. */
typedef unsigned short u16;
struct S022006d0F2 { u16 bit0 : 1; u16 mid : 13; u16 bit14 : 1; u16 bit15 : 1; };
extern int data_ov002_022cf17c[];

int func_ov002_022006d0(u16 *arg0) {
    int threshold;
    int player;
    int count;
    struct S022006d0F2 *f2 = (struct S022006d0F2 *)&arg0[1];
    switch (arg0[0]) {
    case 0x12cc: threshold = 3; break;
    case 0x12ec: threshold = 2; break;
    default: threshold = 1; break;
    }
    player = (f2->bit0 ^ f2->bit14) & 1;
    count = *(int *)((char *)data_ov002_022cf17c + player * 0x868);
    return (unsigned)count >= (unsigned)threshold;
}
