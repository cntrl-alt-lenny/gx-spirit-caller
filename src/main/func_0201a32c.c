struct Counters {
    unsigned int lo : 16;
    unsigned int mid : 8;
    unsigned int hi : 8;
};

extern char *GetSystemWork(void);

void func_0201a32c(int n) {
    char *w = GetSystemWork();
    unsigned int v;

    v = ((struct Counters *)(w + 0x8e4))->hi + n;
    if (v > 255) {
        ((struct Counters *)(w + 0x8e4))->hi = 255;
    } else {
        ((struct Counters *)(w + 0x8e4))->hi = v;
    }

    if (n >= 10) {
        n = 15;
    }
    v = ((struct Counters *)(w + 0x8e4))->mid + n;
    if (v > 255) {
        ((struct Counters *)(w + 0x8e4))->mid = 255;
    } else {
        ((struct Counters *)(w + 0x8e4))->mid = v;
    }
}
