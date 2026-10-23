typedef unsigned short u16;
typedef struct { u16 flags, slot; short delta; u16 kind; unsigned char pad[0x804]; int active, state; } State;
extern State data_ov002_022ce950;
extern unsigned char data_ov002_022cf1a8[], data_ov002_022cf16c[];
extern int data_ov002_022cd73c[];
extern int func_020310d8(int x);
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_ov002_021b0c04(int self, int arg1);
extern void func_ov002_021b1f20(int a0, int a1, int a2, int a3, int a4);
extern int func_ov002_021b3e5c(int arg0, int arg1, int a2, int a3);
extern void func_ov002_021b212c(int idx, int val, int flag);
extern int func_ov002_0229ade0(int a, ...);
extern int func_ov002_0229c7f8(int arg);
void func_ov002_021cd79c(void) {
    int f = (data_ov002_022ce950.flags & 0x8000) ? 1 : 0;
    int t = data_ov002_022ce950.slot;
    int v = data_ov002_022ce950.delta;
    int u = data_ov002_022ce950.kind;
    int i;
    int id = func_ov002_021b9ecc(f, t);
    switch (data_ov002_022ce950.state) {
    case 0:
        if (id) {
            if (u == 0) {
                int max = func_020310d8(id);
                int *p = (int *)(data_ov002_022cf1a8 + (f & 1) * 0x868 + t * 0x14);
                int old = *p;
                int n = old + v;
                if (n >= max) n = max;
                if (n <= 0) n = 0;
                *p = n;
                if (f == data_ov002_022cd73c[1]) {
                    if (v < 0) func_ov002_021b0c04(0x2f, old - n);
                    else func_ov002_021b0c04(0x2e, n - old);
                }
            } else if (u == 1) {
                int *p = (int *)(data_ov002_022cf1a8 + (f & 1) * 0x868 + t * 0x14);
                int n = *p + v;
                if (n <= 0) n = 0;
                *p = n;
            } else if (v > 0) {

                for (i = 0; i < v; i++) func_ov002_021b1f20(f, t, 3, u, 0);
            } else {
                int n = func_ov002_021b3e5c(f, t, u, 3);

                n = n < -v ? n : -v;
                for (i = 0; i < n; i++) {
                    func_ov002_021b212c(*(u16 *)(data_ov002_022cf16c + (f & 1) * 0x868 + t * 0x14 + 0x3a), (u16)u, 0);
                }
            }
            func_ov002_0229ade0(0x25, (u16)((unsigned char)f | ((unsigned char)t << 8)), v, u);
        }
        data_ov002_022ce950.state++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x25)) return;
        func_ov002_0229ade0(0x24, 0, 0, 0);
        data_ov002_022ce950.active = 0;
        break;
    }
}


