typedef unsigned short u16;

typedef struct {
    u16 f0;
    u16 kind : 4;
    u16 rest : 12;
    u16 f4;
    u16 next;
} Entry021b212c;

extern Entry021b212c data_ov002_022d0570[];
extern void func_ov002_021b1ca4(int idx, int val, Entry021b212c *e);

void func_ov002_021b204c(int idx, int val, int flag) {
    while (idx != 0) {
        Entry021b212c *e = &data_ov002_022d0570[idx];
        int next = e->next;
        if (e->kind < 6 && e->f0 == val) {
            func_ov002_021b1ca4(idx, e->f0, e);
            if (!flag) return;
        }
        idx = next;
    }
}
