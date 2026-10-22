typedef struct {
    unsigned long long a;
    unsigned long long b;
    unsigned short info;
    unsigned short counter;
} Record;
extern int func_02044eec(Record *rec);
extern void *func_02043a78(Record *rec);
extern void func_0209448c(int unused0, int unused1, int unused2);
extern void func_02094688(const void *src, void *dst, int n);

typedef struct { unsigned char pad[0xe7]; unsigned char flag; unsigned char tail[0x18]; } Entry;
int func_02044758(Entry *base) {
    Record rec;
    void *source;
    int i;
    func_0209448c(0, (int)base, 0x400);
    for (i = 0; i < 3; i++) {
        base[i].flag = 0xff;
    }
    func_02044eec(&rec);
    source = func_02043a78(&rec);
    for (i = 0; i < 2; i++) {
        func_02094688(source, (unsigned char *)base + 0xf0, 0xe);
        base++;
    }
    return 0;
}

