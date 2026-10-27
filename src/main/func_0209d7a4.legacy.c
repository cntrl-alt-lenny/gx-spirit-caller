typedef unsigned short u16;
typedef struct Msg Msg;
struct Msg { u16 type, sub, code, index; void *ptr; unsigned int w0c; u16 h10,h12; unsigned int w14,w18; void (*callback)(Msg *); u16 h20,h22; unsigned int w24,w28; u16 h2c,h2e,h30,h32,h34,h36,h38,h3a,h3c,h3e,h40,h42; };
typedef struct { unsigned int w0; unsigned char *p4; unsigned int w8,wc; Msg *p10; u16 h14,h16; void (*handlers[44])(Msg *); void (*cb)(Msg *); void (*callbacks[16])(Msg *); void (*args[16])(Msg *); unsigned int mask; u16 h150; } Context;
extern Context *data_021a8d2c;
extern u16 data_021a8d28;
extern Msg data_021a8d78;
extern unsigned char data_021a8d8c[],data_021a8d9c[];
extern void func_020928cc(void *,int);
extern void func_020928e8(void *,int);
extern void func_02093bfc(void);
extern void func_0209448c(int,int,int);
extern void func_020944a4(int,int,int);
extern void func_020945f4(void *,int,int);
extern void func_02094688(const void *,void *,int);
extern void func_0209d788(void);
extern int func_0209de74(void);
void func_0209d7a4(int unused, Msg *msg, int flag) {
    void *p;
    u16 second;
    Context *ctx = data_021a8d2c;
    u16 event, bit, which, value;
    void *extra;
    u16 first, i;
    if (flag != 0) return;
    func_020928cc(ctx->p10,0x100);
    if (ctx->h16 == 0) func_020928cc(ctx->p4,0x800);
    if (msg != ctx->p10) func_020928cc(msg,0x100);
    if (msg->type >= 0x2c) {
        if (msg->type == 0x80) {
            if (msg->sub == 0x13) func_02093bfc();
            if (ctx->cb) ctx->cb(msg);
        } else if (msg->type == 0x82) {
            if (ctx->callbacks[msg->index]) {
                msg->callback = ctx->args[msg->index];
                msg->h22 = ctx->mask;
                func_020928cc(msg->ptr,*(u16 *)(ctx->p4+0x72));
                ctx->callbacks[msg->index](msg);
            }
        } else if (msg->type == 0x81) {
            msg->type = 0xf;
            if (msg->callback) msg->callback(msg);
        }
    } else {
        if (msg->type == 0xe && (u16)(msg->code + 0xfff5) <= 1 && msg->sub == 0)
            func_020928cc(msg->ptr,*(u16 *)(ctx->p4+0x72));
        if (msg->type == 2 && msg->sub == 0) {
            void (*cb)(Msg *) = ctx->handlers[msg->type];
            func_0209de74();
            if (cb) cb(msg);
            return;
        }
        if (ctx->handlers[msg->type]) {
            ctx->handlers[msg->type](msg);
            if (data_021a8d28 == 0) return;
        }
        if (msg->type == 8 || msg->type == 0xc) {



            if (msg->type == 8) {
                p = (char *)msg+0xa;
                first = msg->h2c;
                extra = (char *)msg+0x14;
                event = *(u16 *)((char *)msg+8);
                bit = msg->h10;
                value = msg->h12;
                first = msg->h2c;
                second = msg->h2e;
                which = 0;
            } else if (msg->type == 0xc) {
                first = *(u16 *)((char *)msg+0x16);
                bit = 0;
                event = *(u16 *)((char *)msg+8);
                p = (char *)msg+0x10;
                which = *(u16 *)((char *)msg+0xa);
                value = *(u16 *)((char *)msg+0xc);
                second = *(u16 *)((char *)msg+0x18);
                extra = 0;
            }
            if (event == 7 || event == 9 || event == 0x1a) {
                if (event == 7) ctx->mask |= 1 << bit;
                else ctx->mask &= ~(1 << bit);
                ctx->h150 = which;
                func_020945f4(&data_021a8d78,0,0x44);
                data_021a8d78.type = 0x82;
                data_021a8d78.code = event;
                data_021a8d78.h12 = bit;
                data_021a8d78.h20 = which;
                data_021a8d78.sub = 0;
                data_021a8d78.ptr = 0;
                data_021a8d78.w0c = 0;
                data_021a8d78.h10 = 0;
                data_021a8d78.h22 = ctx->mask;
                *(u16 *)((char *)&data_021a8d78+0x1a) = 0xffff;
                data_021a8d78.h3c = value;
                func_02094688(p,data_021a8d8c,6);
                if (extra) func_020944a4((int)extra,(int)data_021a8d9c,0x18);
                else func_0209448c(0,(int)data_021a8d9c,0x18);
                data_021a8d78.h40 = which == 0 ? first : second;
                if (which != 0) second = first;
                data_021a8d78.h42 = second;
                for (i=0;i<16;i++) {
                    data_021a8d78.index = i;
                    if (ctx->callbacks[i]) {
                        data_021a8d78.callback = ctx->args[i];
                        ctx->callbacks[i](&data_021a8d78);
                    }
                }
            }
        }
    }
    func_020928cc(ctx->p10,0x100);
    func_0209d788();
    if (msg != ctx->p10) {
        msg->type |= 0x8000;
        func_020928e8(msg,0x100);
    }
}






