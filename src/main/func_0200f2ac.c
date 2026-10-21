typedef struct {
    unsigned int on:1, b1:1, b2:1, b3:1, b4:1, flag:1, b6:1, rest:25;
    struct { unsigned int quotient:10, value:10, rest:12; } values[13];
} Entry;
typedef struct { unsigned short width, height; } Cell;
typedef struct { char pad[12]; Cell **cells; } Group;
typedef struct { unsigned int count; Group **groups; } Data;
typedef struct { char pad[0x90]; Data *data; Entry *entries; } Obj;
extern int func_020b3870(int numerator, int denominator);
int func_0200f2ac(Obj *o, unsigned int mode, int val, int flag) {
    if (o != 0 && o->data != 0) {
        unsigned int i;
        unsigned int count = o->data->count;
        for (i = 0; i < count; i++) {
            int j;
            Entry *e = &o->entries[i];
            e->on = 1;
            if (flag >= 0) e->flag = flag;
            switch (mode) {
            case 0: val = 0;
            case 6: {

                for (j = 0; j < 13; j++) {
                    Cell *c = o->data->groups[i]->cells[j];
                    int height = c->height;
                    int width = c->width;

                    if (height > 0 && val < height * width) {
                        e->values[j].value = val;
                        e->values[j].quotient = func_020b3870(val, height);
                    } else {
                        e->values[j].value = 0;
                        e->values[j].quotient = 0;
                    }
                }
            }
            case 5:
                e->b1 = 0; e->b2 = 0; e->b3 = 0; e->b4 = 0; break;
            case 7: e->b6 = 0; break;
            case 1: e->b1 = 1; e->b2 = 0; e->b4 = 0; break;
            case 2: e->b2 = 1; e->b1 = 0; e->b3 = 0; break;
            case 3: e->b3 = 1; e->b2 = 0; break;
            case 4: e->b4 = 1; e->b1 = 0; break;
            }
        }
        return 1;
    }
    return 0;
}




