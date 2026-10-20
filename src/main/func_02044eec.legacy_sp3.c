typedef struct {
    unsigned long long a;
    unsigned long long b;
    unsigned short info;
    unsigned short counter;
} Record;
extern void func_02044610(Record *rec);
extern void func_0209bcdc(void);
extern int func_0209bc20(void *a0);
extern int func_0209bb60(void *a0);
extern long long func_0209bea0(void *date, void *time);
extern unsigned int func_020931e8(void);
extern unsigned long long func_020930b0(void);
extern void func_02093a20(unsigned char *out);
extern unsigned long long func_020450d0(unsigned int, unsigned int, unsigned int, unsigned int);
int func_02044eec(Record *rec) {
    int date[4];
    int time[4];
    unsigned char mac[8];
    long long seconds;
    int seed;
    unsigned int multiplier;
    unsigned int addend;
    int address;
    unsigned int prefix;
    unsigned char flag;
    func_02044610(rec);
    func_0209bcdc();
    if (func_0209bc20(date) != 0) return 0;
    if (func_0209bb60(time) != 0) return 0;
    seconds = func_0209bea0(date, time);
    if (seconds < 0) return 0;
    if (func_020931e8() != 0) seconds += (unsigned int)func_020930b0;
    multiplier = 0x5d588b65;
    addend = 0x269ec3;
    func_02093a20(mac);
    seed = (unsigned int)seconds;
    flag = ((mac[0] << 16) | (mac[1] << 8) | mac[2]) != 0x9bf;
    address = (mac[3] << 16) | (mac[4] << 8) | mac[5];
    seed = seed * multiplier + addend;
    rec->info = (((unsigned int)seed >> 16) * 1000) >> 16;
    rec->a = 0;
    if (rec->counter == 0) {
        rec->b = 0;
        while (rec->b == 0) {
            seed = seed * multiplier + addend;
            while (seed == 0) seed = seed * multiplier + addend;
            rec->counter = seed;
            rec->b = func_020450d0(rec->counter, address, flag, 0);
        }
    } else {
        rec->b = 0;
        while (rec->b == 0) {
            rec->counter++;
            rec->b = func_020450d0(rec->counter, address, flag, 0);
        }
    }
    return 1;
}








