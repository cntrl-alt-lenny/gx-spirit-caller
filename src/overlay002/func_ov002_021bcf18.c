extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int a0, int a1);
struct Bits { unsigned int id:13; unsigned int rest:19; };
int func_ov002_021bcf18(int player, int a, int b, int extra) {
    int n;
    int i;
    int count;
    struct Bits *q;
    char *p;
    count = 0;
    n = extra ? 11 : 10;
    i = 0;
    if (i < n) {
        p = data_ov002_022cf16c + (player & 1) * 0x868;
        q = (struct Bits *)(p + 0x30);
        do {
            int accept;
            if (q->id != 0) {
                if (i >= 5 || func_ov002_021b8fcc(player, i) != 0) {
                    accept = 0;
                    if (a == 0 && b == 0) accept = 1;
                    if (a != 0 && *(unsigned short *)(p + 0x38) != 0) accept = 1;
                    if (b != 0 && *(unsigned short *)(p + 0x38) == 0) accept = 1;
                    if (accept != 0) count++;
                }
            }
            i++;
            q = (struct Bits *)((char *)q + 0x14);
            p += 0x14;
        } while (i < n);
    }
    return count;
}

