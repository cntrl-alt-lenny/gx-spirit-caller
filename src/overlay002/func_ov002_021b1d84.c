typedef unsigned short u16;
extern char data_ov002_022d0656[];
extern char data_ov002_022d0650[];
extern char data_ov002_022cd3f4[];
struct Four { u16 a, link; };
struct Eight { u16 a, b, c, link; };
struct State { char pad[0x10e4]; struct Four first[256]; struct Eight second[256]; };
extern struct State data_ov002_022cf16c;
extern int func_ov002_0229cd5c(int a, int b, int unused, int d);
void func_ov002_021b1d84(int index) {
    unsigned int next;
    int i, j;
    char *q, *p;
    next = *(u16 *)(data_ov002_022d0656 + index * 8);
    func_ov002_0229cd5c((int)(data_ov002_022d0650 + index * 8), 8, (int)data_ov002_022d0656, index * 8);
    q = data_ov002_022cd3f4;
    i = 0;
    do {
        j = 0;
        p = (char *)&data_ov002_022cf16c + (i & 1) * 0x868;
        do {
            if (index == *(u16 *)(p + 0x3a)) *(u16 *)(p + 0x3a) = (u16)next;
            j++;
            p += 0x14;
        } while (j <= 11);
        if (index == *(u16 *)(q + 0xce)) *(u16 *)(q + 0xce) = (u16)next;
        i++;
        q += 0x14;
    } while (i < 2);
    for (j = 1; j < 256; j++) {
        if (index == data_ov002_022cf16c.first[j].link) data_ov002_022cf16c.first[j].link = (u16)next;
    }
    for (j = 1; j < 256; j++) {
        if (index == data_ov002_022cf16c.second[j].link) data_ov002_022cf16c.second[j].link = (u16)next;
    }
}










