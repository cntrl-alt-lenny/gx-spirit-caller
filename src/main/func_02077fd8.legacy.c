typedef unsigned int u32;
extern unsigned char data_02101f34[];
extern u32 data_02101fb4[];
extern void *func_0207842c(const void *src, void *dst, int n);
#define ROT(x,n) (((x) << (n)) | ((x) >> (32-(n))))
#define F(b,c,d) ((d) ^ ((b) & ((c) ^ (d))))
#define G(b,c,d) ((c) ^ ((d) & ((b) ^ (c))))
#define H(b,c,d) ((d) ^ ((b) ^ (c)))
#define I(b,c,d) ((c) ^ ((b) | ~(d)))
#define STEP(f,a,b,c,d,k,s) a = b + ROT(a + (data_02101fb4[k] + (f(b,c,d) + x[data_02101f34[k]])),s)
void func_02077fd8(u32 *ctx, void *block) {
    u32 a,b,c,d;
    u32 x[16];
    int i,j;
    a=ctx[0]; b=ctx[1]; c=ctx[2]; d=ctx[3];
    func_0207842c(x,block,0x40);
    i=0;
    for(j=0;j<4;i+=4,j++) {
        STEP(F,a,b,c,d,i,7);
        STEP(F,d,a,b,c,i+1,12);
        STEP(F,c,d,a,b,i+2,17);
        STEP(F,b,c,d,a,i+3,22);
    }
    for(j=0;j<4;i+=4,j++) {
        STEP(G,a,b,c,d,i,5);
        STEP(G,d,a,b,c,i+1,9);
        STEP(G,c,d,a,b,i+2,14);
        STEP(G,b,c,d,a,i+3,20);
    }
    for(j=0;j<4;i+=4,j++) {
        STEP(H,a,b,c,d,i,4);
        STEP(H,d,a,b,c,i+1,11);
        STEP(H,c,d,a,b,i+2,16);
        STEP(H,b,c,d,a,i+3,23);
    }
    for(j=0;j<4;i+=4,j++) {
        STEP(I,a,b,c,d,i,6);
        STEP(I,d,a,b,c,i+1,10);
        STEP(I,c,d,a,b,i+2,15);
        STEP(I,b,c,d,a,i+3,21);
    }
    ctx[0]+=a; ctx[1]+=b; ctx[2]+=c; ctx[3]+=d;
}

