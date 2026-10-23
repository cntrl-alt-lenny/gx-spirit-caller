typedef struct { int f0, f4, f8; int pad[4]; int f1c; } State;
typedef struct { int f0, f4; int pad[8]; int f28; int tail[3]; } Entry;
extern State data_ov002_022cd3f4;
extern Entry data_ov002_022cd420[];
extern int func_ov002_021c93cc(int a, int b, int bit);
int func_ov002_0225a978(int id, int side) {
    int a = data_ov002_022cd3f4.f0;
    int b = data_ov002_022cd3f4.f4;
    int index = side ? 1-a : a;
    Entry *p = &data_ov002_022cd420[index];
    switch (id) {
    case 0x1184: return 1000 * (side && data_ov002_022cd3f4.f8 == 0 && func_ov002_021c93cc(p->f0,p->f4,6));
    case 0x1397: return 500 * (data_ov002_022cd3f4.f8 == 0 && func_ov002_021c93cc(p->f0,p->f4,2));
    case 0x1507: return 1000 * data_ov002_022cd3f4.f8;
    case 0x1952: return 500 * data_ov002_022cd3f4.f8;
    case 0x1508: return data_ov002_022cd3f4.f8 ? 0 : 1000;
    case 0x17ed: return 1000 * (data_ov002_022cd3f4.f8 == 0 && func_ov002_021c93cc(p->f0,p->f4,1));
    case 0x18f2: return (side ? 500 : -500) * (data_ov002_022cd3f4.f8 == 0 && a != b);
    case 0x1a7a: return 200 * (data_ov002_022cd3f4.f8 == 0 && a != b) * p->f28;
    case 0x1aef: return 500 * (side && a != b && p->f4 == 4-data_ov002_022cd3f4.f1c);
    case 0x10c6: return !side && func_ov002_021c93cc(p->f0,p->f4,1);
    case 0x1621: return !side && a != b;
    default: return -1;
    }
}
