typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u32 data_0219ef1c;
extern void (*data_0219ef0c)(void *);
extern int func_02073dcc(int address);
extern int func_02073f84(int a0, int a1);
extern void func_0207352c(void *address, unsigned int ip, int create);
extern u8 *func_020713ac(u8 *packet, int *complete);
extern void func_020716bc(unsigned short *header, unsigned short *packet, unsigned int size);
typedef struct { u8 pad[12]; u16 h0c, h0e, h10, h12; } Hdr;
extern void func_020726e0(Hdr *h, unsigned char *p, int len);
extern void func_020718d8(unsigned short *header, unsigned short *packet, int size);
typedef struct { u8 versionhl; u8 tos; u16 total; u8 pad[5]; u8 type; u16 checksum; u16 src[2], dst[2]; } Packet;
static inline u16 swap16(int x) { return (x >> 8) | (x << 8); }

void func_020711b0(u8 *packet, u32 len)
{
    int complete;
    u8 *p;
    u32 src, dst;
    int size, type;
    u8 *payload;
    u32 hl;
    u16 total;

    src = (swap16(*(u16 *)(packet + 12)) << 16) | swap16(*(u16 *)(packet + 14));
    dst = (swap16(*(u16 *)(packet + 16)) << 16) | swap16(*(u16 *)(packet + 18));
    if (dst != src) {
        if (!func_02073dcc(dst)) return;
        if (len < swap16(*(u16 *)(packet + 2))) return;
        if (func_02073f84((int)packet, (packet[0] & 15) * 4) != 0xffff) return;
        dst = (swap16(*(u16 *)(packet + 16)) << 16) | swap16(*(u16 *)(packet + 18));
        if (data_0219ef1c == dst) {
            src = (swap16(*(u16 *)(packet + 12)) << 16) | swap16(*(u16 *)(packet + 14));
            func_0207352c(packet - 8, src, 1);
        }
    }
    p = func_020713ac(packet, &complete);
    if (!p) return;
    hl = (((Packet *)p)->versionhl & 15) * 4;
    total = swap16(((Packet *)p)->total);
    type = ((Packet *)p)->type;
    payload = p + hl;
    size = total - hl;
    if (type == 0x11) {
        func_020716bc((u16 *)p, (u16 *)payload, size);
    } else if (data_0219ef1c) {
        if (type == 1) func_020726e0((Hdr *)p, payload, size);
        else if (type == 6) func_020718d8((u16 *)p, (u16 *)payload, size);
    }
    if (complete) data_0219ef0c(p - 14);
}








