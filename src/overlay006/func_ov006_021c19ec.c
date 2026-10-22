extern int func_020215d8(void *p);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202224c(int idx);
extern int func_02023188(void);
extern int func_ov006_021c1cc0(char *obj);
extern int func_ov006_021c1d74(char *obj);
extern int func_ov006_021c2280(char *obj);
extern int func_ov006_021c2510(char *obj);
extern int func_ov006_021c4518(int this_, int flag);
extern int func_ov006_021c480c(char *self);
extern int data_ov006_0225cb7c[];
typedef struct { int a, b, c, d; } Record;
extern struct { char pad[0x9c]; Record records[2]; } data_ov006_0225cbb8;
extern struct { char pad[0x10]; Record records[2]; } data_ov006_0225cb88;
#define F(x) (*(int *)(obj + (x)))
int func_ov006_021c19ec(char *obj) {
    int flags = func_0202224c(0);
    int i;
    switch (F(0x44)) {
    case 0:
        if (F(0x48) == 3) {
            if (F(0x70)) {
                flags |= 0x10;
                func_ov006_021c2280(obj);
                F(0x70) = 0;
                F(0x44) = 3;
                F(0x48) = 0;
            } else {
                func_ov006_021c1cc0(obj);
                F(0x44) = 1;
                F(0x48) = 0;
            }
        }
        break;
    case 1:
        if (F(0x48) == 3) func_ov006_021c4518((int)obj, 1);
        else if (F(0x48) == 30) {
            F(0x68) = 1;
            func_ov006_021c480c(obj);
        }
        if (func_ov006_021c1d74(obj)) {
            if (F(0x6c)) {
                F(0x44) = 2; F(0x48) = 0; flags |= 0x10;
            } else {
                F(0x44) = 5; F(0x48) = 0; flags |= 1;
            }
        }
        break;
    case 2:
        if (F(0x48) == 10) {
            func_ov006_021c2280(obj);
            F(0x44) = 3; F(0x48) = 0;
        }
        break;
    case 3:
        if (F(0x48) == 3) func_ov006_021c4518((int)obj, 1);
        else if (F(0x48) == 10) F(0x68) = 1;
        if (func_ov006_021c2510(obj)) {
            func_02023188();
            if (F(0x74)) {
                flags |= 1;
                data_ov006_0225cb7c[3] = data_ov006_0225cb7c[37];
                data_ov006_0225cb7c[6] = data_ov006_0225cb7c[40];
                data_ov006_0225cb7c[4] = data_ov006_0225cb7c[38];
                data_ov006_0225cb7c[5] = data_ov006_0225cb7c[39];
                flags |= 1;
                for (i = 0; i < 2; i++) {
                    data_ov006_0225cb88.records[i].a = data_ov006_0225cbb8.records[i].a;
                    data_ov006_0225cb88.records[i].b = data_ov006_0225cbb8.records[i].b;
                    data_ov006_0225cb88.records[i].c = data_ov006_0225cbb8.records[i].c;
                    data_ov006_0225cb88.records[i].d = data_ov006_0225cbb8.records[i].d;
                }
                F(0x44) = 5; F(0x48) = 0;
            } else {
                F(0x44) = 4; F(0x48) = 0; flags |= 0x20;
            }
        }
        break;
    case 4:
        if (F(0x48) == 8) func_ov006_021c4518((int)obj, 0);
        else if (F(0x48) >= 10) {
            func_ov006_021c1cc0(obj);
            F(0x44) = 1; F(0x48) = 0;
        }
        break;
    case 5:
        if (F(0x48) == 12) func_ov006_021c4518((int)obj, 0);
        if (!func_020215d8(*(void **)(obj + 8))) {
            F(8) = 0; F(0x44) = 6; F(0x48) = 0;
        }
        break;
    case 6: return 1;
    }
    func_02022234(0, flags);
    F(0x48)++;
    return 0;
}

