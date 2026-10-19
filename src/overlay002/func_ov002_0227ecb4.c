typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; } Entry;
extern struct { char pad[12]; u32 count; } data_ov002_022cdc78;
extern Entry data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int unused0);
extern unsigned int func_ov002_021b00d0(unsigned int x);
int func_ov002_0227ecb4(u32 target) {
    u32 i;
    u32 count = 0;
    for (i = 0; i < data_ov002_022cdc78.count; i++) {
        if (func_ov002_0227e76c(i) == 0) {
            if (target != data_ov002_022cdc88[i].id) count++;
        }
    }
    if (count == 0) {
        for (i = 0; i < data_ov002_022cdc78.count; i++) {
            if (func_ov002_0227e76c(i) == 0) return i;
        }
    } else {
        u32 pick = func_ov002_021b00d0(count);
        for (i = 0; i < data_ov002_022cdc78.count; i++) {
            if (func_ov002_0227e76c(i) == 0) {
                if (target != data_ov002_022cdc88[i].id) {
                    if (pick-- == 0) return i;
                }
            }
        }
    }
    return -1;
}

