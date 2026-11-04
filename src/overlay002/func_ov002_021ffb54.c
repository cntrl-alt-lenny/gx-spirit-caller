typedef struct {
    unsigned short field_00;
    unsigned short player : 1;
    unsigned short pad : 5;
    unsigned short kind : 6;
    unsigned short rest : 4;
} obj_021ffb54_t;

typedef struct {
    unsigned int word0;
    unsigned char pad[0x864];
} ent_021ffb54_t;

extern ent_021ffb54_t data_ov002_022cf288[];
extern int func_ov002_021ff2b8(obj_021ffb54_t *p, int idx);
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_021ca3f0(int a, int b);

int func_ov002_021ffb54(obj_021ffb54_t *p) {
    int need = 0;
    int id;

    if (p->field_00 != 0x12d2) {
        if (p->field_00 == 0x1710) {
            id = 0x1730;
            need = 2;
        }
    } else {
        id = 0x14f9;
        need = 4;
    }

    if (p->kind != 0x23) {
        if ((data_ov002_022cf288[p->player & 1].word0 >> 16) & 1) {
            return 0;
        }
    }

    if (func_ov002_021ff2b8(p, p->player) < need) {
        return 0;
    }
    if (func_ov002_021ca2b8(p->player) == 0) {
        return 0;
    }
    return func_ov002_021ca3f0(p->player, id) != 0;
}
