typedef long long s64;
struct Obj { int flags; char pad[0x14]; int f18, f1c; short f20, f22; int f24, f28; unsigned short w,h; int f30,f34; };
struct Mat { int v[16]; };
struct Packet { int cmd, mode; struct Mat m; int end; };
extern void (*data_021023a0[])(int *, struct Obj *);
extern void func_02084e0c(int cmd, void *src, int n);
void func_02086ad4(struct Obj *p) {
    int a[19];
    if (p->flags & 8) a[0]=0x101610; else a[0]=0x101810;
    a[1]=3;
    a[18]=2;
    a[17]=0x1000;
    a[4]=a[5]=a[8]=a[9]=a[10]=a[11]=a[12]=a[13]=a[16]=0;
    if (p->flags & 1) p->f18=p->f1c=0x1000;
    if (p->flags & 2) { p->f22=0x1000; p->f20=0; }
    if (p->flags & 4) p->f24=p->f28=0;
    data_021023a0[p->flags & 7](&a[2],p);
    if (p->f30 != 0x1000) {
        a[2]=(int)(((s64)p->f30*a[2])>>12);
        a[3]=(int)(((s64)p->f30*a[3])>>12);
        a[14]=(int)(((s64)p->f30*a[14])>>12);
    }
    if (p->f34 != 0x1000) {
        a[6]=(int)(((s64)p->f34*a[6])>>12);
        a[7]=(int)(((s64)p->f34*a[7])>>12);
        a[15]=(int)(((s64)p->f34*a[15])>>12);
    }
    func_02084e0c(a[0],(void *)((unsigned int)a+4),0x12);
}


