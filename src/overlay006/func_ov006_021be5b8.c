extern char data_ov006_0224f448[];
extern unsigned short func_ov006_021b6d00(char *base, int idx, int flag);
extern unsigned short func_ov006_021b6d1c(char *p, int sel, int idx, int flag);
extern int func_ov006_021b8e4c(char *p, int card, int mode, int flag);
extern int func_ov006_021b8f7c(void *p);
extern int func_020b3870(int a, int b);
extern void func_020945f4(void *p, int value, unsigned size);
struct Entry { int a,b,start,count,pages,e,f; unsigned char status[4]; unsigned mode:1; unsigned more:1; unsigned rest:30; };
struct Object { char pad[0x40]; int busy; char gap[12]; int selection; char gap2[76]; struct Entry entries[5]; };
int func_ov006_021be5b8(struct Object *obj) {
    char *base = data_ov006_0224f448;
    struct Entry *entry = &obj->entries[obj->selection];
    int step, limit, i;
    entry->count = func_ov006_021b6d00(base,obj->selection,obj->selection == 0 ? 0 : entry->mode);
    step = entry->mode ? 10 : 1;
    limit = obj->selection == 4 ? 3 : 4;
    entry->pages = entry->mode ? func_020b3870(entry->count + step - 1, step) : entry->count;
    entry->more = entry->pages > limit;
    if (obj->busy == 0) {
        if (entry->mode) {
            func_020945f4(entry->status,0,4);
        } else {
            for (i=0;i<limit;i++) {
                int card=func_ov006_021b6d1c(base,obj->selection,entry->start+i,entry->mode);
                func_ov006_021b8e4c(base,card,1,0);
                entry->status[i]=func_ov006_021b8f7c(base);
            }
        }
    }
    return 1;
}

