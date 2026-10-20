typedef struct {
    unsigned int ip;
    unsigned char address[6];
    unsigned short tick;
} Entry;
extern unsigned int data_0219ef1c;
extern Entry data_0219ef90[8];
extern unsigned char data_0219ef9a[];
extern int func_02073ed8(unsigned int ip);
extern int func_02073e54(unsigned int arg);
extern unsigned long long func_020930b0(void);
extern void func_02094688(void *src, void *dst, int n);

void func_0207352c(void *address, unsigned int ip, int create) {
    unsigned short tick;
    unsigned int i;
    unsigned int chosen;
    unsigned short oldest;
    int age;
    unsigned int offset;
    if (ip == 0x7f000001) return;
    if (ip == data_0219ef1c) return;
    if (func_02073ed8(ip) == 0) return;
    if (func_02073e54(ip) != 0) return;
    tick = (unsigned short)(func_020930b0() >> 16);
    for (i = 0; i < 8; i++) {
        if (data_0219ef90[i].ip == ip) {
            *(unsigned short *)(data_0219ef9a + i * 12) = tick;
            func_02094688(address, data_0219ef90[i].address, 6);
            return;
        }
    }
    if (create == 0) return;
    oldest = 0;
    chosen = 0;
    for (i = 0; i < 8; i++) {
        if (data_0219ef90[i].ip == 0) {
            chosen = i;
            break;
        }
        age = tick - data_0219ef90[i].tick;
        if ((short)age > oldest) {
            chosen = i;
            oldest = age;
        }
    }
    offset = chosen * 12;
    *(unsigned int *)((unsigned char *)data_0219ef90 + offset) = ip;
    func_02094688(address, (unsigned char *)data_0219ef90 + offset + 4, 6);
    *(unsigned short *)(data_0219ef9a + offset) = tick;
}


