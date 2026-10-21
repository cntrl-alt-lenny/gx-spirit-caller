typedef struct Cont0200afc8 Cont0200afc8;
typedef struct Src13 Src13;
typedef struct Dst13 Dst13;
typedef struct Header Header;
typedef struct Result Result;
typedef struct Obj_0200f044 Obj_0200f044;
typedef struct Obj Obj;
typedef struct LookupObj LookupObj;
typedef struct { char bytes[0x68]; } Archive;
typedef struct { char pad[0x80]; void *w80; int pad84; Cont0200afc8 *w88; } Sub;
typedef struct { void *w0; void *arr[3]; Sub *w10; short h14; unsigned char b0:1; unsigned char rest:7; unsigned char flags; } P;
typedef struct { char pad[0x94]; P p; } Main;
typedef struct { int resource; int pad; const char *name80; int padc; const char *name88; } Info;
extern void Task_Invoke(void *p);
extern int func_0200adbc(int x);
extern int func_0200af08(void *p);
extern int func_0200afc8(Cont0200afc8 *c);
extern Dst13 *func_0200b59c(Src13 *s);
extern Result *func_0200b614(Header *src);
extern int func_0200f044(Obj_0200f044 *o, int mode, unsigned int val, int flag);
extern int func_0200f13c(Obj *o, unsigned int mode, unsigned int val, int flag);
extern char *func_0202162c(void);
extern int func_02021660(LookupObj *o, int key, int idx);
extern int func_0207dca8(int arg);
extern int func_0207dcf8(void *self);
extern int func_0207dd20(Archive *self, const char *name, Header *file);
extern int func_020a978c(char *out, const char *fmt, ...);
extern const char data_020c68ec[];
extern const char data_020c68f0[];
int func_02026b38(Main *o, int idx, unsigned int flags, Info *info)
{
    P *p = &o->p;
    Archive archive;
    char name[0x20];
    void *v;
    idx = (signed char)idx;
    if (idx >= 0 && p->arr[idx] != 0) {
        Task_Invoke(p->arr[idx]);
        p->arr[idx] = 0;
    }
    if (p->b0) {
        char *base = (char *)func_02021660((LookupObj *)func_0202162c(), 3, p->h14);
        v = *(void **)(base + idx * 4 + 0x98);
        p->arr[idx] = v;
    } else if (idx < 0) {
        v = p->w0;
    } else {
        v = (void *)func_0200adbc(info->resource);
        p->arr[idx] = v;
    }
    if (func_0207dd20(&archive, data_020c68ec, (Header *)v) == 0) return 0;
    if ((flags & 1) && (p->w10->w80 == 0 || !(flags & 0x80))) {
        if (p->w10->w80 != 0) {
            func_0200af08(p->w10->w80);
            p->w10->w80 = 0;
            p->flags &= ~1;
        }
        if (info->name80 != 0) {
            func_020a978c(name, data_020c68f0, info->name80);
            p->w10->w80 = func_0200b59c((Src13 *)func_0207dca8((int)name));
            p->flags |= 1;
            func_0200f044((Obj_0200f044 *)p->w10, 0, 0, 1);
            func_0200f044((Obj_0200f044 *)p->w10, 1, 0, 1);
        }
    }
    if ((flags & 4) && (p->w10->w88 == 0 || !(flags & 0x80))) {
        if (p->w10->w88 != 0) {
            func_0200afc8(p->w10->w88);
            p->w10->w88 = 0;
            p->flags &= ~4;
        }
        if (info->name88 != 0) {
            func_020a978c(name, data_020c68f0, info->name88);
            p->w10->w88 = (Cont0200afc8 *)func_0200b614((Header *)func_0207dca8((int)name));
            p->flags |= 4;
            func_0200f13c((Obj *)p->w10, 0, 0, 1);
            func_0200f13c((Obj *)p->w10, 1, 0, 1);
        }
    }
    func_0207dcf8(&archive);
    return 1;
}
