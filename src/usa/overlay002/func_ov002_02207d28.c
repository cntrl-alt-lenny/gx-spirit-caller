typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { int f0; u8 pad[0x868 - 4]; } Entry;   /* data_022cf16c[] */

extern Entry data_ov002_022cf08c[2];

int func_ov002_02207d28(void *p)
{
    u16 v = *(u16 *)((char *)p + 2);
    unsigned int bit = (unsigned)(v << 31) >> 31;
    int i = bit & 1;
    int j = (1 - bit) & 1;
    if (data_ov002_022cf08c[i].f0 + 0x1b58 <= data_ov002_022cf08c[j].f0)
        return 1;
    return 0;
}
