typedef struct { unsigned short f0, f2; int f4; unsigned int f8; int fc, f10; void *f14; } Hdr1;
typedef struct { int f0, f4, f8; void *fc; } Hdr2;
typedef struct { int f0, f4; } Out;
typedef struct { char pad[4]; unsigned int mode:3; unsigned int rest:29; } Selector;
typedef struct { short slots[13]; short count; } Record;
typedef struct { char pad[0x880]; int *resource; char pad2[0x800]; int entries[13]; } State;
typedef struct { char pad[0x50]; int a,b; char pad2[0x864]; int h1,h2; } Control;
extern void *data_ov022_021ab9a0[];
extern int data_ov022_021ac36c, data_ov022_021ac56c, data_ov022_021abac4[], data_ov022_021abab0[];
extern int data_ov022_021acc08[], data_ov022_021ac364, data_ov022_021ac368;
extern const Record data_ov022_021ab8e4[];
extern Selector data_02104f4c;
extern State data_ov022_021abae8;
extern Control data_ov022_021abaa0;
extern void func_ov022_021aa540(int, int, int, int);
extern int func_0201edac(int,int), func_0201ede4(int,int), func_0201ed74(int,int), func_0201ed3c(int,int);
extern void func_0207f610(Hdr1 *, int, int, int *);
extern void func_0207f510(Hdr2 *, int, int, Out *);
extern void Task_Invoke(void *);
extern void Copy32(void *, void *, int);
extern int func_0207e638(int *, unsigned);
extern void func_0208c884(unsigned short *, int);
extern int func_020373cc(int,int,int,int);
int func_ov022_021aaa34(void) {
    State *state = &data_ov022_021abae8; Hdr1 *a; Hdr2 *b; int h; int i;
    func_ov022_021aa540(0,0,1,(int)&data_ov022_021ac36c);
    func_ov022_021aa540(1,5,1,(int)&data_ov022_021ac56c);
    h = func_0201edac((int)&a,(int)data_ov022_021ab9a0[3]);
    func_0207f610(a,0,1,data_ov022_021abac4);
    Task_Invoke((void *)h);
    h = func_0201ede4((int)&b,(int)data_ov022_021ab9a0[4]);
    func_0207f510(b,0,1,(Out *)data_ov022_021abab0);
    Task_Invoke((void *)h);
    Copy32((void *)0x05000200,data_ov022_021acc08,0x20);
    data_ov022_021abaa0.h1 = func_0201ed74((int)&data_ov022_021ac364,(int)data_ov022_021ab9a0[5]);
    data_ov022_021abaa0.h2 = func_0201ed3c((int)&data_ov022_021ac368,(int)data_ov022_021ab9a0[6]);
    for (i=0;i<13;i++) {
        int id = data_ov022_021ab8e4[data_02104f4c.mode].slots[i];
        if (id != -1) state->entries[i] = func_0207e638(state->resource,(unsigned short)id);
    }
    data_ov022_021abaa0.a = 0x14000;
    data_ov022_021abaa0.b = 0x14000;
    func_0208c884((unsigned short *)0x0400006c,-16);
    func_0208c884((unsigned short *)0x0400106c,-16);
    func_020373cc(0x2e,1,0,-1);
    return 1;
}


