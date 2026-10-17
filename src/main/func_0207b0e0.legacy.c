/* func_0207b0e0: pack a 5-field event and pass it to the callback stored at
 * data_021a088c + 0x227c, if one is registered. */
typedef struct {
    unsigned short a;
    unsigned short b;
    int c;
    int d;
    int e;
} Event;
typedef void (*EventCb)(Event *ev);
typedef struct {
    unsigned char _pad_00[0x227c];
    EventCb cb;
} Block;
extern Block *data_021a088c;

void func_0207b0e0(unsigned short a, unsigned short b, int c, int d, int e) {
    Event ev;
    if (data_021a088c->cb == 0) {
        return;
    }
    ev.a = a;
    ev.c = c;
    ev.d = d;
    ev.e = e;
    ev.b = b;
    data_021a088c->cb(&ev);
}
