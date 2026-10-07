typedef struct {
    char pad[0x24];
    unsigned int f24;
    unsigned int f28;
    char pad2[0x1c];
} Info_02006e28;

typedef struct {
    char pad[0x1c];
    int f1c;
} State_02006e28;

extern char data_020c3f44[];
extern State_02006e28 data_02104f1c;
extern char *func_02006b4c(Info_02006e28 *info, int a, char *name);
extern int func_02007104(char *s, char *t);
extern unsigned int func_0207d3ac(int a, unsigned int b);
extern void func_02038ad4(Info_02006e28 *info, unsigned int *dst, int n);
extern void func_020928e8(unsigned int *p, int n);
extern void func_02097ff0(Info_02006e28 *info);

int func_02006e28(int a, unsigned int b) {
    Info_02006e28 info;
    char name[0x100];
    unsigned int hdr;
    char *r;
    int found;
    unsigned int res;

    r = func_02006b4c(&info, a, name);
    if (r == 0) {
        return 0;
    }
    found = func_02007104(r, data_020c3f44) != -1;
    res = func_0207d3ac(data_02104f1c.f1c, b);
    if (found) {
        func_02038ad4(&info, &hdr, 4);
        func_020928e8(&hdr, 4);
        res = res >= (hdr >> 8);
    } else {
        res = (info.f28 - info.f24) <= res;
    }
    func_02097ff0(&info);
    return res;
}
