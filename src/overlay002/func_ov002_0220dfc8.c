/* func_ov002_0220dfc8: gate on data_ov002_022ce288.f484+1 >= 4; ptr+2 packs
 * a 5-bit "k" (bits 1..5) and a 2-bit field at bits 12..13. For k in
 * [5,10], return whether that 2-bit field is 0. For k<5, true. Otherwise
 * (k>10), defer to func_0202e234(ptr->id). First argument is unused. */
struct S0220dfc8 {
    unsigned short _pad0 : 1;
    unsigned short k : 5;
    unsigned short _pad1 : 6;
    unsigned short f12 : 2;
    unsigned short _pad2 : 2;
};

typedef struct {
    char _pad[0x484];
    int f484;
} S0220dfc8Ce288;

extern S0220dfc8Ce288 data_ov002_022ce288;
extern int func_0202e234(unsigned short id);

int func_ov002_0220dfc8(int unused, void *ptr) {
    struct S0220dfc8 *s;

    (void)unused;

    if (data_ov002_022ce288.f484 + 1 < 4)
        return 0;

    s = (struct S0220dfc8 *)((char *)ptr + 2);

    if (s->k >= 5 && s->k <= 10) {
        return s->f12 == 0;
    }

    if (s->k < 5 || func_0202e234(*(unsigned short *)ptr) != 0)
        return 1;

    return 0;
}
