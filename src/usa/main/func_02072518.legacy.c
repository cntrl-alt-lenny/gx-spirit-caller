typedef struct sub {
    void *f0;
    char _pad4[0x8 - 4];
    unsigned char f8;
    char _pad9[0xa - 9];
    unsigned short fa;
    char _padc[0x18 - 0xc];
    unsigned short f18;
    char _pad1a[0x1c - 0x1a];
    unsigned int f1c;
} sub_t;

typedef struct node {
    char _pad0[0x68];
    struct node *next;
    char _pad6c[0xa4 - 0x6c];
    sub_t *fa4;
} node_t;

typedef struct {
    char _pad0[8];
    node_t *head;
} list_t;

extern list_t data_021a62f0;

sub_t *func_02072518(void *r0, void *r1) {
    sub_t *ip;
    node_t *cur;
    unsigned short r5, r4;
    unsigned int r2;

    cur = data_021a62f0.head;
    while (cur != 0) {
        ip = cur->fa4;
        if (ip == 0) {
            goto next;
        }
        if (ip->f0 == 0) {
            goto next;
        }
        if (ip->f8 != 1) {
            goto next;
        }

        r5 = *(unsigned short *)((char *)r1 + 2);
        r4 = ip->fa;
        if (r4 != (unsigned short)((r5 >> 8) | (r5 << 8))) {
            goto next;
        }

        r5 = ip->f18;
        if (r5 != 0) {
            r4 = *(unsigned short *)r1;
            if (r5 != (unsigned short)((r4 >> 8) | (r4 << 8))) {
                goto next;
            }
        }

        r2 = ip->f1c;
        if (r2 != 0) {
            unsigned short a = *(unsigned short *)((char *)r0 + 0xc);
            unsigned short b = *(unsigned short *)((char *)r0 + 0xe);
            unsigned int combined = ((unsigned int)(unsigned short)((a >> 8) | (a << 8)) << 16)
                                   | (unsigned short)((b >> 8) | (b << 8));
            if (r2 != combined) {
                goto next;
            }
        }

        return ip;
next:
        cur = cur->next;
    }

    return 0;
}
