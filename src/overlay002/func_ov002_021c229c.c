typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 flag : 1;
    u16 val : 5;
    u16 pad : 6;
    u16 mode : 2;
    u16 rest : 2;
    u32 w[5];
} Cfg;

extern void func_ov002_021c2084(Cfg *cfg, int a, int b, int c);

void func_ov002_021c229c(int a, int b, u16 c, int d, int e)
{
    Cfg cfg = {0};
    cfg.flag = 1 - a;
    cfg.id = c;
    cfg.val = (u16)d;
    cfg.mode = 0;
    func_ov002_021c2084(&cfg, a, b, e);
}
