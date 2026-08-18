/* func_0207113c: packet dispatch loop (never returns) -- poll for the
 * next packet + its length; when long enough, byteswap its ethertype
 * field and route IPv4 (0x800) to func_020711b0, ARP (0x806) to
 * func_02072a14, both passed the payload past the 0xe-byte header. */

extern void *func_0207397c(int *out_len);
extern void func_020711b0(void *payload, int len);
extern void func_02072a14(void *payload, int len);
extern void func_0207391c(void);

void func_0207113c(void) {
    unsigned int len[1];
    void *pkt;
    int raw;
    int ethertype;

    for (;;) {
        pkt = func_0207397c((int *)len);
        if (len[0] > 0x22) {
            raw = *(unsigned short *)((unsigned char *)pkt + 0xc);
            ethertype = (unsigned short)((raw >> 8) | (raw << 8));
            switch (ethertype) {
            case 0x800:
                func_020711b0((unsigned char *)pkt + 0xe, len[0] - 0xe);
                break;
            case 0x806:
                func_02072a14((unsigned char *)pkt + 0xe, len[0] - 0xe);
                break;
            }
        }
        func_0207391c();
    }
}
