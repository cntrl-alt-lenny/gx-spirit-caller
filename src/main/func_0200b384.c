typedef struct { int v, hi; } E8;
typedef struct { int a; short h4,h6; int w8,wc,w10,w14,w18,w1c; } Src_0200b250;
typedef struct { char a; char pad3[3]; short h4,h6; int w8,wc,w10,w14,w18,w1c; } Dst_0200b250;
typedef struct { int field0,field4; } SrcEntry_0200b2f4;
typedef struct { int f0,f4,f8; } DestEntry_0200b2f4;
typedef struct { void *f00,*f04,*f08,*f0c,*f10,*f14,*f18,*f1c; } Obj2;
typedef struct { void *f00,*f04,*f08,*f0c,*f10,*f14,*f18,*f1c; int f20,f24,f28,f2c,f30; } Result;
typedef struct { char pad[0x20]; int f20,f24,f28,f2c,f30,f34,f38,f3c,f40,f44,f48,f4c,f50,f54,f58,f5c; } Source;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Fill32(int val, void *dst, int size);
extern int func_0200ae70(Obj2 *p);
extern int func_0200b194(int a, int b, int c);
extern int func_0200b1bc(E8 *base, int a1, int addend, unsigned count);
extern int func_0200b208(int a, int b, int c);
extern int func_0200b228(int a, int b, int c);
extern int func_0200b250(Dst_0200b250 *dst, Src_0200b250 *src, int base, unsigned int n);
extern int func_0200b2f4(DestEntry_0200b2f4 *dest, SrcEntry_0200b2f4 *src, int base, unsigned int count);
extern int func_0200b35c(unsigned char *dst, const unsigned int *src, unsigned int n);

Result *func_0200b384(Source *s) {
    Result *d = (Result *)Task_PostLocked((void *)0x34,4,0);
    if (d) {



            Fill32(0,d,0x34);
            d->f20=s->f38;
            d->f24=s->f48;
            d->f28=s->f50;
            d->f2c=s->f58;
            d->f30=s->f5c;
            d->f0c=(void *)Task_PostLocked((void *)(s->f38*4),4,0);
            if (!d->f0c) goto allocation_failed;
            func_0200b208((int)d->f0c,(int)s+s->f3c,s->f38);
            if (d->f20 > 31) {
                d->f10=(void *)Task_PostLocked((void *)(d->f20*0x60),4,0);
                if (!d->f10) goto allocation_failed;
            }
            d->f00=(void *)Task_PostLocked((void *)(s->f20*0x58),4,0);
            if (!d->f00) goto allocation_failed;
            func_0200b194((int)d->f00,(int)s+s->f24,s->f20);
            d->f08=(void *)Task_PostLocked((void *)(s->f30*0x68),4,0);
            if (!d->f08) goto allocation_failed;
            func_0200b228((int)d->f08,(int)s+s->f34,s->f30);
            if (s->f48 > 0) {
                d->f18=(void *)Task_PostLocked((void *)(s->f48*0x20),4,0);
                if (!d->f18) goto allocation_failed;
                func_0200b250(d->f18,(Src_0200b250 *)((char *)s+s->f4c),(int)s,s->f48);
            }
            if (s->f50 > 0) {
                d->f1c=(void *)Task_PostLocked((void *)(s->f50*0xc),4,0);
                if (!d->f1c) goto allocation_failed;
                func_0200b2f4(d->f1c,(SrcEntry_0200b2f4 *)((char *)s+s->f54),(int)s,s->f50);
            }
            d->f04=(void *)Task_PostLocked((void *)(s->f28*8),4,0);
            if (!d->f04) goto allocation_failed;
            func_0200b1bc(d->f04,(int)s+s->f2c,(int)s,s->f28);
            d->f14=(void *)Task_PostLocked((void *)s->f40,4,0);
            if (!d->f14) goto allocation_failed;
            func_0200b35c(d->f14,(const unsigned int *)((char *)s+s->f44),s->f40);
    }
    return d;

allocation_failed:
    if (d) func_0200ae70((Obj2 *)d);
    return 0;
}
