extern unsigned short func_02019034(void);
extern unsigned int func_02019124(void);
extern int func_02013998(int x);
extern void func_02009f50(void);
extern int func_02009a68(int n);
extern void func_02009ab0(int n);
extern void func_ov008_021aa5f0(void);
extern unsigned char data_02104f4c[];
typedef struct { char pad[0xc8]; unsigned short mode; } Mode; extern Mode data_0210594c;
typedef struct { char pad[0x848]; int old, now; } Times; extern Times data_02105f4c;
typedef struct { char pad[0x5c]; unsigned short flags; } Flags; extern Flags data_0210674c;
typedef struct { char pad[0xc]; int bits; char pad10[0x554]; int flag; } State; extern State data_ov008_021b2780;
extern unsigned char data_ov008_021b2790[];
typedef struct { char pad[0x5a]; unsigned short count; } Counts; extern Counts data_ov008_021b2c80;
typedef struct {
    unsigned short id;
    char pad2[6];
    unsigned short value, a, b;
    char pade[10];
    int c,d,e,f,g;
    char pad2c[8];
} Entry;
void func_ov008_021aa6a4(void) {
    Entry *out = (Entry *)data_ov008_021b2790;
    int i;
    int now;
    int old;
    int count = 0;
    unsigned char *p;
    old = func_02019034();
    now = func_02019124();
    if (func_02013998(now) >= 8 && !(data_0210674c.flags & 0x8000)) {
        func_02009f50();
        (data_0210674c.flags)++;
        data_0210674c.flags |= 0x8000;
    }
    if (func_02013998(now) >= 11 && !(data_0210674c.flags & 0x4000)) {
        func_02009f50();
        (data_0210674c.flags)++;
        data_0210674c.flags |= 0x4000;
    }
    for (i=0, p=data_02104f4c; i<26; p+=0x1c,i++) {
        func_02009a68(i+1);
        if (data_ov008_021b2780.bits & (1<<i)) {
            out->id=i+1;
            out->value=150;
            if (((*(unsigned int *)(data_02104f4c+0xa64) & 0x1f00000)>>20)==10) {
                int dec=0;
                switch (data_0210594c.mode) {
                case 0: dec=4; break;
                case 1: dec=9; break;
                case 2: dec=15; break;
                }
                out->value=out->value*(100-dec)/100;
            }
            out->b=(p+0x1000)[0x56d];
            out->a=(p+0x1000)[0x56c];
            out->c=*(int *)(p+0x1570);
            out->d=*(int *)(p+0x1574);
            out->e=*(int *)(p+0x1578);
            out->f=*(int *)(p+0x157c);
            out->g=(p+0x1000)[0x56f];
            count++;
            if (out->b!=0) data_ov008_021b2780.flag=1;
            out++;
        }
    }
    if (old != data_02105f4c.old) {
        unsigned char *q;
        Entry *out2;
        out2=(Entry *)data_ov008_021b2790;
        q=data_02104f4c;
        int j;
        for(j=0;j<26;j++,q+=0x1c) {
            if (data_ov008_021b2780.bits&(1<<j)) {
                func_02009ab0(j+1);
                out2->c=*(int *)(q+0x1570);
                out2->d=*(int *)(q+0x1574);
                out2->e=*(int *)(q+0x1578);
                out2->f=*(int *)(q+0x157c);
                out2++;
            }
        }
    }
    data_ov008_021b2c80.count=count;
    func_ov008_021aa5f0();
    data_02105f4c.old=old;
    data_02105f4c.now=now;
}



