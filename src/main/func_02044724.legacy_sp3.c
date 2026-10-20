extern void func_0209448c(int unused0, int unused1, int unused2);

typedef struct {
    unsigned char padding[0xe7];
    unsigned char flag;
    unsigned char tail[0x18];
} Entry;

void func_02044724(Entry *base, int index) {
    func_0209448c(0, (int)&base[index], 0x100);
    base[index].flag = 0xff;
}
