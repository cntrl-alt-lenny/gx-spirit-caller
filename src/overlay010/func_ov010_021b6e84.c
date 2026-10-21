typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
typedef struct { char pad0[0x5c]; unsigned int f_5c; char pad1[8]; unsigned int f_68; char pad2[4]; unsigned int f_70; } state_ov010_021b3998_t;
typedef struct { char pad[0x54]; int busy; } List;
typedef struct { char pad0[4]; int selected; char pad8[0x2c]; void *window; char pad38[0x4c]; void *manager; List *list; char cursor[0x5c]; int index; char padec[0x26c]; unsigned dirty:1, rest:31; } Overlay;
typedef struct { char pad0[0xc]; int result; char pad10[0xf0]; int active; } Global;
typedef struct { char pad0[0x54]; unsigned short pressed, held; } Input;
extern Global data_ov010_021b9884;
extern Overlay data_ov010_021b9890;
extern Input data_02104bac;
extern int func_02037208(int a0,int r1,int r2,int r3);
extern int func_ov005_021ab108(void *,int);
extern int func_ov005_021ab260(void *obj,int idx);
extern int func_ov005_021ab318(void *obj,int idx);
extern unsigned short func_ov005_021ab384(state_hw_t *p,int idx,unsigned int mask);
extern int func_ov005_021ac984(void *o);
/* This caller passes the list, although the constant getter definition takes void. */
extern int func_ov005_021ac9c8(void *o);
extern int func_ov005_021ac9d0(void *obj,int idx);
extern int func_ov005_021ac9dc(void *o,int key);
extern void func_ov005_021aca30(int *o,int v);
extern void func_ov005_021aca64(void *o,int target);
extern void func_ov010_021b23f4(void *arg0,int arg1);
extern int func_ov010_021b3998(state_ov010_021b3998_t *p);
extern int func_ov010_021b39c0(void *arg0);
extern void func_ov010_021b3a14(void *p,int v);
extern int func_ov010_021b6868(int arg0,int arg1);
int func_ov010_021b6e84(void) {
    Overlay *p = &data_ov010_021b9890;
    int result = data_ov010_021b9884.result;
    if (data_ov010_021b9884.active == 1 && p->list->busy == 0) {
        int key, selected, i;
        selected = p->index;
        key = func_ov005_021ac9d0(p->list,selected);
        if (data_02104bac.pressed & 2) {
            *(unsigned *)((char *)p + 0x358) |= 4;
        } else if (data_02104bac.pressed & 1) {
            *(unsigned *)((char *)p + 0x358) |= 0x10;
        } else if ((data_02104bac.held & 0x40) && p->index >= 0) {
            if (func_ov010_021b3998((state_ov010_021b3998_t *)p->cursor) == 0)
                func_ov005_021aca30((int *)p->list,0x8000);
        } else if ((data_02104bac.held & 0x80) && (i = p->index, i < func_ov005_021ab108(p->manager,2)-1)) {
            if (func_ov010_021b39c0(p->cursor) == 0)
                func_ov005_021aca64(p->list,0x8000);
        } else if (data_02104bac.held & 0x10) {
            if (func_ov005_021ab260(p->manager,key) > 0) {
                if (func_ov005_021ab384(p->manager,key,2) == 0) {
                    func_ov010_021b6868(selected,-1);
                } else if (selected == func_ov005_021ac984(p->list)-1) {
                    func_ov005_021aca64(p->list,0x8000);
                } else {
                    func_ov010_021b39c0(p->cursor);
                }
            }
        } else if (data_02104bac.held & 0x20) {
            if (func_ov005_021ab260(p->manager,key) > 0 && func_ov005_021ab384(p->manager,key,2) != 0) {
                func_ov010_021b6868(selected,-1);
            } else {

                int parent, count;
                parent = func_ov005_021ab318(p->manager,key);
                count = func_ov005_021ac984(p->list);
                if (parent != 0) {
                    for (i=0; i<count; i++) {
                        if (parent == func_ov005_021ac9d0(p->list,i)) {
                            func_ov010_021b3a14(p->cursor,i);
                            break;
                        }
                    }
                    if (i == count) {
                        p->selected = parent;
                        parent = func_ov005_021ac9dc(p->list,parent);
                        func_ov010_021b23f4(p->window,parent * func_ov005_021ac9c8(p->list));
                        p->dirty = 1;
                        func_ov010_021b3a14(p->cursor,0);
                    }
                    func_02037208(0x38,-1,0,1);
                }
            }
        }
    }
    return result;
}





