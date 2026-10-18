struct Slot { unsigned int id : 13; unsigned int rest : 19; unsigned int pad[4]; };
struct Row { char head[0x94]; struct Slot s[5]; char tail[0x868 - 0x94 - 100]; };

extern struct Row data_ov002_022cf16c[];
extern void func_ov002_021d5fb4(int a, int b);

int func_ov002_02262738(void)
{
    int i;
    int j;
    struct Slot *p;
    for (i = 0; i < 2; i++) {
        j = 5;
        p = data_ov002_022cf16c[i & 1].s;
        do {
            if (p->id == 0x13f9)
                func_ov002_021d5fb4(i, j);
            j++;
            p++;
        } while (j < 10);
    }
    return 1;
}
