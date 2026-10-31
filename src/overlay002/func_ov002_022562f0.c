extern char data_ov002_022cf16c[];
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern void func_ov002_021d90fc(int arg0, int arg1, unsigned int arg2);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
typedef struct { unsigned id:13; unsigned bit:1; unsigned pad:8; unsigned index:8; unsigned rest:2; } Card;
struct Player { char bytes[0x868]; };
void func_ov002_022562f0(int player)
{
    int side = 1-player;
    int i = 5;
    char *base = ((struct Player *)data_ov002_022cf16c)[side & 1].bytes;
    char *p = base + 0x64;
    Card *card = (Card *)(base + 0x94);
    for (; i<10; i++, p+=0x14, card+=5) {
        if (func_ov002_021baca8(side,i,0x159b)) {
            if (((*(unsigned *)(p+0x40) >> 5) & 1) == 0) {
                if (func_ov002_021e30b4((((side << 31) & 0x80000000) | 0x200000) | (((unsigned)i << 16) & 0x1f0000) | 0x159b, (unsigned short)(card->bit + card->index*2), 0)) {
                    func_ov002_021e2d94(side,i,5,1);
                    func_ov002_021d90fc(side,i,1);
                }
            } else {
                func_ov002_021d90fc(side,i,1);
            }
        }
    }
}





