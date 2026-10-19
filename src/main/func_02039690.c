typedef unsigned char u8;
typedef struct { unsigned short f0; unsigned short pad2; unsigned short f4; } Ctl;
typedef struct { char pad[8]; int f8, fc, f10, f14, f18; u8 f1c, f1d, f1e, f1f; char f20[64]; } Rec;
typedef struct { unsigned short f0, f2; int f4, f8; } Entry;
extern Ctl data_0219c480;
extern Entry *data_0219b314;
extern int data_0219b330;
extern char data_0219c494[];
extern int func_02038c84(int a, int b, ...);
extern int func_02038e58(int a, int b, void *c, int d, int e, int f);
extern void func_02038fb0(Rec *t);
extern void *func_0203a84c(int a0);
extern void func_0207d12c(char *r0, char *r1);
extern void func_02089008(int idx, int arg);
extern void *func_020891fc(int idx);
int func_02039690(int p0, int p1, int p2) {
    Rec *rec;
    int id;
    int mode;
    Entry *entry;
    if (data_0219c480.f4 != 0) return 0;
    entry = &data_0219b314[(unsigned short)p1];
    mode = 0;
    if (p2 & 0x400) { mode = 2; if (p2 & 0x200) mode = 1; }
    id = *(int *)func_020891fc(entry->f2);
    rec = (Rec *)func_0203a84c(id);
    if (rec != 0) {
        rec->f1c++;
    } else {
        rec = (Rec *)func_02038c84(data_0219b330, 0x60, -32);
        if (rec == 0) return 0;
        rec->f14 = id;
        rec->f8 = 0;
        rec->f1c = 1;
        rec->f18 = 0;
        rec->f1f = mode;
        rec->f1e = 4;
        rec->fc = 0x40;
        rec->f1d = 2;
        if (p2 & 0x8000) {
            if (func_02038e58(0, id, rec->f20, 0x40, 0, 0) != 0x40) return 0;
            rec->f1d = 1;
            func_02089008(id, (int)rec->f20);
        }
        func_0207d12c(data_0219c494, (char *)rec);
    }
    func_02038fb0(rec);
    data_0219c480.f0 = 0x81;
    return 1;
}


