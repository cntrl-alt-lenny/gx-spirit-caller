typedef struct Handler {
    int f0;
    int f4;
    int (*fn)(int, int, int);
} Handler;

typedef struct Slot {
    char pad[0x14];
} Slot;

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern Handler *func_ov002_02257464(void);

int func_ov002_02257ab8(int a, int b)
{
    int count = 0;
    Handler *h;
    int i;
    h = func_ov002_02257464();
    *(int *)(data_ov002_022ce288 + 0x5c0) = 0;
    i = 0;
    if (h != 0 && h->fn != 0) {
        Slot *s = (Slot *)(data_ov002_022cf16c + (b & 1) * 0x868);
        for (; i <= 10; i++, s++) {
            if (((*(unsigned int *)((char *)s + 0x40) >> 2) & 1) == 0) {
                if (h->fn(a, b, i) != 0) count++;
            }
        }
    }
    return count;
}
