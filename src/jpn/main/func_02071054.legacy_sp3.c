/* func_02071054: packet dispatch loop (never returns) -- poll for the
 * next packet + its length; when long enough, byteswap its ethertype
 * field and route IPv4 (0x800) to func_020710c8, ARP (0x806) to
 * func_0207292c, both passed the payload past the 0xe-byte header. */

extern void *func_02073894(int *out_len);
extern void func_020710c8(void *payload, int len);
extern void func_0207292c(void *payload, int len);
extern void func_02073834(void);

void func_02071054(void) {
    unsigned int len[1];
    void *pkt;
    int raw;
    int ethertype;

    for (;;) {
        pkt = func_02073894((int *)len);
        if (len[0] > 0x22) {
            raw = *(unsigned short *)((unsigned char *)pkt + 0xc);
            ethertype = (unsigned short)((raw >> 8) | (raw << 8));
            switch (ethertype) {
            case 0x800:
                func_020710c8((unsigned char *)pkt + 0xe, len[0] - 0xe);
                break;
            case 0x806:
                func_0207292c((unsigned char *)pkt + 0xe, len[0] - 0xe);
                break;
            }
        }
        func_02073834();
    }
}
