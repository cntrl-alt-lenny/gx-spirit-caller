typedef unsigned int u32;
struct Card { u32 id:13; u32 rest:19; };
struct Player { char pad[0xf8]; struct Card card; u32 unknown; unsigned short hp; unsigned short pad2; u32 pad3; u32 bits; char tail[0x75c]; };
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021bb418(int arg0);
extern void func_ov002_021d95fc(int id);
int func_ov002_022537f8(void) {
    int i;
    int shift;
    int result = 0;
    u32 flags = *(u32 *)(data_ov002_022d016c + 0xd4);
    int id;
    struct Player *p;
    int card;
    for (i = 0, shift = 10; i < 2; i++, shift += 16) {


        card = *(int *)&data_ov002_022cf16c[i & 1].card;
        id = ((unsigned)(card << 19)) >> 19;
        if (id != 0 && data_ov002_022cf16c[i & 1].hp != 0 &&
            (((data_ov002_022cf16c[i & 1].bits >> 1) | (data_ov002_022cf16c[i & 1].bits >> 2)) & 1) == 0 &&
            (flags & (1 << shift)) == 0) {
            result = id;
        }
    }
    if (result == 0) {
        if (func_ov002_021bb418(0x13a2)) result = 0x10f4;
    }
    if (*(int *)(data_ov002_022d016c + 0xdc) == result) return 0;
    func_ov002_021d95fc(result);
    return 1;
}















