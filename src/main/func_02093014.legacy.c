extern unsigned int data_021a6638;
extern unsigned int data_021a6630;
extern void func_02092e90(void);
struct HandlerArea {
    unsigned char padding[0xfdc];
    void (*handler)(void);
};
void func_02093014(void) {
    struct HandlerArea *area = (struct HandlerArea *)0x027e3000;
    unsigned int handler = *(unsigned int *)0x027ffd9c;
    if (handler >= 0x02600000 && handler < 0x02800000) {
        data_021a6638 = handler;
    } else {
        data_021a6638 = 0;
    }
    if (data_021a6638 == 0) {
        *(void (**)(void))0x027ffd9c = func_02092e90;
        area->handler = func_02092e90;
    }
    data_021a6630 = 0;
}


