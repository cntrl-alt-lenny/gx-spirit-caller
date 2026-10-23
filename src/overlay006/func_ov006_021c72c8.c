typedef struct { unsigned int a,b; char pad8[0x14]; unsigned int low8:8; unsigned int:24; char pad20[4]; unsigned int:17; unsigned int mid4:4; unsigned int:11; } state_t;
typedef struct { char pad0[0x18]; unsigned int f_18; char pad1[4]; unsigned int f_20; } state_02001d98_t;
struct Mode { int pad; unsigned chan:3; };
extern struct Mode data_02104f4c;
extern char data_ov006_021ce1c8[],data_ov006_021ce1cc[];
extern void func_02001d0c(state_t *,int,int);
extern void func_02001d68(int);
extern void func_02001d98(state_02001d98_t *,int);
extern void func_02005088(int,int,int,int,int,int);
extern int func_02005554(int,int,int);
extern char *func_0202c0c0(int);
extern int func_0208ddec(void);
extern void func_02094504(int,int,int);
extern int OS_SPrintf(char *,const char *,...);
extern char *func_020aaf10(char *,const char *);
int func_ov006_021c72c8(char *obj) {
    char buf[64];
    int base = func_0208ddec();
    int whole, value, width;
    func_02094504(0,base+0xc20,0x800);
    func_02001d0c((state_t *)(obj+4),0x20,2);
    func_02001d68(data_02104f4c.chan);
    func_02001d98((state_02001d98_t *)(obj+4),5);
    if (*(int *)(obj+0x54)) {
        value=*(int *)(obj+0x4c);
        whole=value/10;
        if (whole>=50) {
            OS_SPrintf(buf,func_0202c0c0(0x1d0),*(int *)(obj+0x50),whole%1000,value%10);
            if (*(int *)(obj+0x4c)/10>=100) {
                func_020aaf10(buf,data_02104f4c.chan==0 ? data_ov006_021ce1c8 : data_ov006_021ce1cc);
            }
        } else {
            OS_SPrintf(buf,func_0202c0c0(0x1cf),*(int *)(obj+0x50));
        }
    } else {
        OS_SPrintf(buf,func_0202c0c0(0x1ce),(*(int *)(obj+0x4c)/10)%1000);
        if (*(int *)(obj+0x4c)/10>=100) {
            func_020aaf10(buf,data_02104f4c.chan==0 ? data_ov006_021ce1c8 : data_ov006_021ce1cc);
        }
    }
    func_02005088((int)(obj+4),(int)buf,base+0xc20,248-func_02005554((unsigned int)buf,12,5),3,12);
    func_02001d98((state_02001d98_t *)(obj+4),-1);
    return 1;
}




