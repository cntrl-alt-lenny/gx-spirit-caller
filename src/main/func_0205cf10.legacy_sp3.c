struct Buffer { char *data; int size; int used; };
typedef struct { int status; int pad4; int sock; int result; int pad10[2]; struct Buffer buf; int field24; char queue[4]; } Req;
extern int func_02057b00(int *ctx, int sock, struct Buffer *buf, int *out, int *done, char *name);
extern void func_020a6d54(int a,int b,int c,int d);
extern void func_02054868(int a0,int a1,int a2);
extern void func_02058070(int a,int b,int c);
extern int func_020602c4(char *,char *,char *,int);
extern int func_020a978c(char *,char *,...);
extern int func_020aaddc(const char *s);
extern int func_020aaf40(const unsigned char *,const unsigned char *);
extern int func_020ab054(unsigned char *,unsigned char *,int);
extern unsigned char *func_020ab0c4(unsigned char *,const unsigned char *);
/* This caller only supplies the input string to the atoi thunk. */
extern int func_020ace00();
extern char data_02100b64[],data_02100cb8[],data_02100cd0[],data_02100cf0[],data_02100cf8[],data_02100d00[],data_02100d08[],data_02100d10[],data_02100d18[],data_02100d20[],data_02100d28[];
int func_0205cf10(int *ctx, Req *req) {
    char *base = (char *)*ctx;
    int out, done;
    char number[16], name[31], received[33], digest[33], text[256];
    unsigned char *end;
    char *data;
    int value, ret;
    if (req->status != 0x68) func_020a6d54((int)data_02100cd0,(int)data_02100b64,0,0xc1);
    ret = func_02057b00(ctx,req->sock,&req->buf,&out,&done,data_02100cb8);
    if (ret != 0) return ret;
    if (done != 0) { req->status = 0x6a; return 0; }
    end = func_020ab0c4((unsigned char *)req->buf.data,(unsigned char *)data_02100cf0);
    if (end != 0) {
        *end = 0;
        data = req->buf.data;
        if (func_020ab054((unsigned char *)data,(unsigned char *)data_02100cf8,6) == 0) {
            if (func_020602c4(data,data_02100d00,number,16) == 0) { req->status = 0x6a; return 0; }
            value = func_020ace00(number);
            if (func_020602c4(req->buf.data,data_02100d08,name,31) == 0) { req->status = 0x6a; return 0; }
            if (func_020602c4(req->buf.data,data_02100d10,received,33) == 0) { req->status = 0x6a; return 0; }
            func_020a978c(text,data_02100d18,base+0x177,*(int *)(base+0x1a0),value);
            func_02054868((int)text,func_020aaddc(text),(int)digest);
            if (func_020aaf40((unsigned char *)received,(unsigned char *)digest) != 0) {
                func_02058070((int)ctx,(int)req + 0x28,(int)data_02100d20);
                func_02058070((int)ctx,(int)req->queue,(int)data_02100cf0);
                req->status = 0x6a;
                return 0;
            } else {
                func_02058070((int)ctx,(int)req + 0x28,(int)data_02100d28);
                func_02058070((int)ctx,(int)req->queue,(int)data_02100cf0);
                req->status = 0x69;
                req->result = value;
            }
        } else { req->status = 0x6a; return 0; }
        req->buf.used = 0;
    }
    return 0;
}


