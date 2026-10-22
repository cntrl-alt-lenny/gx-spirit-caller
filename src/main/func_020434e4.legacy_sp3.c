#include <nitro/types.h>
extern int func_020aaddc(const char *s);
extern char *func_020aadf8(char *dst, const char *src);
extern int func_020aaf40(const u8 *a, const u8 *b);
extern int func_0209bc20(void *a0);
extern int func_0209bb60(void *a0);
extern long long func_0209bea0(void *date, void *time);
/* The original calls this atoi thunk with only r0, fewer than its C definition. */
extern int func_020ace00();
extern char data_020fec28[];
extern const u8 *data_020febf8[];
extern int data_021aa460;
extern long long data_0219da68;
extern int data_0219da64;
int func_020434e4(const char *s) {
    int date[4];
    int time[3];
    char buf[36];
    long long now, then;
    int i;
    if (!(func_020aaddc(s) != func_020aaddc(data_020fec28))) {
    if (!(s[7] != ' ')) {
    if (!(s[11] != ' ')) {
    if (!(s[16] != ' ')) {
    if (!(s[19] != ':')) {
    if (!(s[22] != ':')) {
    if (!(s[25] != ' ')) {
    if (!(func_0209bc20(date) != 0)) {
    if (!(func_0209bb60(time) != 0)) {
    now = func_0209bea0(date, time);
    if (!(now == -1)) {
    func_020aadf8(buf, s);
    buf[7] = 0;
    buf[11] = 0;
    buf[16] = 0;
    buf[19] = 0;
    buf[22] = 0;
    buf[25] = 0;
    data_021aa460 = 0;
    date[0] = func_020ace00(buf + 12);
    if (!(data_021aa460 == 34)) {
    date[0] -= 2000;
    date[1] = 13;
    for (i = 0; i < 12; i++) {
        if (func_020aaf40(data_020febf8[i], (const u8 *)(buf + 8)) == 0) {
            date[1] = i + 1;
            break;
        }
    }
    if (!((unsigned int)date[1] > 12)) {
    data_021aa460 = 0;
    date[2] = func_020ace00(buf + 5);
    if (!(data_021aa460 == 34)) {
    data_021aa460 = 0;
    time[0] = func_020ace00(buf + 17);
    if (!(data_021aa460 == 34)) {
    data_021aa460 = 0;
    time[1] = func_020ace00(buf + 20);
    if (!(data_021aa460 == 34)) {
    data_021aa460 = 0;
    time[2] = func_020ace00(buf + 23);
    if (!(data_021aa460 == 34)) {
    then = func_0209bea0(date, time);
    if (!(then == -1)) {
    data_0219da68 = now - then;
    data_0219da64 = 1;
    return 1;
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    }
    return 0;
}


