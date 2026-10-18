struct slot { unsigned int id : 13; };
struct hdr { unsigned short pad; unsigned short side : 1; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf26c[];
extern int func_ov002_0220e75c(void *a, int b);

int func_ov002_0222c524(struct hdr *p, int q) {
    int off = (p->side & 1) * 0x868;
    if (*(unsigned short *)(data_ov002_022cf26c + off) == 0) {
        return 0;
    }
    if (((struct slot *)(data_ov002_022cf16c + off + 0xf8))->id != 0x175e) {
        return 0;
    }
    return func_ov002_0220e75c(p, q);
}
