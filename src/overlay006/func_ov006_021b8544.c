typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;
typedef struct { u16 id; u8 count, pad; } Entry;
typedef struct { char pad[0x817e]; u16 counts[9]; } Hist;
typedef struct { char pad[0xc676]; s16 first[52]; char gap[0x1a0]; s16 second[52]; } Indices;
typedef struct { char pad[0xc662]; u16 count[5]; u16 total[5]; } Counts;
extern int func_0202b100(int);
extern unsigned int func_0202b878(int), func_0202b890(int), func_0202b8a8(int), func_0202b8c0(int);
extern int func_0202b950(int), func_0202b980(int);
extern unsigned short func_0202b9b0(unsigned short);
extern int func_0202bb20(int), func_0202bb78(int), func_0202de9c(int);
extern int func_ov006_021b8c50(char *), func_ov006_021b8cb8(char *), func_ov006_021b8d08(char *, int);
extern int func_ov006_021b9c98(int, int), func_ov006_021b9d58(int, int);
extern s16 data_ov006_0224f3e8[];
extern struct { int a; unsigned int mode:3; unsigned int rest:29; } data_02104f4c;
extern int data_ov006_021cb310[], data_ov006_021cb32c[];
int func_ov006_021b8544(char *base, int group) {
    Entry *out;
    int count, total, i, j, category, kind;
    Entry *p;
    Hist *hist;
    Indices *indices;
    switch(group) {
    case 0: p = (Entry *)(base + 0x9998); out = 0; break;
    case 1: out = (Entry *)(base + 0xb558); p = (Entry *)(base + 0xb358); break;
    case 2: out = (Entry *)(base + 0xbb58); p = (Entry *)(base + 0xb958); break;
    case 3: out = (Entry *)(base + 0xc158); p = (Entry *)(base + 0xbf58); break;
    case 4: out = (Entry *)(base + 0xc558); p = (Entry *)(base + 0xc458); break;
    }
    hist = (Hist *)(base + group * 18);
    count = ((Counts *)base)->count[group];
    total = 0;
    for (i=0; i<9; i++) hist->counts[i] = 0;
    indices = (Indices *)(base + group * 104);
    for (i=0; i<52; i++) {
        indices->first[i] = -1;
        indices->second[i] = -1;
    }
    if (data_ov006_0224f3e8[group] == 0 && data_02104f4c.mode == 0) func_ov006_021b8c50(base);
    for(i=0; i<count; i++, p++) {
        category = -1;
        switch(data_ov006_0224f3e8[group]) {
        case 0:
            if (data_02104f4c.mode == 0) {
                u8 *s = (u8 *)func_ov006_021b8d08(base, p->id);
                while (*(volatile u8 *)s) {
                    if (s[0] == 0x24 && s[1] == 0x52) {
                        s += 2;
                        while (*s != 0x28) s += 2;
                        s++;
                    } else if (s[0] == 0x81 && s[1] == 0x77) s += 2;
                    else break;
                }
                category = func_ov006_021b9c98((int)base, (u16)(s[1]|(*(volatile u8 *)s<<8)));
            } else category = func_ov006_021b9c98((int)base, *(u8 *)func_0202b100(p->id));
            break;
        case 1: category = func_0202de9c(p->id); break;
        case 2:
            if ((unsigned int)(func_0202de9c(p->id)-7)>1) category = func_ov006_021b9d58((int)base, (s16)func_0202b950(p->id));
            break;
        case 3:
            if ((unsigned int)(func_0202de9c(p->id)-7)>1) category = func_ov006_021b9d58((int)base, (s16)func_0202b980(p->id));
            break;
        case 6: category = func_0202b8a8(p->id); break;
        case 4: category = func_0202b890(p->id); break;
        case 5: category = func_0202b878(p->id); break;
        case 7:
            category = func_0202de9c(p->id);
            kind = func_0202b8c0(p->id);
            if (category == 7) category = data_ov006_021cb310[kind];
            else if (category == 8) category = data_ov006_021cb32c[kind];
            else category = -1;
            break;
        case 8: category = func_0202b9b0(p->id); break;
        case 9: category = func_0202bb78(p->id) != 0; break;
        }
        if (*(int *)(base+0x629c) != 0 && func_0202bb20(p->id) == 0) {
            if (data_ov006_0224f3e8[group] != 0 && data_ov006_0224f3e8[group] != 1) category = -1;
        }
        if (category >= 0) {
            if (*(s16 *)((char *)indices+category*2+0xc676)<0) {
                *(s16 *)((char *)indices+category*2+0xc676)=i;
                *(s16 *)((char *)indices+category*2+0xc87e)=total;
            }
        }
        if (group==0) total += p->count;
        else {
            for(j=0;j<p->count;j++) {
                Entry *dest = &out[total];
                dest->id = p->id;
                dest->count = 1;
                total++;
            }
        }
        category = func_0202de9c(p->id);
        kind = -1;
        switch(category) {
        case 0: kind=0; break;
        case 1: kind=1; break;
        case 2: kind=2; break;
        case 3: kind=3; break;
        case 7: kind=4; break;
        case 8: kind=5; break;
        }
        if (kind>=0) hist->counts[kind] += p->count;
        category = func_0202b8a8(p->id);
        kind = -1;
        if(category>=7) kind=8;
        else if(category>=5) kind=7;
        else if(category>=1) kind=6;
        if (kind>=0) hist->counts[kind] += p->count;
    }
    if (data_ov006_0224f3e8[group] == 0 && data_02104f4c.mode == 0) func_ov006_021b8cb8(base);
    ((Counts *)base)->total[group]=total;
    return 1;
}





