typedef struct {
    char pad0[0x1c];
    unsigned int pos;
    unsigned int dst;
    unsigned int f24;
    unsigned int dma;
} Cart;

typedef struct {
    int f0;
    unsigned int ctrl;
} Ctl;

extern Cart data_021a84c0;
extern Ctl data_021a8b00;
extern void func_02094864(unsigned int dmaNo, unsigned int src, unsigned int dest, unsigned int size);
extern void func_0209d150(unsigned int cmd, unsigned int arg);

void func_0209d0f8(void) {
    Cart *const c = &data_021a84c0;
    func_02094864(c->dma, 0x04100010, c->dst, 0x200);
    func_0209d150((c->pos >> 8) | 0xb7000000, c->pos << 24);
    *(volatile unsigned int *)0x040001a4 = data_021a8b00.ctrl;
}
