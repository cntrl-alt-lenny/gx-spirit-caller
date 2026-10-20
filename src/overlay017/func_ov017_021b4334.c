typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char _pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
extern state_t data_02102c90;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02005088(int a0,int a1,int a2,int a3,int a4,int a5);
extern int func_020054a4(int text,int font);
extern void func_02094504(int value,void *dst,int size);
extern void func_02094550(int *src,int *dst,unsigned int count);
void func_ov017_021b4334(int tile, char *buf, int text, int size, int flags) {
    int width = size / 8;
    int align = flags & 3;
    int font = flags >> 2;
    char *dst;
    int i;
    if (font == 0) font = 12;
    func_02094504(0,buf,size);
    func_02001d0c(&data_02102c90,width/8,2);
    switch (align) {
    case 0: func_02005088((int)&data_02102c90,text,(int)buf,2,2,font); break;
    case 1: func_02005088((int)&data_02102c90,text,(int)buf,(width-func_020054a4(text,font))/2,1,font); break;
    case 2: func_02005088((int)&data_02102c90,text,(int)buf,width-func_020054a4(text,font)-2,2,font); break;
    }
    dst = (char *)(0x6600000 + (tile << 7));
    func_02094504(0,dst,size);
    i=0;
    if ((width/32)*2 <= 0) return;
    do {
        func_02094550((int *)(buf+((i/2)*256)/2),(int *)(dst+(i*256)/2),128);
        func_02094550((int *)(buf+(width*8)/2+((i/2)*256)/2),(int *)(dst+((i+1)*256)/2),128);
        i+=2;
    } while (i<(width/32)*2);
}









