typedef unsigned char u8;
typedef struct { int key, field4, source; } Entry;
typedef struct { int id; char pad[0xa8]; } Item;
typedef struct { int state, count, status; Item *items; } Request;
typedef struct { char pad[0x108]; int x108; } Conn;
typedef struct { int x0,x4,x8,xc; } Status;
typedef void (*StatusCb)(Conn **pp, Status *st, void *user);
typedef struct { int mode; void **conn; char pad[0x14]; u8 index, changed, phase; } State;
extern State *data_0219dc80;
extern int func_02048108(void);
extern void func_0204861c(void **obj, Request *req, int index);
extern int func_02048880(int value);
extern int func_020489c4(int a);
extern int func_02048b08(void *arr, int count, int target);
extern int func_0204918c(int index);
/* Assembly thunk forwards the entry and output pointer to func_0205337c. */
extern void func_02052ddc(int context, void *entry, void *out);
extern void func_02052df4(void *self, int a1);
extern int func_02052f04(int context, Entry *request);
extern void func_020535d4(int a0);
extern int func_02053650(int a0);
extern int func_02055654(void **self, int key);
extern int func_02055738(void **a0, int a1, int *out);
extern int func_020557b8(void **self, int index, void *out);
extern int func_020558fc(void **self, int *out);
extern int func_02055d58(Conn **pp,int a1,int a2,int a3,int a4,int a5,int a6,int a7,StatusCb cb,void *user);
void func_02048c68(Entry *entries, int count) {
    int n;
    int i;
    struct { int words[6]; } small;
    struct { int key; char pad[0x20c]; } item;
    int j;
    int key;
    if (data_0219dc80->phase == 0) {
        func_02048880(func_020558fc(data_0219dc80->conn, &n));
        for (i=0; i<n; i++) {
            func_02048880(func_020557b8(data_0219dc80->conn,i,&item));
            for (j=0; j<count; j++) {
                if (item.key == func_0204918c(j)) {
                    int offset = j * 12;
                    if (!func_02053650((int)entries + offset)) {
                        void *slot = (char *)entries + offset;
                        func_02052df4(slot,item.key);
                        func_020535d4((int)slot);
                        data_0219dc80->changed=1;
                    }
                    break;
                }
            }
            if (j==count) {
                func_02048880(func_02055654(data_0219dc80->conn,item.key));
                n--;
                i--;
            }
        }
        data_0219dc80->phase=1;
    }
    while (data_0219dc80->index < count) {
        key=func_0204918c(data_0219dc80->index);
        if (key != 0) {
            if (!func_02048b08(entries,data_0219dc80->index,key)) {
                func_02048880(func_02055738(data_0219dc80->conn,key,&i));
                if (i == -1) func_020489c4(key);
            }
        } else {
            if (func_02052f04(func_02048108(),&entries[data_0219dc80->index]) == -1) {
                func_02052ddc(func_02048108(),&entries[data_0219dc80->index],&small);
                {
                    State *state = data_0219dc80;
                    func_02055d58((Conn **)state->conn,0,0,0,0,(int)&small,0,0,(StatusCb)func_0204861c,(void *)state->index);
                }
                data_0219dc80->phase=2;
                return;
            }
        }
        data_0219dc80->index++;
    }
}







