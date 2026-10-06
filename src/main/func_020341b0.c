typedef struct {
    unsigned short tag;
    unsigned short _2;
    unsigned short len;
} chunk_020341b0_t;

extern int func_02032350(unsigned short id);
extern void func_0203251c(int h, int ctx, chunk_020341b0_t *c, unsigned short size);

void func_020341b0(int ctx, unsigned char *buf, unsigned int size) {
    unsigned int off;
    chunk_020341b0_t *c;
    unsigned short id;

    for (off = 0; off + 8 < size; off += ((c->len + 3) & ~3) + 8) {
        c = (chunk_020341b0_t *)(buf + off);
        id = c->tag & 0x7ff;
        if (id != 0) {
            func_0203251c(func_02032350(id), ctx, c, ((c->len + 3) & ~3) + 8);
        }
    }
}
