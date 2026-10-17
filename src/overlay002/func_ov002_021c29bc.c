extern int func_0202e234(int a);
extern int func_ov002_021baca8(int a, int b, int c);
extern char data_ov002_022cf16c[];

void func_ov002_021c29bc(int player, int arg)
{
    int i;
    int end;
    char *p;

    if (func_0202e234(arg) != 0) {
        i = 0;
        end = 4;
    } else {
        i = 5;
        end = 9;
    }
    if (i > end) {
        return;
    }
    p = data_ov002_022cf16c + (player & 1) * 0x868 + i * 0x14;
    do {
        if (func_ov002_021baca8(player, i, arg) != 0) {
            *(unsigned int *)(p + 0x40) |= 0x20;
        }
        i++;
        p += 0x14;
    } while (i <= end);
}
