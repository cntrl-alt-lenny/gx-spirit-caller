typedef struct { char pad[0x30]; int step; char gap[0xb7c]; int active, timer; } Duel;
typedef struct { char pad[0xd4]; int flag, other, timer; } State;
extern Duel data_021040ac;
extern State data_ov002_022d0f2c;
extern struct { char pad[0x3c]; int state; } data_ov002_022d1af8;
extern struct { int a, player; } data_ov002_022cd73c;
extern struct { char pad[0xd48]; int active; } data_ov002_022d016c;
extern int data_ov002_022d11bc[];
extern char data_ov002_022d1410[];
extern int func_ov002_022a1870(int *p);
extern void func_ov002_0229f788(void *self);
extern int func_ov002_021ca6f8(int idx);
extern void func_ov002_02259834(void);
extern void func_ov002_022a82c4(void *obj);
extern void func_ov002_021b01f4(int arg0);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_ov002_021b0184(void);
static inline long is_negative(void) { return data_ov002_022d1af8.state < 0; }
void func_ov002_0229a49c(void) {
    int step = data_021040ac.step + 1;
    if (data_021040ac.active == 0) return;
    if (is_negative() != 0) {
        if (func_ov002_022a1870(data_ov002_022d11bc) != 0) {
            if (data_ov002_022d0f2c.timer > 0) {
                data_ov002_022d0f2c.timer -= step;
                if (data_ov002_022d0f2c.timer <= 0) {
                    func_ov002_0229f788(data_ov002_022d11bc);
                    data_ov002_022d0f2c.flag = data_ov002_022d0f2c.flag < 1 ? 1 : data_ov002_022d0f2c.flag;
                    data_ov002_022d0f2c.timer = 0;
                }
            }
        }
        return;
    }
    if (func_ov002_021ca6f8(data_ov002_022cd73c.player) != 0 && data_ov002_022d0f2c.timer > 0) {
        data_ov002_022d0f2c.timer -= step;
        if (data_ov002_022d0f2c.timer <= 0) {
            if (data_ov002_022d016c.active != 0) func_ov002_02259834();
            if (func_ov002_022a1870(data_ov002_022d11bc) != 0) func_ov002_0229f788(data_ov002_022d11bc);
            func_ov002_022a82c4(data_ov002_022d1410);
            data_ov002_022d0f2c.flag = data_ov002_022d0f2c.flag < 1 ? 1 : data_ov002_022d0f2c.flag;
            func_ov002_021b01f4(data_ov002_022cd73c.player);
            data_ov002_022d0f2c.timer = 0;
        }
        if (data_ov002_022d0f2c.timer < 1260 && data_ov002_022d0f2c.timer / 60 != (data_ov002_022d0f2c.timer + step) / 60)
            func_02037208(142, -1, 0, 1);
    }
    if (data_021040ac.timer > 1) {
        data_021040ac.timer -= step;
        if (data_021040ac.timer <= 1) {
            data_021040ac.timer = 1;
            data_ov002_022d0f2c.flag = data_ov002_022d0f2c.flag < 1 ? 1 : data_ov002_022d0f2c.flag;
            func_ov002_021b0184();
        }
    }
}











