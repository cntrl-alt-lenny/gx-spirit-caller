struct State {
    unsigned int player:1;
    unsigned int pad0:4;
    unsigned int enabled:1;
    unsigned int mode:2;
    unsigned int card:15;
    unsigned int index:9;
    unsigned short pad4;
    unsigned short value;
    unsigned char count;
    unsigned char pad9[13];
    unsigned short active:1;
    unsigned short flag1:1;
    unsigned short present:1;
    unsigned short flag3:1;
    unsigned short extra:2;
    unsigned short pad22:10;
    unsigned int a:8;
    unsigned int b:8;
    unsigned int c:8;
    unsigned int d:8;
};
struct Entry { unsigned short card:13; unsigned short rest:3; unsigned short other; };
extern struct State data_ov002_022cd300;
extern struct Entry data_ov002_022d0250[];
extern int func_ov002_021bb068(int id);
void func_ov002_022718f4(int player, int index, int mode, int count) {
    data_ov002_022cd300.player = player;
    data_ov002_022cd300.card = data_ov002_022d0250[index].card;
    data_ov002_022cd300.index = index;
    data_ov002_022cd300.value = 0;
    data_ov002_022cd300.present = (unsigned short)(count > 0);
    data_ov002_022cd300.extra = (unsigned short)(count > 1 ? count - 1 : 0);
    data_ov002_022cd300.enabled = 1;
    data_ov002_022cd300.mode = 2;
    data_ov002_022cd300.flag1 = 0;
    data_ov002_022cd300.flag3 = 0;
    switch(mode) {
    case 0:
        data_ov002_022cd300.mode = 1;
        data_ov002_022cd300.enabled = func_ov002_021bb068(0x135d) > 0;
        break;
    case 1:
        data_ov002_022cd300.mode = 0;
        break;
    case 2:
        data_ov002_022cd300.flag1 = 1;
        break;
    }
    data_ov002_022cd300.active = 1;
    data_ov002_022cd300.count = 0;
    data_ov002_022cd300.a = 0;
    data_ov002_022cd300.b = 0;
    data_ov002_022cd300.c = 0;
    data_ov002_022cd300.d = 0;
}
