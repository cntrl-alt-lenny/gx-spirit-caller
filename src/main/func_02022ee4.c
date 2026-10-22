typedef struct Header { unsigned char pad[12]; unsigned short offset, count; } Header;
typedef struct Entry { int type; signed char name[0x20]; int a,b; void **out; void (*callback)(int); int arg; void *data; } Entry;
typedef struct Queue { char pad[0x74]; short end,start; } Queue;
extern Queue data_0219a834;
extern char data_02197434[];
extern char data_020c689c[],data_020c68a8[],data_020c68b4[],data_020c68c0[];
extern void *func_02006c0c(void *,int,int);
extern void Task_Invoke(void *p);
extern int func_02007104(const void *,const void *);
extern int func_0201e5b8(void *);
extern int func_0201e66c(Header *file,int texture,int palette);
extern void *func_0202be4c(int);
extern void *func_0202befc(int);
extern void *func_0202bf90(int id);
extern void *func_0202c6ac(int id);
int func_02022ee4(int mode) {
    char *base = data_02197434;
    Entry *e;
    int next;
    short *q;
    if (data_0219a834.start == data_0219a834.end) return 0;
    e = &((Entry *)(base + 0x12b4))[((Queue *)(base + 0x3400))->start];
    if (e->data == 0) {
        if (mode == 2) return 0;
        switch (e->type) {
        case 0:
            if (func_02007104(e->name,data_020c689c) >= 0) {
                e->data = func_0202befc((e->name[8]-'0')*1000 + (e->name[9]-'0')*100 + (e->name[10]-'0')*10 + (e->name[11]-'0'));
            } else if (func_02007104(e->name,data_020c68a8) >= 0) {
                e->data = func_0202bf90((e->name[9]-'0')*1000 + (e->name[10]-'0')*100 + (e->name[11]-'0')*10 + (e->name[12]-'0'));
            } else if (func_02007104(e->name,data_020c68b4) >= 0) {
                e->data = func_0202c6ac((int)e->name);
            } else {
                e->data = func_02006c0c(e->name,4,0);
            }
            break;
        case 1:
            e->data = func_02006c0c(e->name,4,0);
            *e->out = e->data;
            break;
        case 2:
            if (func_02007104(e->name,data_020c68c0) >= 0) {
                e->data = func_0202be4c((e->name[8]-'0')*1000 + (e->name[9]-'0')*100 + (e->name[10]-'0')*10 + (e->name[11]-'0'));
            } else {
                e->data = func_02006c0c(e->name,4,0);
            }
            *e->out = e->data;
            break;
        }
        if (mode == 1) return 1;
    }
    switch (e->type) {
    case 0: func_0201e66c(e->data,e->a,e->b); break;
    case 1: case 2: func_0201e5b8(e->out); break;
    }
    Task_Invoke(e->data);
    e->data = 0;
    if (e->callback) e->callback(e->arg);
    base += 0x3400;
    ((Queue *)base)->start = 1 + ((Queue *)base)->start;
    if (((Queue *)base)->start >= 0x90) ((Queue *)base)->start = 0;
    return 1;
}









