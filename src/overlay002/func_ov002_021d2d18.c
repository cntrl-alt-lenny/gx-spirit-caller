typedef unsigned short u16;
typedef struct { u16 f0, f2, f4, f6; char pad[0x804]; int active; } State;
extern State data_ov002_022ce950;
typedef struct { int raw; } Packed;
extern Packed data_ov002_022cdc88[];
extern int func_ov002_021b9b64(int unused0);
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
static inline int pack(u16 hi, u16 lo) { return lo | (hi << 16); }
void func_ov002_021d2d18(void) {
    int flag = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    int type = data_ov002_022ce950.f2;
    int slot = data_ov002_022ce950.f4;
    int id = data_ov002_022ce950.f6;
    data_ov002_022cdc88[slot] = *(Packed *)func_ov002_021b9b64(id);
    func_ov002_0229ade0(0x2b, flag, type, pack(slot, id));
    data_ov002_022ce950.active = 0;
}

