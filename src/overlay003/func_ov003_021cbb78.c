typedef struct { unsigned short count; } state_0201ef3c_t;
extern void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2);
typedef struct { state_0201ef3c_t *p; int pad; void *tasks[4]; void *pair[2]; } Small;
typedef struct {
    state_0201ef3c_t *p; int pad; void *tasks[1]; void *pair[2];
    state_0201ef3c_t *p2; int pad2; void *tasks2[4]; void *pair2[2];
    state_0201ef3c_t *p3; int pad3; void *tasks3[10]; void *pair3[2];
} Medium;
typedef struct { state_0201ef3c_t *p[5]; int pad[5]; void *tasks[5][18]; void *pair[5][2]; } Large;
typedef struct { int pad[7]; state_0201ef3c_t *p; int pad2; void *tasks[3]; void *pair[2]; Small small[2][2]; Medium medium[2]; Large large[2]; } State;
int func_ov003_021cbb78(State *s) {
    int i,j;
    for(i=0;i<2;i++) {
        if(s->medium[i].pair[0]) {
            func_0201ef3c(s->medium[i].p,s->medium[i].tasks,s->medium[i].pair);
            s->medium[i].pair[1]=0;
            s->medium[i].pair[0]=0;
        }
        if(s->medium[i].pair2[0]) {
            func_0201ef3c(s->medium[i].p2,s->medium[i].tasks2,s->medium[i].pair2);
            s->medium[i].pair2[1]=0;
            s->medium[i].pair2[0]=0;
        }
        if(s->medium[i].pair3[0]) {
            func_0201ef3c(s->medium[i].p3,s->medium[i].tasks3,s->medium[i].pair3);
            s->medium[i].pair3[1]=0;
            s->medium[i].pair3[0]=0;
        }
        if(s->small[i][0].pair[0]) {
            func_0201ef3c(s->small[i][0].p,s->small[i][0].tasks,s->small[i][0].pair);
            s->small[i][0].pair[1]=0;
            s->small[i][0].pair[0]=0;
        }
        if(s->small[i][1].pair[0]) {
            func_0201ef3c(s->small[i][1].p,s->small[i][1].tasks,s->small[i][1].pair);
            s->small[i][1].pair[1]=0;
            s->small[i][1].pair[0]=0;
        }
        for(j=0;j<5;j++) {
            if(s->large[i].pair[j][0]) {
                func_0201ef3c(s->large[i].p[j],s->large[i].tasks[j],s->large[i].pair[j]);
                s->large[i].pair[j][1]=0;
                s->large[i].pair[j][0]=0;
            }
        }
    }
    if(s->pair[0]) {
        func_0201ef3c(s->p,s->tasks,s->pair);
        s->pair[1]=0;
        s->pair[0]=0;
    }
    return 1;
}
