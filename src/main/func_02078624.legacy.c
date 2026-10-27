typedef unsigned int u32;
extern void func_02078ccc(unsigned int *out, unsigned char *in, unsigned int length);
extern unsigned int func_02078d88(unsigned int index, unsigned int *state);
#define R(x,n) (((x) << (n)) | ((x) >> (32-(n))))
#define F(b,c,d) ((d) ^ ((b) & ((c) ^ (d))))
#define P(b,c,d) ((d) ^ ((b) ^ (c)))
#define M(b,c,d) (((b) & ((c) | (d))) | ((c) & (d)))
#define STEP(a,b,c,d,e,w,f,k) e += R(a,5) + f(b,c,d) + (w) + (k); b = R(b,30)
void func_02078624(u32 *state, unsigned char *block)
{
    u32 a,b,c,d,e;
    u32 w[16];
    u32 j;
    int i, i4, i3, i2;
    a=state[0]; b=state[1]; c=state[2]; d=state[3]; e=state[4];
    func_02078ccc(w,block,64);
    j=0;
    for(i=0;i<3;i++) {
        STEP(a,b,c,d,e,w[j],F,0x5a827999);
        STEP(e,a,b,c,d,w[j+1],F,0x5a827999);
        STEP(d,e,a,b,c,w[j+2],F,0x5a827999);
        STEP(c,d,e,a,b,w[j+3],F,0x5a827999);
        STEP(b,c,d,e,a,w[j+4],F,0x5a827999);
        j+=5;
    }
    STEP(a,b,c,d,e,w[15],F,0x5a827999);
    STEP(e,a,b,c,d,func_02078d88(0,w),F,0x5a827999);
    STEP(d,e,a,b,c,func_02078d88(1,w),F,0x5a827999);
    STEP(c,d,e,a,b,func_02078d88(2,w),F,0x5a827999);
    STEP(b,c,d,e,a,func_02078d88(3,w),F,0x5a827999);
    j=4;
    for(i2=0;i2<4;i2++) {
        STEP(a,b,c,d,e,func_02078d88(j,w),P,0x6ed9eba1);
        STEP(e,a,b,c,d,func_02078d88(j+1,w),P,0x6ed9eba1);
        j=(j+2)&15;
        STEP(d,e,a,b,c,func_02078d88(j,w),P,0x6ed9eba1);
        STEP(c,d,e,a,b,func_02078d88(j+1,w),P,0x6ed9eba1);
        STEP(b,c,d,e,a,func_02078d88(j+2,w),P,0x6ed9eba1);
        j+=3;
    }
    for(i3=0;i3<4;i3++) {
        STEP(a,b,c,d,e,func_02078d88(j,w),M,0x8f1bbcdc);
        STEP(e,a,b,c,d,func_02078d88(j+1,w),M,0x8f1bbcdc);
        STEP(d,e,a,b,c,func_02078d88(j+2,w),M,0x8f1bbcdc);
        j=(j+3)&15;
        STEP(c,d,e,a,b,func_02078d88(j,w),M,0x8f1bbcdc);
        STEP(b,c,d,e,a,func_02078d88(j+1,w),M,0x8f1bbcdc);
        j+=2;
    }
    for(i4=0;i4<4;i4++) {
        STEP(a,b,c,d,e,func_02078d88(j,w),P,0xca62c1d6);
        STEP(e,a,b,c,d,func_02078d88(j+1,w),P,0xca62c1d6);
        STEP(d,e,a,b,c,func_02078d88(j+2,w),P,0xca62c1d6);
        STEP(c,d,e,a,b,func_02078d88(j+3,w),P,0xca62c1d6);
        j=(j+4)&15;
        STEP(b,c,d,e,a,func_02078d88(j,w),P,0xca62c1d6);
        j++;
    }
    state[0]+=a; state[1]+=b; state[2]+=c; state[3]+=d; state[4]+=e;
}

