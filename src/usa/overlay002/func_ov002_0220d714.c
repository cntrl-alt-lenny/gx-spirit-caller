/* func_ov002_0220d714 -- two global guards then guarded call */

typedef struct Entity {
    unsigned short field0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 6;
    unsigned short   : 4;
} Entity;

extern int data_ov002_022d008c[];
extern int func_ov002_021bb870(int a, int x);

int func_ov002_0220d714(Entity *p)
{
    if (data_ov002_022d008c[0xcec / 4] != (int)p->a)
        return 0;
    if (data_ov002_022d008c[0xcf8 / 4] != 5)
        return 0;
    return func_ov002_021bb870(p->a, 0x1aa7) > 0 ? 1 : 0;
}
