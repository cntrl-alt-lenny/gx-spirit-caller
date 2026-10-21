typedef struct { unsigned int tag; unsigned short param; } Packed;
typedef struct { char pad[0x1a]; unsigned short mode, value; unsigned int a, b; char tail[0xc]; } Entry;
typedef struct { unsigned int unused; unsigned int index:3; unsigned int rest:29; } State;
extern State data_02104f4c;
extern char data_ov008_021b2c80[];
typedef struct { int pad; unsigned short index:8; unsigned short rest:8; } Selection;
extern Selection data_ov008_021b2dc0;
extern char data_ov008_021b2780[];
extern int func_020b3870(int, int);
extern int func_02005dac(int, int);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern void func_ov008_021ac5d0(int x,int y,int mode);
extern void func_ov008_021ac658(int x,int y,int value);
extern void func_ov008_021ac718(int x,int y,int value,int variant);
extern unsigned int func_ov008_021aa4a0(unsigned int x);
/* This caller supplies an additional scale argument beyond the C definition. */
extern int func_0207fd28(void *p, ...);
void func_ov008_021ac7f0(void) {
    int x, i, step, n;
    Packed p;
    n = *(unsigned short *)(data_ov008_021b2c80 + 0x5a);
    if ((unsigned int)n > 6) n = 6;
    x = func_020b3870(240,n * 2);
    i=0;
    if (n > 0) {
    step = x * 2;
    do {
        int tile = (int)data_ov008_021b2dc0.index % 8 + i;
        int variant, count;
        if (tile > 7) tile -= 8;
        p.param = (tile * 16 + 0x293) | 0x400;
        p.tag = (((unsigned int)(x-8) << 23) >> 7) | 0xc000a024;
        func_020944a4((int)&p, func_02005dac(2,0),8);
        if (((Entry *)data_ov008_021b2780)[data_ov008_021b2dc0.index+i].value == 0) {
            p.tag = (((unsigned int)(x-8) << 23) >> 7) | 0xc000a824;
            p.param = 0x693;
            func_020944a4((int)&p,func_02005dac(2,0),8);
        }
        func_ov008_021ac5d0(x-8,21,((Entry *)data_ov008_021b2780)[data_ov008_021b2dc0.index+i].mode);
        {
            unsigned int value = ((Entry *)data_ov008_021b2780)[data_ov008_021b2dc0.index+i].value;
            if (value > 15) variant = 0;
            else if (value != 0) variant = 1;
            else variant = 2;
            func_ov008_021ac718(x-7,104,value,variant);
        }
        count = func_ov008_021aa4a0(((Entry *)data_ov008_021b2780)[data_ov008_021b2dc0.index+i].a);
        count += func_ov008_021aa4a0(((Entry *)data_ov008_021b2780)[data_ov008_021b2dc0.index+i].b);
        if (count > 0) func_ov008_021ac658(x+14,90,count);
        x += step;
        i++;
    } while(i<n);
    }
    {
        int idx = data_02104f4c.index;
        void **items;
        if (idx != 0) idx--;


        for (i=0;i<2;i++) func_0207fd28(((void **)data_ov008_021b2780)[idx*2+i+0x171], 0x1000);
    }
}



