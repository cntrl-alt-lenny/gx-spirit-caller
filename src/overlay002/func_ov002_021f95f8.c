typedef unsigned short u16;
struct St {
    u16 f0;
    u16 low : 6;
    u16 kind : 6;
    u16 high : 4;
};
extern int func_ov002_021f9434(struct St *p, int arg1);
int func_ov002_021f95f8(struct St *p, int arg1) {
    switch (p->kind) {
    case 2:
    case 5:
        return func_ov002_021f9434(p, arg1);
    default:
        return 1;
    }
}
